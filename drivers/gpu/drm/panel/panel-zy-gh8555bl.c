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

/*
 * There is no description in the Reference Manual about these commands.
 * We received them from vendor, so just use them as is.
 */
static const struct cmd_set_entry manufacturer_cmd_set[] = {
{0xee, 1, {0x50}},
{0xea, 2, {0x85,0x55}},
{0x30, 1, {0x00}},
{0x90, 2, {0x50,0x20}},
{0x99, 1, {0x00}},
{0x97, 1, {0x0c}},
{0x23, 1, {0x00}},
{0x24, 1, {0xa0}},
{0x80, 1, {0x10}},
{0x81, 1, {0x50}},
{0x79, 1, {0x08}},
{0x7a, 1, {0x20}},
{0x56, 1, {0x03}},
{0x93, 1, {0x5e}},
{0x95, 1, {0x70}},
{0x22, 1, {0x00}},
{0x25, 1, {0x40}},
{0xee, 1, {0x60}}, 
{0x21, 1, {0x01}}, 
{0x27, 1, {0x21}},
{0x28, 1, {0x12}},
{0x29, 2, {0x8a,0x24}},
{0x2c, 1, {0xf9}},
{0x30, 1, {0x01}},
{0x32, 1, {0xf9}},
{0x3b, 1, {0x00}},
{0x3C, 1, {0x28}},
{0x3d, 2, {0x11,0x93}},
{0x42, 2, {0x55,0x55}},
{0x86, 1, {0x20}},
{0x91, 1, {0x11}},
{0x92, 1, {0x22}},
{0x93, 1, {0x9f}},
{0x9a, 1, {0x00}}, 
{0x9b, 2, {0x02,0x80}},
{0x47, 5, {0x15,0x29,0x39,0x45,0x4f}},
{0x5a, 5, {0x15,0x29,0x39,0x45,0x4f}},
{0x4c, 5, {0x5a,0x50,0x60,0x40,0x3e}},   
{0x5f, 5, {0x5a,0x50,0x60,0x40,0x3e}}, 
{0x51, 5, {0x3d,0x23,0x37,0x33,0x41}}, 
{0x64, 5, {0x3d,0x23,0x37,0x33,0x41}},  
{0x56, 4, {0x43,0x4f,0x5f,0x7f}}, 
{0x69, 4, {0x43,0x4f,0x5f,0x7f}},  
{0xee, 1, {0x70}},  
{0x00, 4, {0x08,0x0b,0x00,0x01}},  
{0x04, 4, {0x08,0x0b,0x55,0x01}},  
{0x08, 4, {0x0b,0x0e,0x55,0x01}},  
{0x0c, 2, {0x02,0x60}},//d9  c0 d0
{0x10, 5, {0x0a,0x0d,0x00,0x00,0x00}}, 
{0x15, 4, {0x00,0x1f,0x0d,0x0c}},  
{0x20, 5, {0x11,0x14,0x00,0x00,0x00}}, 
{0x25, 4, {0x00,0x1f,0x0d,0x0c}},  
{0x29, 2, {0x02,0x60}},//d9   02 d0
{0x46, 5, {0xff,0x00,0x00,0x00,0x40}},  
{0x4b, 1, {0x88}}, 
{0x30, 6, {0x12,0x13,0x55,0xdd,0xdd,0x3c}},
{0x36, 6, {0x12,0x13,0x55,0xdd,0xdd,0x3c}},
{0x60, 5, {0x08,0x3c,0x3c,0x04,0x21}},
{0x65, 5, {0x20,0x3c,0x1a,0x18,0x3c}},
{0x6a, 5, {0x16,0x14,0x3c,0x12,0x10}},
{0x6f, 5, {0x00,0x3c,0x3c,0x3c,0x3c}},
{0x74, 2, {0x3c,0x3c}},
{0x80, 5, {0x09,0x3c,0x3c,0x05,0x21}},
{0x85, 5, {0x20,0x3c,0x1b,0x19,0x3c}},
{0x8a, 5, {0x17,0x15,0x3c,0x13,0x11}},
{0x8f, 5, {0x01,0x3c,0x3c,0x3c,0x3c}},
{0x94, 2, {0x3c,0x3c}},
{0xea, 2, {0x00,0x00}},
{0xee, 1, {0x00}},		
};

static const u32 zhunyi_bus_formats[] = {
	MEDIA_BUS_FMT_RGB888_1X24,
	MEDIA_BUS_FMT_RGB666_1X18,
	MEDIA_BUS_FMT_RGB565_1X16,
};

static const u32 zhunyi_bus_flags = DRM_BUS_FLAG_DE_LOW |
				 DRM_BUS_FLAG_PIXDATA_NEGEDGE;

struct zhunyi_panel {
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
	.clock = 68215,

	.vdisplay = 1280,
	.vsync_start = 1280 + 30,
	.vsync_end = 1280 + 30 + 4,
	.vtotal = 1280 + 30 + 4 + 8,

	.hdisplay = 800,
	.hsync_start = 800 + 20,
	.hsync_end = 800 + 20 + 20,
	.htotal = 800 + 20 + 20 + 20,

