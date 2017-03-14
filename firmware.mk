## List of Firmware bin files to be copied

LOCAL_FIRMWARE_SRC := \
    i6050-fw-usb-1.5.sbcf \
    i2400m-fw-usb-1.4.sbcf \
    i2400m-fw-usb-1.5.sbcf

## List of complete Firmware folders to be copied

LOCAL_FIRMWARE_DIR := \
    intel \
    i915

## List of matching patterns of Firmware bins to be copied

LOCAL_FIRMWARE_PATTERN := \
    iwlwifi

LOCAL_FIRMWARE_SRC += $(foreach f,$(LOCAL_FIRMWARE_PATTERN),$(shell cd $(FIRMWARES_DIR) && find . -iname "*$(f)*" -type f ))
LOCAL_FIRMWARE_SRC += $(foreach f,$(LOCAL_FIRMWARE_DIR),$(shell cd $(FIRMWARES_DIR) && find $(f) -type f) )

PRODUCT_COPY_FILES := \
    $(foreach f,$(LOCAL_FIRMWARE_SRC),$(FIRMWARES_DIR)/$(f):vendor/firmware/$(f))
