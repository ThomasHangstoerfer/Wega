################################################################################
#
# hdc1008
#
################################################################################

HDC1008_VERSION = 8ce14963865f347920c5c503a5c18bd165d8d1dc
HDC1008_SITE = git://github.com/ThomasHangstoerfer/HDC1008.git
#HDC1008_INSTALL_STAGING = YES
#HDC1008_DEPENDENCIES = zeromq
HDC1008_LICENSE = MIT
HDC1008_LICENSE_FILES = LICENSE

#HDC1008_MAKE_OPT = LD="$(TARGET_CXX)" BUILD_PATH=./build PREFIX=/usr
#HDC1008_LDFLAGS = $(TARGET_LDFLAGS) -lpthread

define HDC1008_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
		LDFLAGS="$(HDC1008_LDFLAGS)" \
		$(HDC1008_MAKE_OPT) $(if $(BR2_PACKAGE_HDC1008_CLIENT),all) -C $(@D)
endef

define HDC1008_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 -d $(TARGET_DIR)/usr/local/bin
	$(INSTALL) -D -m 0755 $(@D)/hdc1008 $(TARGET_DIR)/usr/local/bin
#	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
#		$(HDC1008_MAKE_OPT) DESTDIR=$(TARGET_DIR) install -C $(@D)
endef

define HDC1008_UNINSTALL_TARGET_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
		$(HDC1008_MAKE_OPT) DESTDIR=$(TARGET_DIR) uninstall -C $(@D)
	$(RM) $(TARGET_DIR)/usr/local/bin/hdc1008
endef

define HDC1008_INSTALL_STAGING_CMDS
	$(INSTALL) -m 0755 -d $(STAGING_DIR)/usr/local/bin
	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
		$(HDC1008_MAKE_OPT) DESTDIR=$(STAGING_DIR) install -C $(@D)
endef

define HDC1008_UNINSTALL_STAGING_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
		$(HDC1008_MAKE_OPT) DESTDIR=$(STAGING_DIR) uninstall -C $(@D)
	$(RM) $(STAGING_DIR)/usr/local/bin/hdc1008
endef

define HDC1008_CLEAN_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) $(HDC1008_MAKE_OPT) \
		clean -C $(@D)
endef

$(eval $(generic-package))
