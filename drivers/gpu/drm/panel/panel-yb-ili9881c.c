// SPDX-License-Identifier: GPL-2.0
/*
 * Raydium RM67191 MIPI-DSI panel driver
 *
 * Copyright 2019 NXP
 */

#include <linux/backlight.h>
#include <linux/delay.h>
#include <linux/gpio/consumer.h>
#include <linux/module.h>
#include <linux/of.h>
#include <linux/regulator/consumer.h>

#include <video/mipi_display.h>
#include <video/of_videomode.h>
#include <video/videomode.h>

#include <drm/drm_crtc.h>
#include <drm/drm_mipi_dsi.h>
#include <drm/drm_panel.h>
#include <drm/drm_print.h>

/* Panel specific color-format bits */
#define COL_FMT_16BPP 0x55
#define COL_FMT_18BPP 0x66
#define COL_FMT_24BPP 0x77

/* Write Manufacture Command Set Control */
#define WRMAUCCTR 0xFE

/* Manufacturer Command Set pages (CMD2) */
struct cmd_set_entry {
	u8 cmd;
	u8 param;
};

/*
 * There is no description in the Reference Manual about these commands.
 * We received them from vendor, so just use them as is.
 */
static const struct cmd_set_entry manufacturer_cmd_set[] = {
	{0xE0,0x00},
	{0xE1,0x93},
	{0xE2,0x65},
	{0xE3,0xF8},

	{0xE0,0x01},
	{0x00,0x11},
	{0x01,0x0C},//VCOM1
	{0x03,0x00},
	{0x04,0x00},//VCOM2
	{0x0C,0x74},

	{0x17,0x00},
	{0x18,0x77},///VGMP
	{0x19,0x01},//VGSP
	{0x1A,0x00},
	{0x1B,0xE7},//VGMN
	{0x1C,0x01},

	{0x1F,0x3E},//VGH_REG  15V
	{0x20,0x28},//VGL_REG  -11.2V
	{0x21,0x28},//VGL_REG2
	{0x22,0x7E},

	{0x24,0xFE},

	{0x35,0x26},
	{0x37,0x09},

	{0x38,0x04},
	{0x39,0x00},
	{0x3A,0x01},
	{0x3C,0x7C},
	{0x3D,0xFF},
	{0x3E,0xFF},
	{0x3F,0x7F},

	{0x40,0x06},
	{0x41,0xA0},
	{0x42,0x81},
	{0x43,0x08},
	{0x44,0x0B},
	{0x45,0x28},

	{0x55,0x02},
	{0x56,0x01},
	{0x57,0x25},
	{0x58,0x0A},
	{0x59,0x0A},
	{0x5A,0x06},
	{0x5B,0x06},
	{0x5C,0x15},

	{0x5D,0x7F},
	{0x5E,0x49},
	{0x5F,0x37},
	{0x60,0x28},
	{0x61,0x23},
	{0x62,0x13},
	{0x63,0x16},
	{0x64,0x00},
	{0x65,0x19},
	{0x66,0x18},
	{0x67,0x1A},
	{0x68,0x39},
	{0x69,0x2B},
	{0x6A,0x33},
	{0x6B,0x27},
	{0x6C,0x24},
	{0x6D,0x17},
	{0x6E,0x08},
	{0x6F,0x00},
	{0x70,0x7F},
	{0x71,0x49},
	{0x72,0x37},
	{0x73,0x28},
	{0x74,0x23},
	{0x75,0x13},
	{0x76,0x16},
	{0x77,0x00},
	{0x78,0x19},
	{0x79,0x18},
	{0x7A,0x1A},
	{0x7B,0x39},
	{0x7C,0x2B},
	{0x7D,0x33},
	{0x7E,0x27},
	{0x7F,0x24},
	{0x80,0x17},
	{0x81,0x08},
	{0x82,0x00},

	{0xE0,0x02},

	{0x00,0x1F},
	{0x01,0x1F},
	{0x02,0x1F},
	{0x03,0x40},
	{0x04,0x41},
	{0x05,0x5F},
	{0x06,0x5E},
	{0x07,0x5E},
	{0x08,0x50},
	{0x09,0x1F},
	{0x0A,0x1F},
	{0x0B,0x1F},
	{0x0C,0x1F},
	{0x0D,0x1F},
	{0x0E,0x1F},
	{0x0F,0x5F},
	{0x10,0x5F},
	{0x11,0x46},
	{0x12,0x47},
	{0x13,0x44},
	{0x14,0x45},
	{0x15,0x1F},

	{0x16,0x1F},
	{0x17,0x1F},
	{0x18,0x1F},
	{0x19,0x40},
	{0x1A,0x41},
	{0x1B,0x5F},
	{0x1C,0x5E},
	{0x1D,0x5E},
	{0x1E,0x50},
	{0x1F,0x1F},
	{0x20,0x1F},
	{0x21,0x1F},
	{0x22,0x1F},
	{0x23,0x1F},
	{0x24,0x1F},
	{0x25,0x5F},
	{0x26,0x5F},
	{0x27,0x46},
	{0x28,0x47},
	{0x29,0x44},
	{0x2A,0x45},
	{0x2B,0x1F},

	{0x2C,0x1F},
	{0x2D,0x1F},
	{0x2E,0x1F},
	{0x2F,0x41},
	{0x30,0x40},
	{0x31,0x5E},
	{0x32,0x5F},
	{0x33,0x5E},
	{0x34,0x50},
	{0x35,0x1F},
	{0x36,0x1F},
	{0x37,0x1F},
	{0x38,0x1F},
	{0x39,0x1F},
	{0x3A,0x1F},
	{0x3B,0x5F},
	{0x3C,0x5F},
	{0x3D,0x45},
	{0x3E,0x44},
	{0x3F,0x47},
	{0x40,0x46},
	{0x41,0x1F},

	{0x42,0x1F},
	{0x43,0x1F},
	{0x44,0x1F},
	{0x45,0x41},
	{0x46,0x40},
	{0x47,0x5E},
	{0x48,0x5F},
	{0x49,0x5E},
	{0x4A,0x50},
	{0x4B,0x1F},
	{0x4C,0x1F},
	{0x4D,0x1F},
	{0x4E,0x1F},
	{0x4F,0x1F},
	{0x50,0x1F},
	{0x51,0x5F},
	{0x52,0x5F},
	{0x53,0x45},
	{0x54,0x44},
	{0x55,0x47},
	{0x56,0x46},
	{0x57,0x1F},

	{0x58,0x40},
	{0x5B,0x10},
	{0x5C,0x08},
	{0x5D,0x10},
	{0x5E,0x01},
	{0x5F,0x02},
	{0x60,0x10},
	{0x63,0x04},
	{0x64,0x64},
	{0x65,0x50},
	{0x66,0x06},
	{0x67,0x30},
	{0x68,0x0A},
	{0x69,0x04},
	{0x6A,0x64},
	{0x6B,0x04},
	{0x6C,0x00},
	{0x6D,0x00},
	{0x6E,0x00},
	{0x6F,0x88},

	{0xE0,0x04},
	{0x02,0x23},
	{0x0E,0x48},
	{0x36,0x49},

	{0xE0,0x00},
	{0xE6,0x02},
	{0xE7,0x0C},

	{0x35,0x00},	
};

