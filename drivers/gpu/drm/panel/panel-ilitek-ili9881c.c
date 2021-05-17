// SPDX-License-Identifier: GPL-2.0
/*
 * Copyright (C) 2017-2018, Bootlin
 */

#include <linux/backlight.h>
#include <linux/delay.h>
#include <linux/device.h>
#include <linux/err.h>
#include <linux/errno.h>
#include <linux/fb.h>
#include <linux/kernel.h>
#include <linux/module.h>

#include <linux/gpio/consumer.h>
#include <linux/regulator/consumer.h>
#include <linux/media-bus-format.h>

#include <drm/drm_mipi_dsi.h>
#include <drm/drm_modes.h>
#include <drm/drm_panel.h>

#include <video/mipi_display.h>

struct ili9881c {
	struct drm_panel	panel;
	struct mipi_dsi_device	*dsi;

	struct backlight_device *backlight;
	struct regulator	*power;
	struct gpio_desc	*reset;
	struct gpio_desc *power_gpio;

};

enum ili9881c_op {
	ILI9881C_SWITCH_PAGE,
	ILI9881C_COMMAND,
};

struct ili9881c_instr {
	enum ili9881c_op	op;

	union arg {
		struct cmd {
			u8	cmd;
			u8	data;
		} cmd;
		u8	page;
	} arg;
};

#define ILI9881C_SWITCH_PAGE_INSTR(_page)	\
	{					\
		.op = ILI9881C_SWITCH_PAGE,	\
		.arg = {			\
			.page = (_page),	\
		},				\
	}

#define ILI9881C_COMMAND_INSTR(_cmd, _data)		\
	{						\
		.op = ILI9881C_COMMAND,		\
		.arg = {				\
			.cmd = {			\
				.cmd = (_cmd),		\
				.data = (_data),	\
			},				\
		},					\
	}

