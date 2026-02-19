#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

# Audio
PRODUCT_PACKAGES += \
    mixer_paths.xml

# Bluetooth
PRODUCT_PACKAGES += \
    android.hardware.bluetooth@1.0-service \
    android.hardware.bluetooth@1.0.vendor

# Camera (ID 52 -> telephoto; ID 54 -> second telephoto)
$(call soong_config_set,samsungCameraVars,extra_ids,52,54)

# Init
PRODUCT_PACKAGES += \
    init.b0s.rc

# NFC
BOARD_HAVE_NXP_NFC := true

# Overlays 
PRODUCT_PACKAGES += \
    ApertureOverlayDevice \
    FrameworkResOverlayDevice \
    SettingsProviderOverlayDevice \
    SystemUIOverlayDevice \
    WiFiOverlayDevice

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# UWB
PRODUCT_PACKAGES += \
    android.hardware.uwb-service.nxp \
    libuwb-countrycode.conf \
    libuwb-nxp.conf \
    libuwb-uci.conf

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.uwb.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.uwb.xml

# Wi-Fi
PRODUCT_PACKAGES += \
    android.hardware.wifi-service \
    hostapd \
    wpa_supplicant \
    wpa_supplicant.conf

# Inherit from Common Tree
$(call inherit-product, device/samsung/s5e9925-common/device-common.mk)

# Inherit from the proprietary version
$(call inherit-product-if-exists, vendor/samsung/b0s/b0s-vendor.mk)