static const u32 yeebo_bus_formats[] = {
	MEDIA_BUS_FMT_RGB888_1X24,
	MEDIA_BUS_FMT_RGB666_1X18,
	MEDIA_BUS_FMT_RGB565_1X16,
};

static const u32 yeebo_bus_flags = DRM_BUS_FLAG_DE_LOW |
				 DRM_BUS_FLAG_PIXDATA_NEGEDGE;

struct yeebo_panel {
	struct drm_panel panel;
	struct mipi_dsi_device *dsi;

	struct gpio_desc *reset;
	struct gpio_desc *power_gpio;
	struct backlight_device *backlight;

	struct regulator_bulk_data *supplies;
	unsigned int num_supplies;

	bool prepared;
	bool enabled;
};

static const struct drm_display_mode default_mode = {
	.clock = 200000,
	.hdisplay = 1280,
	.hsync_start = 1280 + 18,
	.hsync_end = 1280 + 18 + 18,
	.htotal = 1280 + 18 + 18 + 18,
	.vdisplay = 800,
	.vsync_start = 800 + 12,
	.vsync_end = 800 + 12 + 4,
	.vtotal = 800 + 12 + 4 + 8,
	.vrefresh = 60,
	.width_mm = 68,
	.height_mm = 121,
	.flags = DRM_MODE_FLAG_NHSYNC |
		 DRM_MODE_FLAG_NVSYNC,
};

