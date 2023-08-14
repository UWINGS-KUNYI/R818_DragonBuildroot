################################################################################
#
# tinyalsa
#
################################################################################

TINYALSA_VERSION = 2.0.0
TINYALSA_SITE = $(call github,tinyalsa,tinyalsa,v$(TINYALSA_VERSION))
TINYALSA_LICENSE = BSD-3-Clause
TINYALSA_LICENSE_FILES = NOTICE
TINYALSA_INSTALL_STAGING = YES

define TINYALSA_INSTALL_STAGING_CMDS
        $(TARGET_MAKE_ENV) $(MAKE) \
                -C $(@D) \
                PREFIX="/usr" \
                CROSS_COMPILE="$(TARGET_CROSS)" \
                DESTDIR="$(STAGING_DIR)" install
endef

define TINYALSA_INSTALL_TARGET_CMDS
        $(TARGET_MAKE_ENV) $(MAKE) \
                -C $(@D) \
                PREFIX="/usr" \
                CROSS_COMPILE="$(TARGET_CROSS)" \
                DESTDIR="$(TARGET_DIR)" install
endef

$(eval $(meson-package))
