$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, device/hp/g62/device.mk)

# Overrides
PRODUCT_NAME := g62
PRODUCT_DEVICE := g62
PRODUCT_BRAND := Android
PRODUCT_MODEL := HP G62-b26er
PRODUCT_MANUFACTURER := HP
