#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

# Audio
PRODUCT_PACKAGES += \
    mixer_paths.xml

# Bluetooth
PRODUCT_PACKAGES += \
    android.hardware.bluetooth@1.0.vendor

# Camera (ID 52 -> telephoto)
$(call soong_config_set,samsungCameraVars,extra_ids,52)

# Init
PRODUCT_PACKAGES += \
    init.r0s.rc

# NFC
BOARD_HAVE_NXP_NFC := true

# Overlays 
PRODUCT_PACKAGES += \
    FrameworkResOverlayDevice \
    SettingsProviderOverlayDevice \
    SystemUIOverlayDevice \
    WiFiOverlayDevice

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH) \
    hardware/qcom-caf/wlan \
    hardware/qcom-caf/wlan/qcwcn

# Wi-Fi
PRODUCT_PACKAGES += \
    android.hardware.wifi-service \
    hostapd \
    libcld80211 \
    wpa_supplicant \
    wpa_supplicant.conf

# Inherit from Common Tree
$(call inherit-product, device/samsung/s5e9925-common/device-common.mk)

# Inherit from the proprietary version
$(call inherit-product-if-exists, vendor/samsung/r0s/r0s-vendor.mk)
