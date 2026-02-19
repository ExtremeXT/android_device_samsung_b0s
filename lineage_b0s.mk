#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from b0s device
$(call inherit-product, device/samsung/b0s/device.mk)

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := b0s
PRODUCT_NAME := lineage_b0s
PRODUCT_MODEL := SM-S908B

# Use the latest approved GMS identifiers
PRODUCT_BUILD_PROP_OVERRIDES += \
    DeviceProduct=b0sxxx \
    SystemName=b0sxxx \
    BuildFingerprint=samsung/b0sxxx/b0s:12/SP1A.210812.016/S908BXXSNGZD7:user/release-keys \
    BuildDesc="b0sxxx-user 12 SP1A.210812.016 S908BXXSNGZD7 release-keys"