	.vrefresh = 60,
	.width_mm = 120,
	.height_mm = 160,
	.flags = 0,
};

static inline struct zhunyi_panel *to_zhunyi_panel(struct drm_panel *panel)
{
	return container_of(panel, struct zhunyi_panel, panel);
}

static int zhunyi_panel_push_cmd_list(struct mipi_dsi_device *dsi)
{
	size_t i;
	size_t count = ARRAY_SIZE(manufacturer_cmd_set);
//	struct device *dev = &dsi->dev;
	int ret = 0;
//	u32 panel_id = 0;
	
	//  ret = mipi_dsi_dcs_get_display_identification(dsi, &panel_id);
	//  DRM_DEV_INFO(dev, "display ID:%#x ret:%d\n", panel_id, ret);

	for (i = 0; i < count; i++) {
		const struct cmd_set_entry *entry = &manufacturer_cmd_set[i];
		if(  entry->size > sizeof(entry->param) )
			continue;
	
		ret = mipi_dsi_dcs_write(dsi, entry->cmd, entry->param, entry->size);			
		 if (ret < 0)
		 	break;		
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

static int zhunyi_panel_prepare(struct drm_panel *panel)
{
	struct zhunyi_panel *zhunyi = to_zhunyi_panel(panel);

	if (zhunyi->prepared)
		return 0;

	// ret = regulator_bulk_enable(zhunyi->num_supplies, zhunyi->supplies);
	// if (ret)
	// 	return ret;

	if (zhunyi->reset && zhunyi->power_gpio) {
		// gpiod_set_value(zhunyi->power_gpio, 0);
		// msleep(120);
		gpiod_set_value(zhunyi->power_gpio, 1);
		msleep(20);
		gpiod_set_value(zhunyi->reset, 1);
		msleep(10);

		/* And reset it */
		gpiod_set_value(zhunyi->reset, 0);
		msleep(20);
		gpiod_set_value(zhunyi->reset, 1);
		msleep(120);

		// gpiod_set_value_cansleep(zhunyi->reset, 0);
		// usleep_range(18000, 20000);
	}

	zhunyi->prepared = true;

	return 0;
}

static int zhunyi_panel_unprepare(struct drm_panel *panel)
{
	struct zhunyi_panel *zhunyi = to_zhunyi_panel(panel);

	if (!zhunyi->prepared)
		return 0;

	/*
	 * Right after asserting the reset, we need to release it, so that the
	 * touch driver can have an active connection with the touch controller
	 * even after the display is turned off.
	 */
	if (zhunyi->reset && zhunyi->power_gpio) {
		gpiod_set_value(zhunyi->reset, 0);
		msleep(20);
		gpiod_set_value(zhunyi->reset, 1);
	}

	// ret = regulator_bulk_disable(zhunyi->num_supplies, zhunyi->supplies);
	// if (ret)
	// 	return ret;

	zhunyi->prepared = false;

	return 0;
}

static int zhunyi_panel_enable(struct drm_panel *panel)
{
	struct zhunyi_panel *zhunyi = to_zhunyi_panel(panel);
	struct mipi_dsi_device *dsi = zhunyi->dsi;
	struct device *dev = &dsi->dev;	
	int ret = 0;

	DRM_DEV_INFO(dev, "entry zhunyi panel enable!\n");
	if (zhunyi->enabled)
		return 0;

	dsi->mode_flags |= MIPI_DSI_MODE_LPM;

	ret = zhunyi_panel_push_cmd_list(dsi);
	if (ret < 0) {
		DRM_DEV_ERROR(dev, "Failed to send MCS (%d)\n", ret);
		goto fail;
	}

	//SLPOUT
	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
	if (ret)
		return ret;

	msleep(200);

	ret = mipi_dsi_dcs_set_display_on(dsi);
	if (ret)
		return ret;

	DRM_DEV_INFO(dev, "zhunyi_panel_enable success!\n");
	
	msleep(100);

	backlight_enable(zhunyi->backlight);

	zhunyi->enabled = true;

	return 0;

fail:
	gpiod_set_value_cansleep(zhunyi->reset, 1);

	return ret;
}

static int zhunyi_panel_disable(struct drm_panel *panel)
{
	struct zhunyi_panel *zhunyi = to_zhunyi_panel(panel);
	struct mipi_dsi_device *dsi = zhunyi->dsi;
	struct device *dev = &dsi->dev;
	int ret;

	if (!zhunyi->enabled)
		return 0;

	dsi->mode_flags |= MIPI_DSI_MODE_LPM;

	backlight_disable(zhunyi->backlight);

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

	zhunyi->enabled = false;

	return 0;
}

static int zhunyi_panel_get_modes(struct drm_panel *panel)
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
	connector->display_info.bus_flags = zhunyi_bus_flags;

	drm_display_info_set_bus_formats(&connector->display_info,
					 zhunyi_bus_formats,
					 ARRAY_SIZE(zhunyi_bus_formats));
	return 1;
}

static int zhunyi_bl_get_brightness(struct backlight_device *bl)
{
	struct mipi_dsi_device *dsi = bl_get_data(bl);
	struct zhunyi_panel *zhunyi = mipi_dsi_get_drvdata(dsi);
	u16 brightness;
	int ret;

	if (!zhunyi->prepared)
		return 0;

	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;

	ret = mipi_dsi_dcs_get_display_brightness(dsi, &brightness);
	if (ret < 0)
		return ret;

	bl->props.brightness = brightness;

	return brightness & 0xff;
}

static int zhunyi_bl_update_status(struct backlight_device *bl)
{
	struct mipi_dsi_device *dsi = bl_get_data(bl);
	struct zhunyi_panel *zhunyi = mipi_dsi_get_drvdata(dsi);
	int ret = 0;

	if (!zhunyi->prepared)
		return 0;

	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;

	ret = mipi_dsi_dcs_set_display_brightness(dsi, bl->props.brightness);
	if (ret < 0)
		return ret;

	return 0;
}

static const struct backlight_ops zhunyi_bl_ops = {
	.update_status = zhunyi_bl_update_status,
	.get_brightness = zhunyi_bl_get_brightness,
};

static const struct drm_panel_funcs zhunyi_panel_funcs = {
	.prepare = zhunyi_panel_prepare,
	.unprepare = zhunyi_panel_unprepare,
	.enable = zhunyi_panel_enable,
	.disable = zhunyi_panel_disable,
	.get_modes = zhunyi_panel_get_modes,
};

static const char * const zhunyi_supply_names[] = {
	"v3p3",
	"v1p8",
};


#if 0
static int zhunyi_init_regulators(struct zhunyi_panel *zhunyi)
{
	struct device *dev = &zhunyi->dsi->dev;
	int i;

	zhunyi->num_supplies = ARRAY_SIZE(zhunyi_supply_names);
	zhunyi->supplies = devm_kcalloc(dev, zhunyi->num_supplies,
				     sizeof(*zhunyi->supplies), GFP_KERNEL);
	if (!zhunyi->supplies)
		return -ENOMEM;

	for (i = 0; i < zhunyi->num_supplies; i++)
		zhunyi->supplies[i].supply = zhunyi_supply_names[i];

	return devm_regulator_bulk_get(dev, zhunyi->num_supplies, zhunyi->supplies);
};
#endif

static int zhunyi_panel_probe(struct mipi_dsi_device *dsi)
{
	struct device *dev = &dsi->dev;
	struct device_node *np = dev->of_node;
	struct zhunyi_panel *panel;
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
	dsi->mode_flags = MIPI_DSI_MODE_VIDEO_SYNC_PULSE | MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_LPM;
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
	// memset(&bl_props, 0, sizeof(bl_props));
	// bl_props.type = BACKLIGHT_RAW;
	// bl_props.brightness = 255;
	// bl_props.max_brightness = 255;

	// panel->backlight = devm_backlight_device_register(dev, dev_name(dev),
	// 						  dev, dsi, &zhunyi_bl_ops,
	// 						  &bl_props);
	// if (IS_ERR(panel->backlight)) {
	// 	ret = PTR_ERR(panel->backlight);
	// 	dev_err(dev, "Failed to register backlight (%d)\n", ret);
	// 	return ret;
	// }

	// ret = zhunyi_init_regulators(panel);
	// if (ret)
	// 	return ret;

	drm_panel_init(&panel->panel);
	panel->panel.funcs = &zhunyi_panel_funcs;
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

static int zhunyi_panel_remove(struct mipi_dsi_device *dsi)
{
	struct zhunyi_panel *zhunyi = mipi_dsi_get_drvdata(dsi);
	struct device *dev = &dsi->dev;
	int ret;

	ret = mipi_dsi_detach(dsi);
	if (ret)
		DRM_DEV_ERROR(dev, "Failed to detach from host (%d)\n",
			      ret);

	drm_panel_remove(&zhunyi->panel);

	return 0;
}

static void zhunyi_panel_shutdown(struct mipi_dsi_device *dsi)
{
	struct zhunyi_panel *zhunyi = mipi_dsi_get_drvdata(dsi);

	zhunyi_panel_disable(&zhunyi->panel);
	zhunyi_panel_unprepare(&zhunyi->panel);
}

static const struct of_device_id zhunyi_of_match[] = {
	{ .compatible = "zhunyi,gh8555bl", },
	{ /* sentinel */ }
};
MODULE_DEVICE_TABLE(of, zhunyi_of_match);

static struct mipi_dsi_driver zhunyi_panel_driver = {
	.driver = {
		.name = "panel-zhunyi-gh8555bl",
		.of_match_table = zhunyi_of_match,
	},
	.probe = zhunyi_panel_probe,
	.remove = zhunyi_panel_remove,
	.shutdown = zhunyi_panel_shutdown,
};
module_mipi_dsi_driver(zhunyi_panel_driver);

MODULE_AUTHOR("Richard <zhanz@topband.com.cn>");
MODULE_DESCRIPTION("DRM Driver for zhunyi gh8555bl MIPI DSI panel");
MODULE_LICENSE("GPL v2");