static const struct ili9881c_instr ili9881c_init[] = {
	ILI9881C_COMMAND_INSTR(0xE0,0x00),
	ILI9881C_COMMAND_INSTR(0xE1,0x93),
	ILI9881C_COMMAND_INSTR(0xE2,0x65),
	ILI9881C_COMMAND_INSTR(0xE3,0xF8),

	ILI9881C_COMMAND_INSTR(0xE0,0x01),
	ILI9881C_COMMAND_INSTR(0x00,0x11),
	ILI9881C_COMMAND_INSTR(0x01,0x0C),//VCOM1
	ILI9881C_COMMAND_INSTR(0x03,0x00),
	ILI9881C_COMMAND_INSTR(0x04,0x00),//VCOM2
	ILI9881C_COMMAND_INSTR(0x0C,0x74),

	ILI9881C_COMMAND_INSTR(0x17,0x00),
	ILI9881C_COMMAND_INSTR(0x18,0x77),///VGMP
	ILI9881C_COMMAND_INSTR(0x19,0x01),//VGSP
	ILI9881C_COMMAND_INSTR(0x1A,0x00),
	ILI9881C_COMMAND_INSTR(0x1B,0xE7),//VGMN
	ILI9881C_COMMAND_INSTR(0x1C,0x01),

	ILI9881C_COMMAND_INSTR(0x1F,0x3E),//VGH_REG  15V
	ILI9881C_COMMAND_INSTR(0x20,0x28),//VGL_REG  -11.2V
	ILI9881C_COMMAND_INSTR(0x21,0x28),//VGL_REG2
	ILI9881C_COMMAND_INSTR(0x22,0x7E),

	ILI9881C_COMMAND_INSTR(0x24,0xFE),

	ILI9881C_COMMAND_INSTR(0x35,0x26),
	ILI9881C_COMMAND_INSTR(0x37,0x09),

	ILI9881C_COMMAND_INSTR(0x38,0x04),
	ILI9881C_COMMAND_INSTR(0x39,0x00),
	ILI9881C_COMMAND_INSTR(0x3A,0x01),
	ILI9881C_COMMAND_INSTR(0x3C,0x7C),
	ILI9881C_COMMAND_INSTR(0x3D,0xFF),
	ILI9881C_COMMAND_INSTR(0x3E,0xFF),
	ILI9881C_COMMAND_INSTR(0x3F,0x7F),

	ILI9881C_COMMAND_INSTR(0x40,0x06),
	ILI9881C_COMMAND_INSTR(0x41,0xA0),
	ILI9881C_COMMAND_INSTR(0x42,0x81),
	ILI9881C_COMMAND_INSTR(0x43,0x08),
	ILI9881C_COMMAND_INSTR(0x44,0x0B),
	ILI9881C_COMMAND_INSTR(0x45,0x28),

	ILI9881C_COMMAND_INSTR(0x55,0x02),
	ILI9881C_COMMAND_INSTR(0x56,0x01),
	ILI9881C_COMMAND_INSTR(0x57,0x25),
	ILI9881C_COMMAND_INSTR(0x58,0x0A),
	ILI9881C_COMMAND_INSTR(0x59,0x0A),
	ILI9881C_COMMAND_INSTR(0x5A,0x06),
	ILI9881C_COMMAND_INSTR(0x5B,0x06),
	ILI9881C_COMMAND_INSTR(0x5C,0x15),

	ILI9881C_COMMAND_INSTR(0x5D,0x7F),
	ILI9881C_COMMAND_INSTR(0x5E,0x49),
	ILI9881C_COMMAND_INSTR(0x5F,0x37),
	ILI9881C_COMMAND_INSTR(0x60,0x28),
	ILI9881C_COMMAND_INSTR(0x61,0x23),
	ILI9881C_COMMAND_INSTR(0x62,0x13),
	ILI9881C_COMMAND_INSTR(0x63,0x16),
	ILI9881C_COMMAND_INSTR(0x64,0x00),
	ILI9881C_COMMAND_INSTR(0x65,0x19),
	ILI9881C_COMMAND_INSTR(0x66,0x18),
	ILI9881C_COMMAND_INSTR(0x67,0x1A),
	ILI9881C_COMMAND_INSTR(0x68,0x39),
	ILI9881C_COMMAND_INSTR(0x69,0x2B),
	ILI9881C_COMMAND_INSTR(0x6A,0x33),
	ILI9881C_COMMAND_INSTR(0x6B,0x27),
	ILI9881C_COMMAND_INSTR(0x6C,0x24),
	ILI9881C_COMMAND_INSTR(0x6D,0x17),
	ILI9881C_COMMAND_INSTR(0x6E,0x08),
	ILI9881C_COMMAND_INSTR(0x6F,0x00),
	ILI9881C_COMMAND_INSTR(0x70,0x7F),
	ILI9881C_COMMAND_INSTR(0x71,0x49),
	ILI9881C_COMMAND_INSTR(0x72,0x37),
	ILI9881C_COMMAND_INSTR(0x73,0x28),
	ILI9881C_COMMAND_INSTR(0x74,0x23),
	ILI9881C_COMMAND_INSTR(0x75,0x13),
	ILI9881C_COMMAND_INSTR(0x76,0x16),
	ILI9881C_COMMAND_INSTR(0x77,0x00),
	ILI9881C_COMMAND_INSTR(0x78,0x19),
	ILI9881C_COMMAND_INSTR(0x79,0x18),
	ILI9881C_COMMAND_INSTR(0x7A,0x1A),
	ILI9881C_COMMAND_INSTR(0x7B,0x39),
	ILI9881C_COMMAND_INSTR(0x7C,0x2B),
	ILI9881C_COMMAND_INSTR(0x7D,0x33),
	ILI9881C_COMMAND_INSTR(0x7E,0x27),
	ILI9881C_COMMAND_INSTR(0x7F,0x24),
	ILI9881C_COMMAND_INSTR(0x80,0x17),
	ILI9881C_COMMAND_INSTR(0x81,0x08),
	ILI9881C_COMMAND_INSTR(0x82,0x00),

	ILI9881C_COMMAND_INSTR(0xE0,0x02),

	ILI9881C_COMMAND_INSTR(0x00,0x1F),
	ILI9881C_COMMAND_INSTR(0x01,0x1F),
	ILI9881C_COMMAND_INSTR(0x02,0x1F),
	ILI9881C_COMMAND_INSTR(0x03,0x40),
	ILI9881C_COMMAND_INSTR(0x04,0x41),
	ILI9881C_COMMAND_INSTR(0x05,0x5F),
	ILI9881C_COMMAND_INSTR(0x06,0x5E),
	ILI9881C_COMMAND_INSTR(0x07,0x5E),
	ILI9881C_COMMAND_INSTR(0x08,0x50),
	ILI9881C_COMMAND_INSTR(0x09,0x1F),
	ILI9881C_COMMAND_INSTR(0x0A,0x1F),
	ILI9881C_COMMAND_INSTR(0x0B,0x1F),
	ILI9881C_COMMAND_INSTR(0x0C,0x1F),
	ILI9881C_COMMAND_INSTR(0x0D,0x1F),
	ILI9881C_COMMAND_INSTR(0x0E,0x1F),
	ILI9881C_COMMAND_INSTR(0x0F,0x5F),
	ILI9881C_COMMAND_INSTR(0x10,0x5F),
	ILI9881C_COMMAND_INSTR(0x11,0x46),
	ILI9881C_COMMAND_INSTR(0x12,0x47),
	ILI9881C_COMMAND_INSTR(0x13,0x44),
	ILI9881C_COMMAND_INSTR(0x14,0x45),
	ILI9881C_COMMAND_INSTR(0x15,0x1F),

	ILI9881C_COMMAND_INSTR(0x16,0x1F),
	ILI9881C_COMMAND_INSTR(0x17,0x1F),
	ILI9881C_COMMAND_INSTR(0x18,0x1F),
	ILI9881C_COMMAND_INSTR(0x19,0x40),
	ILI9881C_COMMAND_INSTR(0x1A,0x41),
	ILI9881C_COMMAND_INSTR(0x1B,0x5F),
	ILI9881C_COMMAND_INSTR(0x1C,0x5E),
	ILI9881C_COMMAND_INSTR(0x1D,0x5E),
	ILI9881C_COMMAND_INSTR(0x1E,0x50),
	ILI9881C_COMMAND_INSTR(0x1F,0x1F),
	ILI9881C_COMMAND_INSTR(0x20,0x1F),
	ILI9881C_COMMAND_INSTR(0x21,0x1F),
	ILI9881C_COMMAND_INSTR(0x22,0x1F),
	ILI9881C_COMMAND_INSTR(0x23,0x1F),
	ILI9881C_COMMAND_INSTR(0x24,0x1F),
	ILI9881C_COMMAND_INSTR(0x25,0x5F),
	ILI9881C_COMMAND_INSTR(0x26,0x5F),
	ILI9881C_COMMAND_INSTR(0x27,0x46),
	ILI9881C_COMMAND_INSTR(0x28,0x47),
	ILI9881C_COMMAND_INSTR(0x29,0x44),
	ILI9881C_COMMAND_INSTR(0x2A,0x45),
	ILI9881C_COMMAND_INSTR(0x2B,0x1F),

	ILI9881C_COMMAND_INSTR(0x2C,0x1F),
	ILI9881C_COMMAND_INSTR(0x2D,0x1F),
	ILI9881C_COMMAND_INSTR(0x2E,0x1F),
	ILI9881C_COMMAND_INSTR(0x2F,0x41),
	ILI9881C_COMMAND_INSTR(0x30,0x40),
	ILI9881C_COMMAND_INSTR(0x31,0x5E),
	ILI9881C_COMMAND_INSTR(0x32,0x5F),
	ILI9881C_COMMAND_INSTR(0x33,0x5E),
	ILI9881C_COMMAND_INSTR(0x34,0x50),
	ILI9881C_COMMAND_INSTR(0x35,0x1F),
	ILI9881C_COMMAND_INSTR(0x36,0x1F),
	ILI9881C_COMMAND_INSTR(0x37,0x1F),
	ILI9881C_COMMAND_INSTR(0x38,0x1F),
	ILI9881C_COMMAND_INSTR(0x39,0x1F),
	ILI9881C_COMMAND_INSTR(0x3A,0x1F),
	ILI9881C_COMMAND_INSTR(0x3B,0x5F),
	ILI9881C_COMMAND_INSTR(0x3C,0x5F),
	ILI9881C_COMMAND_INSTR(0x3D,0x45),
	ILI9881C_COMMAND_INSTR(0x3E,0x44),
	ILI9881C_COMMAND_INSTR(0x3F,0x47),
	ILI9881C_COMMAND_INSTR(0x40,0x46),
	ILI9881C_COMMAND_INSTR(0x41,0x1F),

	ILI9881C_COMMAND_INSTR(0x42,0x1F),
	ILI9881C_COMMAND_INSTR(0x43,0x1F),
	ILI9881C_COMMAND_INSTR(0x44,0x1F),
	ILI9881C_COMMAND_INSTR(0x45,0x41),
	ILI9881C_COMMAND_INSTR(0x46,0x40),
	ILI9881C_COMMAND_INSTR(0x47,0x5E),
	ILI9881C_COMMAND_INSTR(0x48,0x5F),
	ILI9881C_COMMAND_INSTR(0x49,0x5E),
	ILI9881C_COMMAND_INSTR(0x4A,0x50),
	ILI9881C_COMMAND_INSTR(0x4B,0x1F),
	ILI9881C_COMMAND_INSTR(0x4C,0x1F),
	ILI9881C_COMMAND_INSTR(0x4D,0x1F),
	ILI9881C_COMMAND_INSTR(0x4E,0x1F),
	ILI9881C_COMMAND_INSTR(0x4F,0x1F),
	ILI9881C_COMMAND_INSTR(0x50,0x1F),
	ILI9881C_COMMAND_INSTR(0x51,0x5F),
	ILI9881C_COMMAND_INSTR(0x52,0x5F),
	ILI9881C_COMMAND_INSTR(0x53,0x45),
	ILI9881C_COMMAND_INSTR(0x54,0x44),
	ILI9881C_COMMAND_INSTR(0x55,0x47),
	ILI9881C_COMMAND_INSTR(0x56,0x46),
	ILI9881C_COMMAND_INSTR(0x57,0x1F),

	ILI9881C_COMMAND_INSTR(0x58,0x40),
	ILI9881C_COMMAND_INSTR(0x5B,0x10),
	ILI9881C_COMMAND_INSTR(0x5C,0x08),
	ILI9881C_COMMAND_INSTR(0x5D,0x10),
	ILI9881C_COMMAND_INSTR(0x5E,0x01),
	ILI9881C_COMMAND_INSTR(0x5F,0x02),
	ILI9881C_COMMAND_INSTR(0x60,0x10),
	ILI9881C_COMMAND_INSTR(0x63,0x04),
	ILI9881C_COMMAND_INSTR(0x64,0x64),
	ILI9881C_COMMAND_INSTR(0x65,0x50),
	ILI9881C_COMMAND_INSTR(0x66,0x06),
	ILI9881C_COMMAND_INSTR(0x67,0x30),
	ILI9881C_COMMAND_INSTR(0x68,0x0A),
	ILI9881C_COMMAND_INSTR(0x69,0x04),
	ILI9881C_COMMAND_INSTR(0x6A,0x64),
	ILI9881C_COMMAND_INSTR(0x6B,0x04),
	ILI9881C_COMMAND_INSTR(0x6C,0x00),
	ILI9881C_COMMAND_INSTR(0x6D,0x00),
	ILI9881C_COMMAND_INSTR(0x6E,0x00),
	ILI9881C_COMMAND_INSTR(0x6F,0x88),

	ILI9881C_COMMAND_INSTR(0xE0,0x04),
	ILI9881C_COMMAND_INSTR(0x02,0x23),
	ILI9881C_COMMAND_INSTR(0x0E,0x48),
	ILI9881C_COMMAND_INSTR(0x36,0x49),

	ILI9881C_COMMAND_INSTR(0xE0,0x00),
	ILI9881C_COMMAND_INSTR(0xE6,0x02),
	ILI9881C_COMMAND_INSTR(0xE7,0x0C),

	ILI9881C_COMMAND_INSTR(0x35,0x00),	
};

