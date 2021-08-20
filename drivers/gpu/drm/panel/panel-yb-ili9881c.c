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
	u8 size;
	u8 param[6];
};

typedef enum {
	YEEBO_PANEL = 0,
	ZHUNYI_PANEL,
	MAX_DISPLAY_PANEL,
}teDisplayPanelType;

teDisplayPanelType current_display_panle = YEEBO_PANEL;

u32 display_identification[MAX_DISPLAY_PANEL] = {0x00, 0x00};

/*
 * There is no description in the Reference Manual about these commands.
 * We received them from vendor, so just use them as is.
 */
static const struct cmd_set_entry yeebo_cmd_set[] = {
	{0xE0, 1, {0x00}},
	{0xE1, 1, {0x93}},
	{0xE2, 1, {0x65}},
	{0xE3, 1, {0xF8}},

	{0xE0, 1, {0x01}},
	{0x00, 1, {0x11}},
	{0x01, 1, {0x0C}},//VCOM1
	{0x03, 1, {0x00}},
	{0x04, 1, {0x00}},//VCOM2
	{0x0C, 1, {0x74}},

	{0x17, 1, {0x00}},
	{0x18, 1, {0x77}},///VGMP
	{0x19, 1, {0x01}},//VGSP
	{0x1A, 1, {0x00}},
	{0x1B, 1, {0xE7}},//VGMN
	{0x1C, 1, {0x01}},

	{0x1F, 1, {0x3E}},//VGH_REG  15V
	{0x20, 1, {0x28}},//VGL_REG  -11.2V
	{0x21, 1, {0x28}},//VGL_REG2
	{0x22, 1, {0x7E}},

	{0x24, 1, {0xFE}},

	{0x35, 1, {0x26}},
	{0x37, 1, {0x09}},

	{0x38, 1, {0x04}},
	{0x39, 1, {0x00}},
	{0x3A, 1, {0x01}},
	{0x3C, 1, {0x7C}},
	{0x3D, 1, {0xFF}},
	{0x3E, 1, {0xFF}},
	{0x3F, 1, {0x7F}},

	{0x40, 1, {0x06}},
	{0x41, 1, {0xA0}},
	{0x42, 1, {0x81}},
	{0x43, 1, {0x08}},
	{0x44, 1, {0x0B}},
	{0x45, 1, {0x28}},

	{0x55, 1, {0x02}},
	{0x56, 1, {0x01}},
	{0x57, 1, {0x25}},
	{0x58, 1, {0x0A}},
	{0x59, 1, {0x0A}},
	{0x5A, 1, {0x06}},
	{0x5B, 1, {0x06}},
	{0x5C, 1, {0x15}},

	{0x5D, 1, {0x7F}},
	{0x5E, 1, {0x49}},
	{0x5F, 1, {0x37}},
	{0x60, 1, {0x28}},
	{0x61, 1, {0x23}},
	{0x62, 1, {0x13}},
	{0x63, 1, {0x16}},
	{0x64, 1, {0x00}},
	{0x65, 1, {0x19}},
	{0x66, 1, {0x18}},
	{0x67, 1, {0x1A}},
	{0x68, 1, {0x39}},
	{0x69, 1, {0x2B}},
	{0x6A, 1, {0x33}},
	{0x6B, 1, {0x27}},
	{0x6C, 1, {0x24}},
	{0x6D, 1, {0x17}},
	{0x6E, 1, {0x08}},
	{0x6F, 1, {0x00}},
	{0x70, 1, {0x7F}},
	{0x71, 1, {0x49}},
	{0x72, 1, {0x37}},
	{0x73, 1, {0x28}},
	{0x74, 1, {0x23}},
	{0x75, 1, {0x13}},
	{0x76, 1, {0x16}},
	{0x77, 1, {0x00}},
	{0x78, 1, {0x19}},
	{0x79, 1, {0x18}},
	{0x7A, 1, {0x1A}},
	{0x7B, 1, {0x39}},
	{0x7C, 1, {0x2B}},
	{0x7D, 1, {0x33}},
	{0x7E, 1, {0x27}},
	{0x7F, 1, {0x24}},
	{0x80, 1, {0x17}},
	{0x81, 1, {0x08}},
	{0x82, 1, {0x00}},

	{0xE0, 1, {0x02}},

	{0x00, 1, {0x1F}},
	{0x01, 1, {0x1F}},
	{0x02, 1, {0x1F}},
	{0x03, 1, {0x40}},
	{0x04, 1, {0x41}},
	{0x05, 1, {0x5F}},
	{0x06, 1, {0x5E}},
	{0x07, 1, {0x5E}},
	{0x08, 1, {0x50}},
	{0x09, 1, {0x1F}},
	{0x0A, 1, {0x1F}},
	{0x0B, 1, {0x1F}},
	{0x0C, 1, {0x1F}},
	{0x0D, 1, {0x1F}},
	{0x0E, 1, {0x1F}},
	{0x0F, 1, {0x5F}},
	{0x10, 1, {0x5F}},
	{0x11, 1, {0x46}},
	{0x12, 1, {0x47}},
	{0x13, 1, {0x44}},
	{0x14, 1, {0x45}},
	{0x15, 1, {0x1F}},

	{0x16, 1, {0x1F}},
	{0x17, 1, {0x1F}},
	{0x18, 1, {0x1F}},
	{0x19, 1, {0x40}},
	{0x1A, 1, {0x41}},
	{0x1B, 1, {0x5F}},
	{0x1C, 1, {0x5E}},
	{0x1D, 1, {0x5E}},
	{0x1E, 1, {0x50}},
	{0x1F, 1, {0x1F}},
	{0x20, 1, {0x1F}},
	{0x21, 1, {0x1F}},
	{0x22, 1, {0x1F}},
	{0x23, 1, {0x1F}},
	{0x24, 1, {0x1F}},
	{0x25, 1, {0x5F}},
	{0x26, 1, {0x5F}},
	{0x27, 1, {0x46}},
	{0x28, 1, {0x47}},
	{0x29, 1, {0x44}},
	{0x2A, 1, {0x45}},
	{0x2B, 1, {0x1F}},

	{0x2C, 1, {0x1F}},
	{0x2D, 1, {0x1F}},
	{0x2E, 1, {0x1F}},
	{0x2F, 1, {0x41}},
	{0x30, 1, {0x40}},
	{0x31, 1, {0x5E}},
	{0x32, 1, {0x5F}},
	{0x33, 1, {0x5E}},
	{0x34, 1, {0x50}},
	{0x35, 1, {0x1F}},
	{0x36, 1, {0x1F}},
	{0x37, 1, {0x1F}},
	{0x38, 1, {0x1F}},
	{0x39, 1, {0x1F}},
	{0x3A, 1, {0x1F}},
	{0x3B, 1, {0x5F}},
	{0x3C, 1, {0x5F}},
	{0x3D, 1, {0x45}},
	{0x3E, 1, {0x44}},
	{0x3F, 1, {0x47}},
	{0x40, 1, {0x46}},
	{0x41, 1, {0x1F}},

	{0x42, 1, {0x1F}},
	{0x43, 1, {0x1F}},
	{0x44, 1, {0x1F}},
	{0x45, 1, {0x41}},
	{0x46, 1, {0x40}},
	{0x47, 1, {0x5E}},
	{0x48, 1, {0x5F}},
	{0x49, 1, {0x5E}},
	{0x4A, 1, {0x50}},
	{0x4B, 1, {0x1F}},
	{0x4C, 1, {0x1F}},
	{0x4D, 1, {0x1F}},
	{0x4E, 1, {0x1F}},
	{0x4F, 1, {0x1F}},
	{0x50, 1, {0x1F}},
	{0x51, 1, {0x5F}},
	{0x52, 1, {0x5F}},
	{0x53, 1, {0x45}},
	{0x54, 1, {0x44}},
	{0x55, 1, {0x47}},
	{0x56, 1, {0x46}},
	{0x57, 1, {0x1F}},

	{0x58, 1, {0x40}},
	{0x5B, 1, {0x10}},
	{0x5C, 1, {0x08}},
	{0x5D, 1, {0x10}},
	{0x5E, 1, {0x01}},
	{0x5F, 1, {0x02}},
	{0x60, 1, {0x10}},
	{0x63, 1, {0x04}},
	{0x64, 1, {0x64}},
	{0x65, 1, {0x50}},
	{0x66, 1, {0x06}},
	{0x67, 1, {0x30}},
	{0x68, 1, {0x0A}},
	{0x69, 1, {0x04}},
	{0x6A, 1, {0x64}},
	{0x6B, 1, {0x04}},
	{0x6C, 1, {0x00}},
	{0x6D, 1, {0x00}},
	{0x6E, 1, {0x00}},
	{0x6F, 1, {0x88}},

	{0xE0, 1, {0x04}},
	{0x02, 1, {0x23}},
	{0x0E, 1, {0x48}},
	{0x36, 1, {0x49}},

	{0xE0, 1, {0x00}},
	{0xE6, 1, {0x02}},
	{0xE7, 1, {0x0C}},

	{0x35, 1, {0x00}},	
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
	.clock = 68587,

	.vdisplay = 1280,
	.vsync_start = 1280 + 3,
	.vsync_end = 1280 + 3 + 8,
	.vtotal = 1280 + 3 + 8 + 8,

	.hdisplay = 800,
	.hsync_start = 800 + 40,
	.hsync_end = 800 + 40 + 20,
	.htotal = 800 + 40 + 20 + 20,

	.vrefresh = 60,
	.width_mm = 120,
	.height_mm = 160,
	.flags = 0,
};