static inline struct yeebo_panel *to_yeebo_panel(struct drm_panel *panel)
{
	return container_of(panel, struct yeebo_panel, panel);
}

static int yeebo_panel_push_cmd_list(struct mipi_dsi_device *dsi)
{
	size_t i;
	size_t count = ARRAY_SIZE(manufacturer_cmd_set);
	int ret = 0;

	for (i = 0; i < count; i++) {
		const struct cmd_set_entry *entry = &manufacturer_cmd_set[i];
		u8 buffer[2] = { entry->cmd, entry->param };

		ret = mipi_dsi_generic_write(dsi, &buffer, sizeof(buffer));
		if (ret < 0)
			return ret;
	}

	return ret;
};

static int color_format_from_dsi_format(enum mipi_dsi_pixel_format format)
{
	switch (format) {
	case MIPI_DSI_FMT_RGB565:
		return COL_FMT_16BPP;
	case MIPI_DSI_FMT_RGB666:
	case MIPI_DSI_FMT_RGB666_PACKED:
		return COL_FMT_18BPP;
	case MIPI_DSI_FMT_RGB888:
		return COL_FMT_24BPP;
	default:
		return COL_FMT_24BPP; /* for backward compatibility */
	}
};

static int yeebo_panel_prepare(struct drm_panel *panel)
{
	struct yeebo_panel *yeebo = to_yeebo_panel(panel);
	int ret;

	if (yeebo->prepared)
		return 0;

	// ret = regulator_bulk_enable(yeebo->num_supplies, yeebo->supplies);
	// if (ret)
	// 	return ret;

	if (yeebo->reset && yeebo->power_gpio) {
	
		gpiod_set_value(yeebo->power_gpio, 1);
		msleep(20);
		gpiod_set_value(yeebo->reset, 1);
		msleep(10);

		/* And reset it */
		gpiod_set_value(yeebo->reset, 0);
		msleep(20);
		gpiod_set_value(yeebo->reset, 1);
		msleep(120);

		// gpiod_set_value_cansleep(yeebo->reset, 0);
		// usleep_range(18000, 20000);
	}

	yeebo->prepared = true;

	return 0;
}

static int yeebo_panel_unprepare(struct drm_panel *panel)
{
	struct yeebo_panel *yeebo = to_yeebo_panel(panel);
	int ret;

	if (!yeebo->prepared)
		return 0;

	/*
	 * Right after asserting the reset, we need to release it, so that the
	 * touch driver can have an active connection with the touch controller
	 * even after the display is turned off.
	 */
	if (yeebo->reset && yeebo->power_gpio) {
		gpiod_set_value(yeebo->reset, 0);
		msleep(20);
		gpiod_set_value(yeebo->reset, 1);
	}

	// ret = regulator_bulk_disable(yeebo->num_supplies, yeebo->supplies);
	// if (ret)
	// 	return ret;

	yeebo->prepared = false;

	return 0;
}