static inline struct ili9881c *panel_to_ili9881c(struct drm_panel *panel)
{
	return container_of(panel, struct ili9881c, panel);
}

/*
 * The panel seems to accept some private DCS commands that map
 * directly to registers.
 *
 * It is organised by page, with each page having its own set of
 * registers, and the first page looks like it's holding the standard
 * DCS commands.
 *
 * So before any attempt at sending a command or data, we have to be
 * sure if we're in the right page or not.
 */
static int ili9881c_switch_page(struct ili9881c *ctx, u8 page)
{
	u8 buf[4] = { 0xff, 0x98, 0x81, page };
	int ret;

	ret = mipi_dsi_dcs_write_buffer(ctx->dsi, buf, sizeof(buf));
	if (ret < 0)
		return ret;

	return 0;
}

static int ili9881c_send_cmd_data(struct ili9881c *ctx, u8 cmd, u8 data)
{
	u8 buf[2] = { cmd, data };
	int ret;

	ret = mipi_dsi_dcs_write_buffer(ctx->dsi, buf, sizeof(buf));
	if (ret < 0)
		return ret;

	return 0;
}

static int ili9881c_prepare(struct drm_panel *panel)
{
	struct ili9881c *ctx = panel_to_ili9881c(panel);
	struct device *dev = &ctx->dsi->dev;
	unsigned int i;
	int ret = 0;

	if( ctx->reset == NULL || ctx->power_gpio == NULL )
		return -EIO;

	/* Power the panel */
	// ret = regulator_enable(ctx->power);
	// if (ret)
	// 	return ret;

	gpiod_set_value(ctx->power_gpio, 0);
	gpiod_set_value(ctx->reset, 1);

	msleep(20);
	gpiod_set_value(ctx->power_gpio, 1);

	msleep(20);

	/* And reset it */
	gpiod_set_value(ctx->reset, 0);
	msleep(20);
	gpiod_set_value(ctx->reset, 1);
	msleep(120);

#if 0
	for (i = 0; i < ARRAY_SIZE(ili9881c_init); i++) {
		const struct ili9881c_instr *instr = &ili9881c_init[i];

		for(retry = 0 ; retry < 3; retry++)
		{
			if (instr->op == ILI9881C_SWITCH_PAGE)
				ret = ili9881c_switch_page(ctx, instr->arg.page);
			else if (instr->op == ILI9881C_COMMAND)
				ret = ili9881c_send_cmd_data(ctx, instr->arg.cmd.cmd,
								instr->arg.cmd.data);
			msleep(10)
		}
		if (ret)
		{
			dev_err(dev, "count:%d Send cmd:%#x  dta:%#x failed, ret=%d\n",
				i, instr->arg.cmd.cmd, instr->arg.cmd.data, ret);
			return ret;
		}
			
	}
	
	//SLPOUT
	ret = mipi_dsi_dcs_exit_sleep_mode(ctx->dsi);
	if (ret)
		return ret;

	msleep(120);

	ret = mipi_dsi_dcs_set_display_on(ctx->dsi);
	if (ret)
		return ret;
#endif

	msleep(5);

	return 0;
}

