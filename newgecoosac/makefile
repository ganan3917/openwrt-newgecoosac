# Copyright (C) 2025 ganan3917
#
# This is free software, licensed under the Apache License, Version 2.0 .
#

include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-newgecoosac
PKG_VERSION:=1.0
PKG_RELEASE:=1

LUCI_TITLE:=LuCI Support for New Gecoos AC
LUCI_DEPENDS:=+luci-compat
LUCI_PKGARCH:=all

define Package/$(PKG_NAME)/conffiles
/etc/newgecoosac
endef

# 生成翻译文件规则
define Build/Compile
    $(call Build/Compile/Default)
    $(foreach lang,$(wildcard $(PKG_BUILD_DIR)/po/*), \
        mkdir -p $(PKG_INSTALL_DIR)/usr/lib/lua/luci/i18n/$(notdir $(lang)); \
        $(STAGING_DIR_HOST)/bin/msgfmt -c -o $(PKG_INSTALL_DIR)/usr/lib/lua/luci/i18n/$(notdir $(lang))/luci-app-newgecoosac.mo $(lang)/luci-app-newgecoosac.po; \
    )
endef

# 安装翻译文件
define Package/$(PKG_NAME)/install
    $(INSTALL_DIR) $(1)/etc/config
    $(INSTALL_CONF) ./files/newgecoosac.config $(1)/etc/config/newgecoosac
    $(INSTALL_DIR) $(1)/usr/lib/lua/luci/controller
    $(INSTALL_DATA) ./luasrc/controller/newgecoosac.lua $(1)/usr/lib/lua/luci/controller/
    $(INSTALL_DIR) $(1)/usr/lib/lua/luci/model/cbi
    $(INSTALL_DATA) ./luasrc/model/cbi/newgecoosac.lua $(1)/usr/lib/lua/luci/model/cbi/
    $(INSTALL_DIR) $(1)/usr/lib/lua/luci/i18n
    $(CP) $(PKG_INSTALL_DIR)/usr/lib/lua/luci/i18n/* $(1)/usr/lib/lua/luci/i18n/
endef

include $(TOPDIR)/feeds/luci/luci.mk

$(eval $(call BuildPackage,$(PKG_NAME)))