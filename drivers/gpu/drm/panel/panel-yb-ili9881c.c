/*
 * MYiR drm driver -  MIPI-DSI panel driver
 *
 * Copyright 2019 MYiR Devices
 *
 */

#include <drm/drmP.h>
#include <drm/drm_crtc.h>
#include <drm/drm_mipi_dsi.h>
#include <drm/drm_panel.h>
#include <linux/gpio/consumer.h>
#include <linux/module.h>
#include <linux/of.h>
#include <linux/regulator/consumer.h>
#include <video/mipi_display.h>
#include <video/of_videomode.h>
#include <video/videomode.h>
#include <linux/gpio.h>
#include <linux/of_gpio.h>
#include <linux/regmap.h>

#include <drm/bridge/sec_mipi_dsim.h>


#define UPDATE(x, h, l) (((x) << (l)) & GENMASK((h), (l)))

/* DSI PHY Layer Registers */
#define D0W_DPHYCONTTX 0x0004
#define CLW_DPHYCONTRX 0x0020
#define D0W_DPHYCONTRX 0x0024
#define D1W_DPHYCONTRX 0x0028
#define D2W_DPHYCONTRX 0x002C
#define D3W_DPHYCONTRX 0x0030
#define COM_DPHYCONTRX 0x0038
#define CLW_CNTRL 0x0040
#define D0W_CNTRL 0x0044
#define D1W_CNTRL 0x0048
#define D2W_CNTRL 0x004C
#define D3W_CNTRL 0x0050
#define DFTMODE_CNTRL 0x0054
/* DSI PPI Layer Registers */
#define PPI_STARTPPI 0x0104
#define STARTPPI BIT(0)
#define PPI_BUSYPPI 0x0108
#define PPI_LINEINITCNT 0x0110
#define PPI_LPTXTIMECNT 0x0114
#define LPTXCNT(x) UPDATE(x, 10, 0)
#define PPI_LANEENABLE 0x0134
#define L3EN BIT(4)
#define L2EN BIT(3)
#define L1EN BIT(2)
#define L0EN BIT(1)
#define CLEN BIT(0)
#define PPI_TX_RX_TA 0x013C
#define TXTAGOCNT(x) UPDATE(x, 26, 16)
#define TXTASURECNT(x) UPDATE(x, 10, 0)
#define PPI_CLS_ATMR 0x0140
#define PPI_D0S_ATMR 0x0144
#define PPI_D1S_ATMR 0x0148
#define PPI_D2S_ATMR 0x014C
#define PPI_D3S_ATMR 0x0150
#define PPI_D0S_CLRSIPOCOUNT 0x0164
#define D0S_CLRSIPOCOUNT(x) UPDATE(x, 5, 0)
#define PPI_D1S_CLRSIPOCOUNT 0x0168
#define D1S_CLRSIPOCOUNT(x) UPDATE(x, 5, 0)
#define PPI_D2S_CLRSIPOCOUNT 0x016C
#define D2S_CLRSIPOCOUNT(x) UPDATE(x, 5, 0)
#define PPI_D3S_CLRSIPOCOUNT 0x0170
#define D3S_CLRSIPOCOUNT(x) UPDATE(x, 5, 0)
#define CLS_PRE 0x0180
#define D0S_PRE 0x0184
#define D1S_PRE 0x0188
#define D2S_PRE 0x018C
#define D3S_PRE 0x0190
#define CLS_PREP 0x01A0
#define D0S_PREP 0x01A4
#define D1S_PREP 0x01A8
#define D2S_PREP 0x01AC
#define D3S_PREP 0x01B0
#define CLS_ZERO 0x01C0
#define D0S_ZERO 0x01C4
#define D1S_ZERO 0x01C8
#define D2S_ZERO 0x01CC
#define D3S_ZERO 0x01D0
#define PPI_CLRFLG 0x01E0
#define PPI_CLRSIPO 0x01E4
#define HSTIMEOUT 0x01F0
#define HSTIMEOUTENABLE 0x01F4
/* DSI Protocol Layer Registers */
#define DSI_STARTDSI 0x0204
#define STARTDSI BIT(0)
#define DSI_LANEENABLE 0x0210
#define DSI_LANESTATUS0 0x0214
#define DSI_LANESTATUS1 0x0218
#define DSI_INTSTATUS 0x0220
#define DSI_INTMASK 0x0224
#define DSI_INTCLR 0x0228
#define DSI_LPTXTO 0x0230
/* DSI General Registers */
#define DSIERRCNT 0x0300
/* DSI Application Layer Registers */
#define APLCTRL 0x0400
#define RDPKTLN 0x0404
/* Video Path Configuration Registers */
#define VPCTRL 0x0450
#define VSDELAY(x) UPDATE(x, 29, 20)
#define VSPOL_ACTIVE_HIGH BIT(19)
#define VSPOL_ACTIVE_LOW 0
#define DEPOL_ACTIVE_HIGH BIT(18)
#define DEPOL_ACTIVE_LOW 0
#define HSPOL_ACTIVE_HIGH BIT(17)
#define HSPOL_ACTIVE_LOW 0
#define OPXLFMT_MASK BIT(8)
#define OPXLFMT_RGB888 BIT(8)
#define OPXLFMT_RGB666 0
#define HTIM1 0x0454
#define HBPR(x) UPDATE(x, 24, 16)
#define HPW(x) UPDATE(x, 8, 0)
#define HTIM2 0x0458
#define HFPR(x) UPDATE(x, 24, 16)
#define HACT(x) UPDATE(x, 10, 0)
#define VTIM1 0x045C
#define VBPR(x) UPDATE(x, 23, 16)
#define VPW(x) UPDATE(x, 7, 0)
#define VTIM2 0x0460
#define VFPR(x) UPDATE(x, 23, 16)
#define VACT(x) UPDATE(x, 10, 0)
#define VFUEN 0x0464
#define UPLOAD_ENABLE BIT(0)
#define LVMX0003 0x0480
#define LVMX0407 0x0484
#define LVMX0811 0x0488
#define LVMX1215 0x048C
#define LVMX1619 0x0490
#define LVMX2023 0x0494
#define LVMX2427 0x0498
/* LVDS Configuration Registers */
#define LVCFG 0x049C
#define PCLKSEL(x) UPDATE(x, 11, 10)
#define PCLKDIV(x) UPDATE(x, 7, 4)
#define LVDILINK_DUAL_LINK BIT(1)
#define LVDILINK_SINGLE_LINK 0
#define LVEN_ENABLE BIT(0)
#define LVDU_ENABLE(x) UPDATE(x, 1, 1)
#define LVEN_DISABLE 0
#define LVPHY0 0x04A0
#define LV_RST_MASK BIT(22)
#define LV_RST_RESET BIT(22)
#define LV_RST_NORMAL 0
#define LV_PRBS_ON(x) UPDATE(x, 20, 16)
#define LV_IS_MASK GENMASK(15, 14)
#define LV_IS(x) UPDATE(x, 15, 14)
#define LV_FS_MASK GENMASK(6, 5)
#define LV_FS(x) UPDATE(x, 6, 5)
#define LV_ND_MASK GENMASK(4, 0)
#define LV_ND(x) UPDATE(x, 4, 0)
#define LVPHY1 0x04A4
/* System Registers */
#define SYSSTAT 0x0500
#define SYSRST 0x0504
#define RSTLCD BIT(2)
/* GPIO Registers */
#define GPIOC 0x0520
#define GPIOO 0x0524
#define GPIOI 0x0528
/* I2C Registers */
#define I2CTIMCTRL 0x0540
#define I2CMEN_ENABLE BIT(24)
#define I2CMEN_DISABLE 0
#define I2CMADDR 0x0544
#define WDATAQ 0x0548
#define RDATAQ 0x054A
/* Chip ID/Revision Registers */
#define IDREG 0x0580
/* Debug Registers */
#define DEBUG00 0x05A0
#define DEBUG01 0x05A4
#define DEBUG02 0x05A8
#define TC358775_MAX_REGISTER DEBUG02

