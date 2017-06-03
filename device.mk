PRODUCT_DIR := $(dir $(lastword $(filter-out device/common/%, $(filter device/%, $(ALL_PRODUCTS)))))

PRODUCT_TAGS += dalvik.gc.type-precise

PRODUCT_CHARACTERISTICS := tablet

PRODUCT_AAPT_CONFIG := normal large xlarge mdpi hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi 

# Get a list of languages.
#$(call inherit-product, $(SRC_TARGET_DIR)/product/locales_full.mk)
PRODUCT_LOCALES := en_US ru_RU

# Get everything else from the parent package
$(call inherit-product, $(SRC_TARGET_DIR)/product/generic_no_telephony.mk)

# Get some sounds
$(call inherit-product-if-exists, frameworks/base/data/sounds/AudioPackage6.mk)

PRODUCT_COPY_FILES := \
    $(if $(wildcard $(PRODUCT_DIR)init.$(TARGET_PRODUCT).rc), $(PRODUCT_DIR)init.$(TARGET_PRODUCT).rc, $(LOCAL_PATH)/init.rc):root/init.$(TARGET_PRODUCT).rc \
    $(if $(wildcard $(PRODUCT_DIR)fstab.$(TARGET_PRODUCT)), $(PRODUCT_DIR)fstab.$(TARGET_PRODUCT), $(LOCAL_PATH)/fstab):root/fstab.$(TARGET_PRODUCT)

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml

# Camera
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.camera.full.xml:system/etc/permissions/android.hardware.camera.full.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml

# Voip
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.software.sip.xml:system/etc/permissions/android.software.sip.xml

# Usb
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml
PRODUCT_PACKAGES += \
    com.android.future.usb.accessory

# Gps
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.location.xml:system/etc/permissions/android.hardware.location.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml
PRODUCT_PACKAGES += \
    gps.default

# Touch
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml

#Sensors
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.barometer.xml:system/etc/permissions/android.hardware.sensor.barometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml
PRODUCT_PACKAGES += \
    sensors.hsb

# Audio/video codec support.
PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml
PRODUCT_PACKAGES_DEBUG += \
    tinymix \
    tinyplay \
    tinycap

# Ethernet
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.ethernet.xml:system/etc/permissions/android.hardware.ethernet.xml

# WiFi    
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml
PRODUCT_PACKAGES += \
    libwpa_client \
    wpa_cli \
    wpa_supplicant \
    android.hardware.wifi@1.0-service
PRODUCT_PROPERTY_OVERRIDES := \
    wifi.interface=wlan0 \
    wifi.supplicant_scan_interval=15

# Mesa
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.opengles.aep.xml:system/etc/permissions/android.hardware.opengles.aep.xml
PRODUCT_PROPERTY_OVERRIDES += \
    ro.opengles.version=131072

PRODUCT_PACKAGES += \
    Launcher3 \
    Terminal

PRODUCT_PACKAGES += \
    NotePad \
    drmserver \
    lights.default \
    scp \
    sftp \
    ssh \
    sshd

# Enable MultiWindow
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.debug.multi_window=true

# Get the firmwares
$(call inherit-product, device/hp/g62/firmware.mk)

# Get tablet dalvik parameters
$(call inherit-product, frameworks/native/build/tablet-10in-xhdpi-2048-dalvik-heap.mk)
