###############################################################################
#
# Source Han Sans HK
#
###############################################################################

SOURCE_HAN_SANS_HK_VERSION = $(SOURCE_HAN_SANS_VERSION)
SOURCE_HAN_SANS_HK_SOURCE = SourceHanSansHK.zip
SOURCE_HAN_SANS_HK_SITE = $(SOURCE_HAN_SANS_SITE)
SOURCE_HAN_SANS_HK_LICENSE = OFL-1.1
SOURCE_HAN_SANS_HK_LICENSE_FILES = LICENSE.txt
SOURCE_HAN_SANS_HK_DEPENDENCIES = host-zip

define SOURCE_HAN_SANS_HK_EXTRACT_CMDS
	unzip $(SOURCE_HAN_SANS_HK_DL_DIR)/$(SOURCE_HAN_SANS_HK_SOURCE) -d $(@D)/
endef

ifeq ($(BR2_PACKAGE_FONTCONFIG),y)
define SOURCE_HAN_SANS_HK_INSTALL_FONTCONFIG_CONF
	$(INSTALL) -D -m 0644 \
		$(SOURCE_HAN_SANS_HK_PKGDIR)/44-source-han-sans-hk.conf \
		$(TARGET_DIR)/usr/share/fontconfig/conf.avail/
endef
endif

define SOURCE_HAN_SANS_HK_INSTALL_TARGET_CMDS
	rsync -a $(@D)/SubsetOTF/*/ \
		$(TARGET_DIR)/usr/share/fonts/source-han-sans-hk/
	$(SOURCE_HAN_SANS_HK_INSTALL_FONTCONFIG_CONF)
endef

$(eval $(generic-package))