/* Input muxing for registers LVMX0003...LVMX2427 */
enum
{
	INPUT_R0,
	INPUT_R1,
	INPUT_R2,
	INPUT_R3,
	INPUT_R4,
	INPUT_R5,
	INPUT_R6,
	INPUT_R7,
	INPUT_G0,
	INPUT_G1,
	INPUT_G2,
	INPUT_G3,
	INPUT_G4,
	INPUT_G5,
	INPUT_G6,
	INPUT_G7,
	INPUT_B0,
	INPUT_B1,
	INPUT_B2,
	INPUT_B3,
	INPUT_B4,
	INPUT_B5,
	INPUT_B6,
	INPUT_B7,
	INPUT_HSYNC,
	INPUT_VSYNC,
	INPUT_DE,
	LOGIC_0,
};

typedef struct yeebo_configure
{
	u32 ppi_tx_rx_ta;
	u32 ppi_lptxtimecnt;
	u32 ppi_d0s_clrsipocount;
	u32 ppi_d1s_clrsipocount;
	u32 ppi_d2s_clrsipocount;
	u32 ppi_d3s_clrsipocount;
	u32 ppi_laneenable;
	u32 dsi_laneenable;
	u32 ppi_sartppi;
	u32 dsi_sartppi;

	u32 vpctrl;
	u32 htim1;
	u32 htim2;
	u32 vtim1;
	u32 vtim2;
	u32 vfuen;
	u32 lvphy0;
	u32 lvphy0_1;
	u32 sysrst;

	u32 lvmx0003;
	u32 lvmx0407;
	u32 lvmx0811;
	u32 lvmx1215;
	u32 lvmx1619;
	u32 lvmx2023;
	u32 lvmx2427;

	u32 lvcfg;
} yeebo_configure_st;

