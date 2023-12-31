################################################################################
#
# procrank_linux
#
################################################################################

PROCRANK_LINUX_VERSION = 21c30ab4514a5b15ac6e813e21bee0d3d714cb08
PROCRANK_LINUX_SITE = $(call github,csimmonds,procrank_linux,$(PROCRANK_LINUX_VERSION))
PROCRANK_LINUX_LICENSE = Apache-2.0
PROCRANK_LINUX_LICENSE_FILES = NOTICE

PROCRANK_LINUX_CFLAGS = $(TARGET_CFLAGS)
ifeq ($(BR2_PACKAGE_PROCRANK_LINUX_STATIC),y)
PROCRANK_LINUX_CFLAGS += -static
endif

define PROCRANK_LINUX_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) CROSS_COMPILE="$(TARGET_CROSS)" \
		LOCAL_CFLAGS="$(PROCRANK_LINUX_CFLAGS)"
endef

define PROCRANK_LINUX_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 -D $(@D)/procrank \
		$(TARGET_DIR)/usr/bin/procrank
endef

$(eval $(generic-package))