static int yeebo_panel_enable(struct drm_panel *panel)
{
	struct yeebo_panel *yeebo = to_yeebo_panel(panel);
	struct mipi_dsi_device *dsi = yeebo->dsi;
	struct device *dev = &dsi->dev;
	int color_format = color_format_from_dsi_format(dsi->format);
	int ret;

	if (yeebo->enabled)
		return 0;

	dsi->mode_flags |= MIPI_DSI_MODE_LPM;

	ret = yeebo_panel_push_cmd_list(dsi);
	if (ret < 0) {
		DRM_DEV_ERROR(dev, "Failed to send MCS (%d)\n", ret);
		goto fail;
	}

	//SLPOUT
	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
	if (ret)
		return ret;

	msleep(120);

	ret = mipi_dsi_dcs_set_display_on(dsi);
	if (ret)
		return ret;

	// /* Select User Command Set table (CMD1) */
	// ret = mipi_dsi_generic_write(dsi, (u8[]){ WRMAUCCTR, 0x00 }, 2);
	// if (ret < 0)
	// 	goto fail;

	// /* Software reset */
	// ret = mipi_dsi_dcs_soft_reset(dsi);
	// if (ret < 0) {
	// 	DRM_DEV_ERROR(dev, "Failed to do Software Reset (%d)\n", ret);
	// 	goto fail;
	// }

	// usleep_range(15000, 17000);

	// /* Set DSI mode */
	// ret = mipi_dsi_generic_write(dsi, (u8[]){ 0xC2, 0x0B }, 2);
	// if (ret < 0) {
	// 	DRM_DEV_ERROR(dev, "Failed to set DSI mode (%d)\n", ret);
	// 	goto fail;
	// }
	// /* Set tear ON */
	// ret = mipi_dsi_dcs_set_tear_on(dsi, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
	// if (ret < 0) {
	// 	DRM_DEV_ERROR(dev, "Failed to set tear ON (%d)\n", ret);
	// 	goto fail;
	// }
	// /* Set tear scanline */
	// ret = mipi_dsi_dcs_set_tear_scanline(dsi, 0x380);
	// if (ret < 0) {
	// 	DRM_DEV_ERROR(dev, "Failed to set tear scanline (%d)\n", ret);
	// 	goto fail;
	// }

	/* Set pixel format */
	ret = mipi_dsi_dcs_set_pixel_format(dsi, color_format);
	DRM_DEV_DEBUG_DRIVER(dev, "Interface color format set to 0x%x\n",
			     color_format);
	if (ret < 0) {
		DRM_DEV_ERROR(dev, "Failed to set pixel format (%d)\n", ret);
		goto fail;
	}
	/* Exit sleep mode */
	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
	if (ret < 0) {
		DRM_DEV_ERROR(dev, "Failed to exit sleep mode (%d)\n", ret);
		goto fail;
	}

	usleep_range(5000, 7000);

	ret = mipi_dsi_dcs_set_display_on(dsi);
	if (ret < 0) {
		DRM_DEV_ERROR(dev, "Failed to set display ON (%d)\n", ret);
		goto fail;
	}

	backlight_enable(yeebo->backlight);

	yeebo->enabled = true;

	return 0;

fail:
	gpiod_set_value_cansleep(yeebo->reset, 1);

	return ret;
}

static int yeebo_panel_disable(struct drm_panel *panel)
{
	struct yeebo_panel *yeebo = to_yeebo_panel(panel);
	struct mipi_dsi_device *dsi = yeebo->dsi;
	struct device *dev = &dsi->dev;
	int ret;

	if (!yeebo->enabled)
		return 0;

	dsi->mode_flags |= MIPI_DSI_MODE_LPM;

	backlight_disable(yeebo->backlight);

	usleep_range(10000, 12000);

	ret = mipi_dsi_dcs_set_display_off(dsi);
	if (ret < 0) {
		DRM_DEV_ERROR(dev, "Failed to set display OFF (%d)\n", ret);
		return ret;
	}

	usleep_range(5000, 10000);

	ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
	if (ret < 0) {
		DRM_DEV_ERROR(dev, "Failed to enter sleep mode (%d)\n", ret);
		return ret;
	}

	yeebo->enabled = false;

	return 0;
}