static int ili9881c_enable(struct drm_panel *panel)
{
	struct ili9881c *ctx = panel_to_ili9881c(panel);
	int ret = 0, i = 0;

	msleep(120);

	int retry = 0;
	for (i = 0; i < ARRAY_SIZE(ili9881c_init); i++) {
	const struct ili9881c_instr *instr = &ili9881c_init[i];

	for(retry = 0 ; retry < 3; retry++)
	{
		if (instr->op == ILI9881C_SWITCH_PAGE)
			ret = ili9881c_switch_page(ctx, instr->arg.page);
		else if (instr->op == ILI9881C_COMMAND)
			ret = ili9881c_send_cmd_data(ctx, instr->arg.cmd.cmd,
							instr->arg.cmd.data);
	
	}
	
	if (ret)
	{
		dev_err(&ctx->dsi->dev, "count:%d Send cmd:%#x  dta:%#x failed, ret=%d\n",
			i, instr->arg.cmd.cmd, instr->arg.cmd.data, ret);
		return ret;
	}
		
}

	ret = mipi_dsi_dcs_set_display_on(ctx->dsi);
		
	backlight_enable(ctx->backlight);

	return 0;
}

static int ili9881c_disable(struct drm_panel *panel)
{
	struct ili9881c *ctx = panel_to_ili9881c(panel);

	//backlight_disable(ctx->backlight);
	return mipi_dsi_dcs_set_display_off(ctx->dsi);
}

