#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Inherit from Common Tree
$(call inherit-product, device/samsung/s5e9925-common/device-common.mk)

# Inherit from the proprietary version
$(call inherit-product-if-exists, vendor/samsung/r0s/r0s-vendor.mk)