static int yeebo_panel_get_modes(struct drm_panel *panel)
{
	struct drm_connector *connector = panel->connector;
	struct drm_display_mode *mode;

	mode = drm_mode_duplicate(panel->drm, &default_mode);
	if (!mode) {
		DRM_DEV_ERROR(panel->dev, "failed to add mode %ux%ux@%u\n",
			      default_mode.hdisplay, default_mode.vdisplay,
			      default_mode.vrefresh);
		return -ENOMEM;
	}

	drm_mode_set_name(mode);
	mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
	drm_mode_probed_add(panel->connector, mode);

	connector->display_info.width_mm = mode->width_mm;
	connector->display_info.height_mm = mode->height_mm;
	connector->display_info.bus_flags = yeebo_bus_flags;

	drm_display_info_set_bus_formats(&connector->display_info,
					 yeebo_bus_formats,
					 ARRAY_SIZE(yeebo_bus_formats));
	return 1;
}

static int yeebo_bl_get_brightness(struct backlight_device *bl)
{
	struct mipi_dsi_device *dsi = bl_get_data(bl);
	struct yeebo_panel *yeebo = mipi_dsi_get_drvdata(dsi);
	u16 brightness;
	int ret;

	if (!yeebo->prepared)
		return 0;

	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;

	ret = mipi_dsi_dcs_get_display_brightness(dsi, &brightness);
	if (ret < 0)
		return ret;

	bl->props.brightness = brightness;

	return brightness & 0xff;
}

static int yeebo_bl_update_status(struct backlight_device *bl)
{
	struct mipi_dsi_device *dsi = bl_get_data(bl);
	struct yeebo_panel *yeebo = mipi_dsi_get_drvdata(dsi);
	int ret = 0;

	if (!yeebo->prepared)
		return 0;

	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;

	ret = mipi_dsi_dcs_set_display_brightness(dsi, bl->props.brightness);
	if (ret < 0)
		return ret;

	return 0;
}

static const struct backlight_ops yeebo_bl_ops = {
	.update_status = yeebo_bl_update_status,
	.get_brightness = yeebo_bl_get_brightness,
};

static const struct drm_panel_funcs yeebo_panel_funcs = {
	.prepare = yeebo_panel_prepare,
	.unprepare = yeebo_panel_unprepare,
	.enable = yeebo_panel_enable,
	.disable = yeebo_panel_disable,
	.get_modes = yeebo_panel_get_modes,
};

static const char * const yeebo_supply_names[] = {
	"v3p3",
	"v1p8",
};

static int yeebo_init_regulators(struct yeebo_panel *yeebo)
{
	struct device *dev = &yeebo->dsi->dev;
	int i;

	yeebo->num_supplies = ARRAY_SIZE(yeebo_supply_names);
	yeebo->supplies = devm_kcalloc(dev, yeebo->num_supplies,
				     sizeof(*yeebo->supplies), GFP_KERNEL);
	if (!yeebo->supplies)
		return -ENOMEM;

	for (i = 0; i < yeebo->num_supplies; i++)
		yeebo->supplies[i].supply = yeebo_supply_names[i];

	return devm_regulator_bulk_get(dev, yeebo->num_supplies, yeebo->supplies);
};