static inline struct yeebo_panel *to_yeebo_panel(struct drm_panel *panel)
{
	return container_of(panel, struct yeebo_panel, panel);
}

static int yeebo_panel_push_cmd_list(struct mipi_dsi_device *dsi)
{
	size_t i;
	size_t count = ARRAY_SIZE(yeebo_cmd_set);
	int ret = 0;

	for (i = 0; i < count; i++) {
		const struct cmd_set_entry *entry = &yeebo_cmd_set[i];		
		ret = mipi_dsi_dcs_write(dsi, entry->cmd, entry->param, entry->size);		
		if (ret < 0)
			return ret;	
			
	}

	return ret;
};

#if 0
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
#endif

static int yeebo_panel_prepare(struct drm_panel *panel)
{
	struct yeebo_panel *yeebo = to_yeebo_panel(panel);

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
	//int color_format = color_format_from_dsi_format(dsi->format);
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

	DRM_DEV_INFO(dev, "yeebo_panel_enable success!\n");
	
	msleep(5);

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


#if 0
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
#endif

static int yeebo_panel_probe(struct mipi_dsi_device *dsi)
{
	struct device *dev = &dsi->dev;
	struct device_node *np = dev->of_node;
	struct yeebo_panel *panel;
//	struct backlight_properties bl_props;
	int ret;
//	u32 video_mode;

	panel = devm_kzalloc(&dsi->dev, sizeof(*panel), GFP_KERNEL);
	if (!panel)
		return -ENOMEM;

	mipi_dsi_set_drvdata(dsi, panel);

	panel->dsi = dsi;
	dsi->format = MIPI_DSI_FMT_RGB888;
//	dsi->mode_flags =  MIPI_DSI_MODE_VIDEO_HSE | MIPI_DSI_MODE_VIDEO  | MIPI_DSI_MODE_LPM ;
	dsi->mode_flags = MIPI_DSI_MODE_VIDEO_SYNC_PULSE | MIPI_DSI_MODE_VIDEO_HSE | MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_LPM;
	// ret = of_property_read_u32(np, "video-mode", &video_mode);
	// if (!ret) {
	// 	switch (video_mode) {
	// 	case 0:
	// 		/* burst mode */
	// 		dsi->mode_flags |= MIPI_DSI_MODE_VIDEO_BURST;
	// 		break;
	// 	case 1:
	// 		/* non-burst mode with sync event */
	// 		break;
	// 	case 2:
	// 		/* non-burst mode with sync pulse */
	// 		dsi->mode_flags |= MIPI_DSI_MODE_VIDEO_SYNC_PULSE;
	// 		break;
	// 	default:
	// 		dev_warn(dev, "invalid video mode %d\n", video_mode);
	// 		break;
	// 	}
	// }

	ret = of_property_read_u32(np, "dsi-lanes", &dsi->lanes);
	if (ret) {
		dev_err(dev, "Failed to get dsi-lanes property (%d)\n", ret);
		return ret;
	}

	panel->reset = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
	if (IS_ERR(panel->reset)) {
		ret = PTR_ERR(panel->reset);
		dev_err(dev, "Failed to get reset gpio (%d)\n", ret);
		return ret;
	}

	panel->power_gpio = devm_gpiod_get(dev, "powergpio",GPIOD_OUT_LOW);
	if (IS_ERR(panel->power_gpio)) {
		ret = PTR_ERR(panel->power_gpio);
		dev_err(dev, "Failed to get power_gpio gpio (%d)\n", ret);
		return ret;
	}


	np = of_parse_phandle(dsi->dev.of_node, "backlight", 0);
	if (np) {
		panel->backlight = of_find_backlight_by_node(np);
		of_node_put(np);

		if (!panel->backlight)
		{
			dev_err(dev, "Failed to find backlight!\n");
			return -EPROBE_DEFER;
		}
	}

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
	{ .compatible = "yeebo,yeebo-ili9881c", },
	{ /* sentinel */ }
};
MODULE_DEVICE_TABLE(of, yeebo_of_match);

static struct mipi_dsi_driver yeebo_panel_driver = {
	.driver = {
		.name = "panel-yeebo-ili9881c",
		.of_match_table = yeebo_of_match,
	},
	.probe = yeebo_panel_probe,
	.remove = yeebo_panel_remove,
	.shutdown = yeebo_panel_shutdown,
};
module_mipi_dsi_driver(yeebo_panel_driver);

MODULE_AUTHOR("Richard <zhanz@topband.com.cn>");
MODULE_DESCRIPTION("DRM Driver for yeebo ili9881c MIPI DSI panel");
MODULE_LICENSE("GPL v2");