#define INPUT_MUX(lvmx03, lvmx02, lvmx01, lvmx00)      \
	(UPDATE(lvmx03, 29, 24) | UPDATE(lvmx02, 20, 16) | \
	 UPDATE(lvmx01, 12, 8) | UPDATE(lvmx00, 4, 0))

#if 1
static const struct display_timing yeebo_default_timing = {
	.pixelclock = {200000000, 200000000, 200000000},
	.hactive = {1280, 1280, 1280},
	.hfront_porch = {18, 18, 18},
	.hsync_len = {18, 18, 18},
	.hback_porch = {18, 18, 18},
	.vactive = {800, 800, 800},
	.vfront_porch = {12, 12, 12},
	.vsync_len = {4, 4, 4},
	.vback_porch = {8, 8, 8},

	.flags = DISPLAY_FLAGS_HSYNC_HIGH |
			 DISPLAY_FLAGS_VSYNC_HIGH |
			 DISPLAY_FLAGS_DE_HIGH |
			 DISPLAY_FLAGS_PIXDATA_POSEDGE,
};

#else
static const struct display_timing yeebo_default_timing = {
	//.pixelclock = { 66000000, 120000000, 132000000 },
	.pixelclock = {66000000, 160000000, 182000000},
	//.pixelclock = { 80000000, 148500000, 158500000 },
	.hactive = {1920, 1920, 1920},
	.hsync_len = {10, 10, 10},
	.hback_porch = {30, 30, 30},
	.hfront_porch = {230, 230, 230},

	.vactive = {1080, 1080, 1080},
	.vsync_len = {10, 10, 10},
	.vback_porch = {96, 96, 96},
	.vfront_porch = {50, 50, 50},

	.flags = DISPLAY_FLAGS_HSYNC_LOW |
			 DISPLAY_FLAGS_VSYNC_LOW |
			 DISPLAY_FLAGS_DE_LOW |
			 DISPLAY_FLAGS_PIXDATA_NEGEDGE,
};

#endif


struct yeebo_panel
{
	struct drm_panel base;
	struct mipi_dsi_device *dsi;

	struct gpio_desc *reset;
	struct gpio_desc *power_gpio;

	bool prepared;
	bool enabled;

	struct backlight_device *backlight;

	struct videomode vm;
	u32 width_mm;
	u32 height_mm;
	struct device *dev;
	yeebo_configure_st tc35775_cfg;
};


static inline struct yeebo_panel *to_yeebo_panel(struct drm_panel *panel)
{
	return container_of(panel, struct yeebo_panel, base);
}

static int color_format_from_dsi_format(enum mipi_dsi_pixel_format format)
{
	switch (format)
	{
	case MIPI_DSI_FMT_RGB565:
		return 0x55;
	case MIPI_DSI_FMT_RGB666:
	case MIPI_DSI_FMT_RGB666_PACKED:
		return 0x66;
	case MIPI_DSI_FMT_RGB888:
		return 0x77;
	default:
		return 0x77; /* for backward compatibility */
	}
};


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

