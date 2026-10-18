#
# Copyright (C) 2026 The Android Open Source Project
# Copyright (C) 2026 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common Omni stuff.
$(call inherit-product, vendor/omni/config/common.mk)

# Inherit from rk3288_box device
$(call inherit-product, device/rockchip/rk3288_box/device.mk)

PRODUCT_DEVICE := rk3288_box
PRODUCT_NAME := omni_rk3288_box
PRODUCT_BRAND := Android
PRODUCT_MODEL := rk3288_box
PRODUCT_MANUFACTURER := rockchip

PRODUCT_GMS_CLIENTID_BASE := android-rockchip

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="rk3288_box-userdebug 7.1.2 NHG47K eng.lzp.20180620.092106 test-keys"

BUILD_FINGERPRINT := Android/rk3288_box/rk3288_box:7.1.2/NHG47K/lzp06200921:userdebug/test-keys
