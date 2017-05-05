#
# Product-specific compile-time definitions.
#

# CPU
TARGET_CPU_ABI := x86_64
TARGET_CPU_SMP := true
TARGET_ARCH := x86_64
TARGET_ARCH_VARIANT := x86_64
TARGET_2ND_CPU_ABI := x86
TARGET_2ND_ARCH := x86
TARGET_2ND_ARCH_VARIANT := x86

# Partitions
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_USERDATAIMAGE_PARTITION_SIZE := 576716800
BOARD_CACHEIMAGE_PARTITION_SIZE := 69206016
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_FLASH_BLOCK_SIZE := 512
BOARD_SYSTEMIMAGE_PARTITION_SIZE = $(if $(MKSQUASHFS), 0, 1610612736)

# Disable spase in image creation, otherwise image not mountble
TARGET_USERIMAGES_SPARSE_EXT_DISABLED := false

# Skip some proccess to speed up build
BOARD_SKIP_ANDROID_DOC_BUILD := true
BUILD_EMULATOR ?= false
BUILD_STANDALONE_EMULATOR ?= false
BUILD_EMULATOR_QEMUD ?= false
BUILD_EMULATOR_OPENGL ?= false
BUILD_EMULATOR_OPENGL_DRIVER ?= false
BUILD_EMULATOR_QEMU_PROPS ?= false
BUILD_EMULATOR_CAMERA_HAL ?= false
BUILD_EMULATOR_GPS_MODULE ?= false
BUILD_EMULATOR_LIGHTS_MODULE ?= false
BUILD_EMULATOR_SENSORS_MODULE ?= false

# OpenGl
USE_OPENGL_RENDERER := true
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
BOARD_USES_DRM_HWCOMPOSER ?= true
BOARD_USE_MESA := true

BOARD_GPU_DRIVERS ?= i965 r600g swrast
ifneq ($(strip $(BOARD_GPU_DRIVERS)),)
TARGET_HARDWARE_3D := true
endif

# x64 stuff
TARGET_USES_64_BIT_BINDER := true
BOARD_USE_64BIT_USERSPACE := true
TARGET_SUPPORTS_64_BIT_APPS := true

# General settings, can be overridden
TARGET_PRELINK_MODULE := false
TARGET_NO_KERNEL ?= false
TARGET_NO_RECOVERY ?= true

# Audio
BOARD_USES_GENERIC_AUDIO ?= false
BOARD_USES_ALSA_AUDIO ?= true
BOARD_USES_TINY_ALSA_AUDIO := true

# NFC
BOARD_HAVE_NFC := false

# Bluetoth
BOARD_HAVE_BLUETOOTH := false

# GPS
BOARD_HAS_GPS_HARDWARE := false

# Camera
USE_CAMERA_STUB ?= false

# WiFi
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WLAN_DEVICE := brcmsmac

# Enable dex-preoptimization
WITH_DEXPREOPT := true
WITH_DEXPREOPT_PIC := true

# Install Native Bridge
WITH_NATIVE_BRIDGE := true

# Enable ARM codegen for x86 with Native Bridge
BUILD_ARM_FOR_X86 := true

# Native Bridge ABI List
NB_ABI_LIST_32_BIT := armeabi-v7a armeabi
NB_ABI_LIST_64_BIT := arm64-v8a

TARGET_CPU_ABI_LIST_64_BIT := $(TARGET_CPU_ABI) $(TARGET_CPU_ABI2)
TARGET_CPU_ABI_LIST_32_BIT := $(TARGET_2ND_CPU_ABI) $(TARGET_2ND_CPU_ABI2) $(NB_ABI_LIST_32_BIT)
TARGET_CPU_ABI_LIST := $(TARGET_CPU_ABI_LIST_64_BIT) $(TARGET_CPU_ABI_LIST_32_BIT)

BOARD_KERNEL_CMDLINE := root=/dev/ram0 androidboot.selinux=permissive