static int yeebo_configure(struct yeebo_panel *tc, struct drm_panel *panel)
{
//	struct yeebo_panel *yeebo = to_yeebo_panel(panel);
	struct mipi_dsi_device *dsi = tc->dsi;
	// u32 idreg;
	//	u32 idreg, pclksel = 0, pclkdiv = 0;
	//	u32 lvis = 1, lvfs = 0, lvnd = 6, vsdelay = 5, lv_prbs_on = 4,dual_link = 0,debug = 0;
	// u32 debug = 0;
	//u32 ppi_tx_rx_ta,ppi_lptxtimecnt,ppi_d0s_clrsipocount,ppi_d1s_clrsipocount,ppi_d2s_clrsipocount,ppi_d3s_clrsipocount;
	// u8 chipid, revid;
	int ret=0;
	// u32 set_color_key = 1;

	/* make sure in LP mode */
	ret = mipi_dsi_dcs_nop(dsi);
	if (ret)
	{
		return ret;
	}

	ret = yeebo_panel_push_cmd_list(dsi);

	return ret;
}

static int yeebo_panel_unprepare(struct drm_panel *panel)
{
	struct yeebo_panel *yeebo = to_yeebo_panel(panel);
	struct mipi_dsi_device *dsi = yeebo->dsi;
	struct device *dev = &dsi->dev;
	int ret = 0;

	if (!yeebo->prepared)
		return 0;


	dsi->mode_flags |= MIPI_DSI_MODE_LPM;

	ret = mipi_dsi_dcs_set_display_off(dsi);
	if (ret < 0)
		DRM_DEV_ERROR(dev, "Failed to set display OFF (%d)\n", ret);

	usleep_range(5000, 10000);

	ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
	if (ret < 0)
		DRM_DEV_ERROR(dev, "Failed to enter sleep mode (%d)\n", ret);

	usleep_range(10000, 15000);

	if (yeebo->reset != NULL)
	{
		gpiod_set_value(yeebo->reset, 1);
		usleep_range(10000, 15000);
	}

	yeebo->prepared = false;

	if (yeebo->reset != NULL  && yeebo->power_gpio !=NULL) {
		/* Power-Off Sequence */
		gpiod_set_value(yeebo->reset, 0);
		msleep(2);
	
		gpiod_set_value(yeebo->power_gpio, 0);
		msleep(2);
	}
	
	return 0;
}

static int yeebo_panel_prepare(struct drm_panel *panel)
{
	struct yeebo_panel *yeebo = to_yeebo_panel(panel);

	if (yeebo->prepared)
		return 0;
	

   if (yeebo->reset != NULL &&  yeebo->power_gpio !=NULL) {
	   /* Power-On  Sequence */
		gpiod_set_value(yeebo->power_gpio, 0);
		gpiod_set_value(yeebo->reset, 1);
		msleep(10);

		gpiod_set_value(yeebo->power_gpio, 1);
		msleep(10);

		gpiod_set_value(yeebo->reset, 0);

		msleep(10);
		gpiod_set_value(yeebo->reset, 1);
		msleep(120);

		DRM_DEV_ERROR(&yeebo->dsi->dev, "Power UP!!! \n");
	}

	yeebo->prepared = true;	
	return 0;
}


