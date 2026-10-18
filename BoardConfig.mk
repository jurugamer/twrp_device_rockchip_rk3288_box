#
# Copyright (C) 2026 The Android Open Source Project
# Copyright (C) 2026 TWRP Device Tree for Rockchip RK3288 TV Box
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/rockchip/rk3288_box

# Arquitetura ARM 32-bit (Cortex-A17 / RK3288)
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := cortex-a17
TARGET_CPU_VARIANT_RUNTIME := cortex-a17
TARGET_USES_64_BIT_BINDER := true

# Compilação minimal manifest
ALLOW_MISSING_DEPENDENCIES := true

# Bootloader e Plataforma
TARGET_BOOTLOADER_BOARD_NAME := rk30sdk
TARGET_BOARD_PLATFORM := rk3288
TARGET_NO_BOOTLOADER := true

# Kernel e Parâmetros de Boot da Rockchip
TARGET_NO_KERNEL := false
BOARD_KERNEL_IMAGE_NAME := zImage
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/kernel
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_BASE := 0x60000000
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_KERNEL_CMDLINE := console=ttyFIQ0 androidboot.baseband=N/A androidboot.selinux=permissive androidboot.hardware=rk30board androidboot.console=ttyFIQ0 init=/init

# Partições (Tamanhos calibrados exatamente com o parameter.txt)
BOARD_BOOTIMAGE_PARTITION_SIZE := 33554432
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 33554432
BOARD_SYSTEMIMAGE_PARTITION_TYPE := ext4
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_HAS_LARGE_FILESYSTEM := true

# Sistema de Arquivos do Recovery
TARGET_USERIMAGES_USE_EXT4 := true

# Cópia dos Drivers Vitais da Rockchip (Vídeo HDMI e Memória NAND)
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/prebuilt/drmboot.ko:recovery/root/drmboot.ko \
    $(DEVICE_PATH)/prebuilt/rk30xxnand_ko.ko:recovery/root/rk30xxnand_ko.ko \
    $(DEVICE_PATH)/init.recovery.rk30board.rc:recovery/root/init.recovery.rk30board.rc

# --- CONFIGURAÇÕES GRÁFICAS DO TWRP (O FIM DAS PISCADAS NO HDMI) ---
TW_THEME := landscape_hdpi
TARGET_SCREEN_DENSITY := 240
TARGET_RECOVERY_PIXEL_FORMAT := "BGRA_8888"
RECOVERY_GRAPHICS_FORCE_USE_LINELENGTH := false
TW_NO_SCREEN_BLANK := true
TW_SCREEN_BLANK_ON_BOOT := false

# Recursos Essenciais e Dieta do TWRP
TW_EXTRA_LANGUAGES := false
TW_EXCLUDE_ENCRYPTED_BACKUPS := true
TW_EXCLUDE_DEFAULT_USB_INIT := true
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_USE_TOOLBOX := true

# Suporte ao Mouse USB (Essencial para TV Box)
TW_MOUSE_TIMEOUT := 0

# Datas de segurança para o Nougat
PLATFORM_VERSION := 7.1.2
PLATFORM_SECURITY_PATCH := 2099-12-31
VENDOR_SECURITY_PATCH := 2099-12-31
