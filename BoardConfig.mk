#
# Copyright (C) 2026 The Android Open Source Project
# Copyright (C) 2026 TWRP Device Tree for Rockchip RK3288 TV Box
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/rockchip/rk3288_box

# Arquitetura ARM 32-bit (Cortex-A17 Nativo do RK3288)
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := generic
TARGET_USES_64_BIT_BINDER := true

# Compilação minimal manifest
ALLOW_MISSING_DEPENDENCIES := true

# Bootloader e Plataforma
TARGET_BOOTLOADER_BOARD_NAME := rk30sdk
TARGET_BOARD_PLATFORM := rk3288
TARGET_NO_BOOTLOADER := true

# --- DISPLAY E RESOLUÇÃO FIXADA (Evita estouro de mmap e Kernel Panic no Projetor) ---
TARGET_SCREEN_DENSITY := 240
DEVICE_SCREEN_WIDTH := 1280
DEVICE_SCREEN_HEIGHT := 720

# --- KERNEL E OFFSETS EXATOS DA ROCKCHIP RK3288 ---
BOARD_BOOTIMG_HEADER_VERSION := 0
BOARD_KERNEL_BASE := 0x60000000
BOARD_RAMDISK_OFFSET := 0x02000000
BOARD_KERNEL_TAGS_OFFSET := 0x00000800
BOARD_KERNEL_PAGESIZE := 2048
BOARD_FLASH_BLOCK_SIZE := 131072

BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)

BOARD_KERNEL_CMDLINE := console=ttyFIQ0 androidboot.baseband=N/A androidboot.selinux=permissive androidboot.hardware=rk30board androidboot.console=ttyFIQ0 init=/init
BOARD_KERNEL_IMAGE_NAME := zImage
TARGET_NO_KERNEL := false
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/kernel

# Partições (Tamanhos exatos do parameter.txt)
BOARD_BOOTIMAGE_PARTITION_SIZE := 33554432
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 33554432
BOARD_SYSTEMIMAGE_PARTITION_TYPE := ext4
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_HAS_LARGE_FILESYSTEM := true

# Sistema de Arquivos do Recovery
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# Cópia dos Drivers Vitais da Rockchip
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/prebuilt/drmboot.ko:recovery/root/drmboot.ko \
    $(DEVICE_PATH)/prebuilt/rk30xxnand_ko.ko:recovery/root/rk30xxnand_ko.ko \
    $(DEVICE_PATH)/init.recovery.rk30board.rc:recovery/root/init.recovery.rk30board.rc

# --- CONFIGURAÇÃO GRÁFICA DO TWRP (Fórmula comprovada no seu projetor) ---
TW_THEME := landscape_hdpi
TARGET_RECOVERY_PIXEL_FORMAT := "BGRA_8888"
TW_NO_SCREEN_BLANK := true
TW_SCREEN_BLANK_ON_BOOT := false
TW_EXTRA_LANGUAGES := false
TW_EXCLUDE_ENCRYPTED_BACKUPS := true
TW_EXCLUDE_DEFAULT_USB_INIT := true
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_USE_TOOLBOX := true
TW_MOUSE_TIMEOUT := 0

# Datas de segurança para Android 7.1
PLATFORM_VERSION := 7.1.2
PLATFORM_SECURITY_PATCH := 2099-12-31
VENDOR_SECURITY_PATCH := 2099-12-31