static int yeebo_panel_enable(struct drm_panel *panel)
{
	struct yeebo_panel *yeebo = to_yeebo_panel(panel);
	struct device *dev = &yeebo->dsi->dev;
	struct mipi_dsi_device *dsi = yeebo->dsi;
	int color_format = color_format_from_dsi_format(dsi->format);
	int ret = -1;

	if (yeebo->enabled)
		return 0;

//	if (!yeebo->prepared)
//		return 0;
	
	ret=yeebo_configure(yeebo, panel);
    if(ret<0){
		DRM_DEV_ERROR(dev, "Failed to configure tc358 \n");
	}
	
	// /* Software reset */
	// ret = mipi_dsi_dcs_soft_reset(dsi);
	// if (ret < 0)
	// {
	// 	DRM_DEV_ERROR(dev, "Failed to do Software Reset (%d)\n", ret);
	// 	goto fail;
	// }

	usleep_range(10000, 15000);

	// /* Set DSI mode */
	// ret = mipi_dsi_generic_write(dsi, (u8[]){0xC2, 0x0B}, 2);
	// if (ret < 0)
	// {
	// 	DRM_DEV_ERROR(dev, "Failed to set DSI mode (%d)\n", ret);
	// 	goto fail;
	// }
	// /* Set tear ON */
	// ret = mipi_dsi_dcs_set_tear_on(dsi, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
	// if (ret < 0)
	// {
	// 	DRM_DEV_ERROR(dev, "Failed to set tear ON (%d)\n", ret);
	// 	goto fail;
	// }
	// /* Set tear scanline */
	// ret = mipi_dsi_dcs_set_tear_scanline(dsi, 0x380);
	// if (ret < 0)
	// {
	// 	DRM_DEV_ERROR(dev, "Failed to set tear scanline 111 (%d)\n", ret);
	// 	goto fail;
	// }

	// /* Set pixel format */
	// ret = mipi_dsi_dcs_set_pixel_format(dsi, color_format);
	// DRM_DEV_DEBUG_DRIVER(dev, "Interface color format set to 0x%x\n",
	// 					 color_format);
	// if (ret < 0)
	// {
	// 	DRM_DEV_ERROR(dev, "Failed to set pixel format (%d)\n", ret);
	// 	goto fail;
	// }

	/* Set display brightness */
	// ret = mipi_dsi_dcs_set_display_brightness(dsi, 0x20);
	// if (ret < 0)
	// {
	// 	DRM_DEV_ERROR(dev, "Failed to set display brightness (%d)\n",
	// 				  ret);
	// 	goto fail;
	// }

	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
	if (ret < 0)
	{
		DRM_DEV_ERROR(dev, "Failed to exit sleep mode (%d)\n", ret);
		goto fail;
	}
	msleep(20);
	ret = mipi_dsi_dcs_set_display_on(dsi);
	if (ret < 0)
	{
		DRM_DEV_ERROR(dev, "Failed to exit sleep mode (%d)\n", ret);
		goto fail;
	}
	msleep(5);
	//ret = mipi_dsi_dcs_set_tear_on(dsi, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
	// if (ret < 0)
	// {
	// 	DRM_DEV_ERROR(dev, "Failed to set tear ON (%d)\n", ret);
	// 	goto fail;
	// }

	backlight_enable(yeebo->backlight);

	yeebo->enabled = true;
	
	return 0;

fail:
	
	return -1;
}

static int yeebo_panel_disable(struct drm_panel *panel)
{
	struct yeebo_panel *yeebo = to_yeebo_panel(panel);
	struct device *dev = &yeebo->dsi->dev;
	struct mipi_dsi_device *dsi = yeebo->dsi;
	int ret=0;

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
	struct yeebo_panel *yeebo = to_yeebo_panel(panel);
	struct device *dev = &yeebo->dsi->dev;
	struct drm_connector *connector = panel->connector;
	struct drm_display_mode *mode;
	u32 bus_format = MEDIA_BUS_FMT_RGB888_1X24;
	u32 *bus_flags = &connector->display_info.bus_flags;
	int ret;

	mode = drm_mode_create(connector->dev);
	if (!mode)
	{
		DRM_DEV_ERROR(dev, "Failed to create display mode!\n");
		return 0;
	}

	drm_display_mode_from_videomode(&yeebo->vm, mode);
	mode->width_mm = yeebo->width_mm;
	mode->height_mm = yeebo->height_mm;
	connector->display_info.width_mm = yeebo->width_mm;
	connector->display_info.height_mm = yeebo->height_mm;
	mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;

	if (yeebo->vm.flags & DISPLAY_FLAGS_DE_HIGH)
		*bus_flags |= DRM_BUS_FLAG_DE_HIGH;
	if (yeebo->vm.flags & DISPLAY_FLAGS_DE_LOW)
		*bus_flags |= DRM_BUS_FLAG_DE_LOW;
	if (yeebo->vm.flags & DISPLAY_FLAGS_PIXDATA_NEGEDGE)
		*bus_flags |= DRM_BUS_FLAG_PIXDATA_NEGEDGE;
	if (yeebo->vm.flags & DISPLAY_FLAGS_PIXDATA_POSEDGE)
		*bus_flags |= DRM_BUS_FLAG_PIXDATA_POSEDGE;

	ret = drm_display_info_set_bus_formats(&connector->display_info,
										   &bus_format, 1);
	if (ret)
		return ret;

	drm_mode_probed_add(panel->connector, mode);

	return 1;
}

static int yeebo_panel_bl_update_status(struct backlight_device *bl)
{
	struct mipi_dsi_device *dsi = bl_get_data(bl);
	struct yeebo_panel *panel=mipi_dsi_get_drvdata(dsi);
	int ret = 0;

	if (!panel->prepared)
		return 0;

	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;

	ret = mipi_dsi_dcs_set_display_brightness(dsi, bl->props.brightness);
	if (ret < 0)
		return ret;

	return 0;
}