static int ili9881c_unprepare(struct drm_panel *panel)
{
	struct ili9881c *ctx = panel_to_ili9881c(panel);

	mipi_dsi_dcs_enter_sleep_mode(ctx->dsi);
	regulator_disable(ctx->power);
	dev_err(&ctx->dsi->dev, "%s\n", __func__);
	gpiod_set_value(ctx->reset, 0);
	msleep(5);
	gpiod_set_value(ctx->power_gpio, 0);
	msleep(2);
	
	return 0;
}

static const struct drm_display_mode bananapi_default_mode = {
	.clock		= 200000,
	.vrefresh	= 60,

	.hdisplay	= 1280,
	.hsync_start	= 1280 + 18,
	.hsync_end	= 1280 + 18 + 18,
	.htotal		= 1280 + 18 + 18 + 18,

	.vdisplay	= 800,
	.vsync_start	= 800 + 12,
	.vsync_end	= 800 + 12 + 4,
	.vtotal		= 800 + 12 + 4 + 8,

};

static int ili9881c_get_modes(struct drm_panel *panel)
{
	struct drm_connector *connector = panel->connector;
	struct ili9881c *ctx = panel_to_ili9881c(panel);
	struct drm_display_mode *mode;
	u32 bus_format = MEDIA_BUS_FMT_RGB888_1X24;
	int ret;

	mode = drm_mode_duplicate(panel->drm, &bananapi_default_mode);
	if (!mode) {
		dev_err(&ctx->dsi->dev, "failed to add mode %ux%ux@%u\n",
			bananapi_default_mode.hdisplay,
			bananapi_default_mode.vdisplay,
			bananapi_default_mode.vrefresh);
		return -ENOMEM;
	}

	drm_mode_set_name(mode);

	ret = drm_display_info_set_bus_formats(&connector->display_info,
										   &bus_format, 1);
	if (ret)
	return ret;

	mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
	drm_mode_probed_add(connector, mode);

	panel->connector->display_info.width_mm = 62;
	panel->connector->display_info.height_mm = 110;


	return 1;
}