static int yeebo_panel_probe(struct mipi_dsi_device *dsi)
{
	struct device *dev = &dsi->dev;
	struct device_node *np = dev->of_node;
	struct yeebo_panel *panel;
	struct backlight_properties bl_props;
	int ret;
	u32 video_mode;

	panel = devm_kzalloc(&dsi->dev, sizeof(*panel), GFP_KERNEL);
	if (!panel)
		return -ENOMEM;

	mipi_dsi_set_drvdata(dsi, panel);

	panel->dsi = dsi;

	dsi->format = MIPI_DSI_FMT_RGB888;
	dsi->mode_flags =  MIPI_DSI_MODE_VIDEO_HSE | MIPI_DSI_MODE_VIDEO  | MIPI_DSI_MODE_LPM ;

	ret = of_property_read_u32(np, "video-mode", &video_mode);
	if (!ret) {
		switch (video_mode) {
		case 0:
			/* burst mode */
			dsi->mode_flags |= MIPI_DSI_MODE_VIDEO_BURST;
			break;
		case 1:
			/* non-burst mode with sync event */
			break;
		case 2:
			/* non-burst mode with sync pulse */
			dsi->mode_flags |= MIPI_DSI_MODE_VIDEO_SYNC_PULSE;
			break;
		default:
			dev_warn(dev, "invalid video mode %d\n", video_mode);
			break;
		}
	}

	ret = of_property_read_u32(np, "dsi-lanes", &dsi->lanes);
	if (ret) {
		dev_err(dev, "Failed to get dsi-lanes property (%d)\n", ret);
		return ret;
	}

	panel->reset = devm_gpiod_get_optional(dev, "reset",
					       GPIOD_OUT_LOW |
					       GPIOD_FLAGS_BIT_NONEXCLUSIVE);
	if (IS_ERR(panel->reset)) {
		ret = PTR_ERR(panel->reset);
		dev_err(dev, "Failed to get reset gpio (%d)\n", ret);
		return ret;
	}
	gpiod_set_value(panel->reset, 1);

	panel->power_gpio = devm_gpiod_get_optional(dev, "powergpio",
					       GPIOD_OUT_LOW |
					       GPIOD_FLAGS_BIT_NONEXCLUSIVE);
	if (IS_ERR(panel->power_gpio)) {
		ret = PTR_ERR(panel->power_gpio);
		dev_err(dev, "Failed to get power_gpio gpio (%d)\n", ret);
		return ret;
	}
	gpiod_set_value(panel->power_gpio, 1);

	memset(&bl_props, 0, sizeof(bl_props));
	bl_props.type = BACKLIGHT_RAW;
	bl_props.brightness = 255;
	bl_props.max_brightness = 255;

	panel->backlight = devm_backlight_device_register(dev, dev_name(dev),
							  dev, dsi, &yeebo_bl_ops,
							  &bl_props);
	if (IS_ERR(panel->backlight)) {
		ret = PTR_ERR(panel->backlight);
		dev_err(dev, "Failed to register backlight (%d)\n", ret);
		return ret;
	}

	// ret = yeebo_init_regulators(panel);
	// if (ret)
	// 	return ret;

	drm_panel_init(&panel->panel);
	panel->panel.funcs = &yeebo_panel_funcs;
	panel->panel.dev = dev;
	dev_set_drvdata(dev, panel);

	ret = drm_panel_add(&panel->panel);
	if (ret)
		return ret;

	ret = mipi_dsi_attach(dsi);
	if (ret)
		drm_panel_remove(&panel->panel);

	return ret;
}

static int yeebo_panel_remove(struct mipi_dsi_device *dsi)
{
	struct yeebo_panel *yeebo = mipi_dsi_get_drvdata(dsi);
	struct device *dev = &dsi->dev;
	int ret;

	ret = mipi_dsi_detach(dsi);
	if (ret)
		DRM_DEV_ERROR(dev, "Failed to detach from host (%d)\n",
			      ret);

	drm_panel_remove(&yeebo->panel);

	return 0;
}

static void yeebo_panel_shutdown(struct mipi_dsi_device *dsi)
{
	struct yeebo_panel *yeebo = mipi_dsi_get_drvdata(dsi);

	yeebo_panel_disable(&yeebo->panel);
	yeebo_panel_unprepare(&yeebo->panel);
}

static const struct of_device_id yeebo_of_match[] = {
	{ .compatible = "raydium,rm67191", },
	{ /* sentinel */ }
};
MODULE_DEVICE_TABLE(of, yeebo_of_match);

static struct mipi_dsi_driver yeebo_panel_driver = {
	.driver = {
		.name = "panel-raydium-rm67191",
		.of_match_table = yeebo_of_match,
	},
	.probe = yeebo_panel_probe,
	.remove = yeebo_panel_remove,
	.shutdown = yeebo_panel_shutdown,
};
module_mipi_dsi_driver(yeebo_panel_driver);

MODULE_AUTHOR("Robert Chiras <robert.chiras@nxp.com>");
MODULE_DESCRIPTION("DRM Driver for Raydium RM67191 MIPI DSI panel");
MODULE_LICENSE("GPL v2");
