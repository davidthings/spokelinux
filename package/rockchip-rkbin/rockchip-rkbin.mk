################################################################################
#
# rockchip-rkbin
#
################################################################################


#ROCKCHIP_RKBIN_VERSION = ce465f907660206ae9f0173ad62ec8d765345be5
#ROCKCHIP_RKBIN_SITE = https://github.com/rockchip-toybrick/edge

# ROCKCHIP_RKBIN_VERSION = 3aafb4dd13a750ab226604875d7938284d4ee9f1
# ROCKCHIP_RKBIN_SITE = https://github.com/JustEnoughLinuxOS/rkbin

ROCKCHIP_RKBIN_VERSION = b4558da0860ca48bf1a571dd33ccba580b9abe23
ROCKCHIP_RKBIN_SITE = https://github.com/rockchip-linux/rkbin.git
ROCKCHIP_RKBIN_SITE_METHOD = git
ROCKCHIP_RKBIN_LICENSE = PROPRIETARY
ROCKCHIP_RKBIN_LICENSE_FILES = LICENSE

ROCKCHIP_RKBIN_INSTALL_IMAGES = YES
ROCKCHIP_RKBIN_INSTALL_TARGET = NO

ROCKCHIP_RKBIN_BL31_FILENAME = $(call qstrip,$(BR2_PACKAGE_ROCKCHIP_RKBIN_BL31_FILENAME))
ROCKCHIP_RKBIN_TPL_FILENAME = $(call qstrip,$(BR2_PACKAGE_ROCKCHIP_RKBIN_TPL_FILENAME))
ROCKCHIP_RKBIN_TEE_FILENAME = $(call qstrip,$(BR2_PACKAGE_ROCKCHIP_RKBIN_TEE_FILENAME))

define ROCKCHIP_RKBIN_INSTALL_IMAGES_CMDS
	$(foreach f, \
		$(ROCKCHIP_RKBIN_BL31_FILENAME) \
		$(ROCKCHIP_RKBIN_TPL_FILENAME) \
		$(ROCKCHIP_RKBIN_TEE_FILENAME) \
		, \
		$(INSTALL) -D -m 0644 -t $(BINARIES_DIR) $(@D)/$(f)
	)
endef

$(eval $(generic-package))
