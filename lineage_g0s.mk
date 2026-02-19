#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from g0s device
$(call inherit-product, device/samsung/g0s/device.mk)

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := g0s
PRODUCT_NAME := lineage_g0s
PRODUCT_MODEL := SM-S906B

# Use the latest approved GMS identifiers
PRODUCT_BUILD_PROP_OVERRIDES += \
    DeviceProduct=g0sxxx \
    SystemName=g0sxxx \
    BuildFingerprint=samsung/g0sxxx/g0s:12/SP1A.210812.016/S906BXXSNGZD7:user/release-keys \
    BuildDesc="g0sxxx-user 12 SP1A.210812.016 S906BXXSNGZD7 release-keys"
