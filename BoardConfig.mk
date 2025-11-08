#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from Common Tree
include device/samsung/s5e9925-common/BoardConfigCommon.mk

DEVICE_PATH := device/samsung/r0s

# Display
TARGET_SCREEN_DENSITY := 480
TARGET_SCREEN_HEIGHT := 2340
TARGET_SCREEN_WIDTH := 1080

# Kernel Modules
BOARD_VENDOR_KERNEL_MODULES_LOAD += wlan.ko

# Properties
TARGET_VENDOR_PROP += $(DEVICE_PATH)/configs/props/vendor.prop

# Wi-Fi
BOARD_WLAN_DEVICE                             := qcwcn
WIFI_HAL_INTERFACE_COMBINATIONS               := {{{STA}, 1}, {{AP}, 1}}, {{{STA}, 1}, {{P2P, NAN}, 1}}, {{{AP}, 2}}, {{{STA}, 2}}
BOARD_WPA_SUPPLICANT_DRIVER                   := NL80211
BOARD_HOSTAPD_DRIVER                          := NL80211
BOARD_HOSTAPD_CONFIG_80211W_MFP_OPTIONAL      := true
WIFI_HIDL_UNIFIED_SUPPLICANT_SERVICE_RC_ENTRY := true
WIFI_FEATURE_HOSTAPD_11AX                     := true
WPA_SUPPLICANT_VERSION                        := VER_0_8_X