static int yeebo_panel_bl_get_brightness(struct backlight_device *bl)
{
	struct mipi_dsi_device *dsi = bl_get_data(bl);
	struct yeebo_panel *panel=mipi_dsi_get_drvdata(dsi);
	u16 brightness;
	int ret;

	if (!panel->prepared)
		return 0;

	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;

	ret = mipi_dsi_dcs_get_display_brightness(dsi, &brightness);
	if (ret < 0)
		return ret;

	bl->props.brightness = brightness;

	return brightness & 0xff;
}


static const struct backlight_ops yeebo_bl_ops = {
	.update_status = yeebo_panel_bl_update_status,
	.get_brightness = yeebo_panel_bl_get_brightness,
};

static const struct drm_panel_funcs yeebo_panel_funcs = {
	.prepare = yeebo_panel_prepare,
	.unprepare = yeebo_panel_unprepare,
	.enable = yeebo_panel_enable,
	.disable = yeebo_panel_disable,
	.get_modes = yeebo_panel_get_modes,
};

static int yeebo_panel_probe(struct mipi_dsi_device *dsi)
{
	struct device *dev = &dsi->dev;
	struct device_node *np = dev->of_node;
	struct device_node *client_node = NULL;
	struct device_node *timings;
	struct i2c_client *client_dev;
	struct yeebo_panel *panel;
	struct backlight_properties bl_props;
	
	int ret;
	panel = devm_kzalloc(&dsi->dev, sizeof(*panel), GFP_KERNEL);
	if (!panel)
		return -ENOMEM;

	mipi_dsi_set_drvdata(dsi, panel);

	panel->dsi = dsi;
	panel->dev = dev;
	dsi->format = MIPI_DSI_FMT_RGB888;
	dsi->mode_flags = MIPI_DSI_MODE_VIDEO_BURST | MIPI_DSI_MODE_VIDEO_HSE | MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_LPM;

	ret = of_property_read_u32(np, "dsi-lanes", &dsi->lanes);
	if (ret < 0)
	{
		dev_err(dev, "Failed to get dsi-lanes property (%d)\n", ret);
		return ret;
	}


	videomode_from_timing(&yeebo_default_timing, &panel->vm);


	of_property_read_u32(np, "panel-width-mm", &panel->width_mm);
	of_property_read_u32(np, "panel-height-mm", &panel->height_mm);


	panel->reset = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
	if (IS_ERR(panel->reset))
		panel->reset = NULL;

	panel->power_gpio= devm_gpiod_get(dev, "powergpio", GPIOD_OUT_LOW);
	if (IS_ERR(panel->power_gpio))
		panel->reset = NULL;


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

	drm_panel_init(&panel->base);
	panel->base.funcs = &yeebo_panel_funcs;
	panel->base.dev = dev;

	ret = drm_panel_add(&panel->base);

	if (ret < 0)
		return ret;

	ret = mipi_dsi_attach(dsi);
	if (ret < 0)
		drm_panel_remove(&panel->base);

	return ret;
}

static int yeebo_panel_remove(struct mipi_dsi_device *dsi)
{
	struct yeebo_panel *yeebo = mipi_dsi_get_drvdata(dsi);
	struct device *dev = &dsi->dev;
	int ret;
	ret = yeebo_panel_unprepare(&yeebo->base);
	if (ret < 0)
		DRM_DEV_ERROR(dev, "Failed to unprepare panel (%d)\n", ret);
	ret = yeebo_panel_disable(&yeebo->base);
	if (ret < 0)
		DRM_DEV_ERROR(dev, "Failed to disable panel (%d)\n", ret);

	ret = mipi_dsi_detach(dsi);
	if (ret < 0)
		DRM_DEV_ERROR(dev, "Failed to detach from host (%d)\n",
					  ret);

	drm_panel_detach(&yeebo->base);

	if (yeebo->base.dev)
		drm_panel_remove(&yeebo->base);

	return 0;
}

static void yeebo_panel_shutdown(struct mipi_dsi_device *dsi)
{
	struct yeebo_panel *yeebo = mipi_dsi_get_drvdata(dsi);
	yeebo_panel_unprepare(&yeebo->base);
	yeebo_panel_disable(&yeebo->base);
}

static const struct of_device_id yeebo_of_match[] = {
	{
		.compatible = "yeebo,ili9881c",
	},
	{}};
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

MODULE_AUTHOR("MYiR alex.hu");
MODULE_DESCRIPTION("TOSHIBA TC358775 PANEL");
MODULE_LICENSE("GPL v2");