static const struct drm_panel_funcs ili9881c_funcs = {
	.prepare	= ili9881c_prepare,
	.unprepare	= ili9881c_unprepare,
	.enable		= ili9881c_enable,
	.disable	= ili9881c_disable,
	.get_modes	= ili9881c_get_modes,
};

static int ili9881c_panel_bl_update_status(struct backlight_device *bl)
{
	struct mipi_dsi_device *dsi = bl_get_data(bl);
	int ret = 0;

	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;

	ret = mipi_dsi_dcs_set_display_brightness(dsi, bl->props.brightness);
	dev_err(&dsi->dev, "\n\n!!!%s brightness：%d  ret:%d!!!\n\n", __func__, bl->props.brightness, ret);
	if (ret < 0)
		return ret;

	return 0;
}

static int ili9881c_panel_bl_get_brightness(struct backlight_device *bl)
{
	struct mipi_dsi_device *dsi = bl_get_data(bl);
	u16 brightness;
	int ret;

	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;

	ret = mipi_dsi_dcs_get_display_brightness(dsi, &brightness);
	if (ret < 0)
		return ret;

	bl->props.brightness = brightness;

	return brightness & 0xff;
}

static const struct backlight_ops tc358775_bl_ops = {
	.update_status = ili9881c_panel_bl_update_status,
	.get_brightness = ili9881c_panel_bl_get_brightness,
};


