#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from r0s device
$(call inherit-product, device/samsung/r0s/device.mk)

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := r0s
PRODUCT_NAME := lineage_r0s
PRODUCT_MODEL := SM-S901B

# Use the latest approved GMS identifiers
PRODUCT_BUILD_PROP_OVERRIDES += \
    DeviceProduct=r0sxxx \
    SystemName=r0sxxx \
    BuildFingerprint=samsung/r0sxxx/r0s:12/SP1A.210812.016/S901BXXSNGZD7:user/release-keys \
    BuildDesc="r0sxxx-user 12 SP1A.210812.016 S901BXXSNGZD7 release-keys"