static int ili9881c_dsi_probe(struct mipi_dsi_device *dsi)
{
	struct device_node *np;
	struct ili9881c *ctx;
	struct device *dev = &dsi->dev;
	struct backlight_properties bl_props;
	int ret;

	ctx = devm_kzalloc(&dsi->dev, sizeof(*ctx), GFP_KERNEL);
	if (!ctx)
		return -ENOMEM;
	mipi_dsi_set_drvdata(dsi, ctx);
	ctx->dsi = dsi;

	drm_panel_init(&ctx->panel);
	ctx->panel.dev = &dsi->dev;
	ctx->panel.funcs = &ili9881c_funcs;
	
	dev_err(&dsi->dev, "\n ||||||start||||||\n\n\n");

	ctx->reset = devm_gpiod_get(&dsi->dev, "reset", GPIOD_OUT_LOW);
	if (IS_ERR(ctx->reset)) {
		dev_err(&dsi->dev, "Couldn't get our reset GPIO\n");
		return PTR_ERR(ctx->reset);
	}
	
	ctx->power_gpio = devm_gpiod_get(&dsi->dev, "powergpio", GPIOD_OUT_LOW);
	if (IS_ERR(ctx->power_gpio)) {
		dev_err(&dsi->dev, "Couldn't get our power GPIO\n");
		return PTR_ERR(ctx->power_gpio);
	}
	
	// np = of_parse_phandle(dsi->dev.of_node, "backlight", 0);
	// if (np) {
	// 	ctx->backlight = of_find_backlight_by_node(np);
	// 	of_node_put(np);

	// 	if (!ctx->backlight)
	// 		return -EPROBE_DEFER;
	// }

	memset(&bl_props, 0, sizeof(bl_props));
	bl_props.type = BACKLIGHT_RAW;
	bl_props.brightness = 255;
	bl_props.max_brightness = 255;

	ctx->backlight = devm_backlight_device_register(dev, dev_name(dev),
							  dev, dsi, &tc358775_bl_ops,
							  &bl_props);
	if (IS_ERR(ctx->backlight)) {
		ret = PTR_ERR(ctx->backlight);
		dev_err(dev, "Failed to register backlight (%d)\n", ret);
		return ret;
	}

	ret = drm_panel_add(&ctx->panel);
	if (ret < 0)
		return ret;

	//dsi->mode_flags = MIPI_DSI_MODE_VIDEO_SYNC_PULSE;
	//	dsi->mode_flags = MIPI_DSI_MODE_VIDEO_SYNC_PULSE;
	
	dsi->mode_flags =  MIPI_DSI_MODE_VIDEO_HSE | MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_VIDEO_SYNC_PULSE | MIPI_DSI_MODE_LPM;
	dsi->format = MIPI_DSI_FMT_RGB888;
	dsi->lanes = 4;

	dev_err(&dsi->dev, "\n ||||||end||||||\n\n\n");

	backlight_enable(ctx->backlight);
	
	return mipi_dsi_attach(dsi);
}

static int ili9881c_dsi_remove(struct mipi_dsi_device *dsi)
{
	struct ili9881c *ctx = mipi_dsi_get_drvdata(dsi);

	mipi_dsi_detach(dsi);
	drm_panel_remove(&ctx->panel);

	if (ctx->backlight)
		put_device(&ctx->backlight->dev);

	return 0;
}

static const struct of_device_id ili9881c_of_match[] = {
	{ .compatible = "bananapi,lhr050h41" },
	{ .compatible = "ilitek,ili9881c" },
	{ }
};
MODULE_DEVICE_TABLE(of, ili9881c_of_match);

static struct mipi_dsi_driver ili9881c_dsi_driver = {
	.probe		= ili9881c_dsi_probe,
	.remove		= ili9881c_dsi_remove,
	.driver = {
		.name		= "panel-ilitek-ili9881c",
		.of_match_table	= ili9881c_of_match,
	},
};

module_mipi_dsi_driver(ili9881c_dsi_driver);

MODULE_AUTHOR("Maxime Ripard <maxime.ripard@free-electrons.com>");
MODULE_DESCRIPTION("Ilitek ILI9881C Controller Driver");
MODULE_LICENSE("GPL v2");
