LOCAL_PATH := device/motorola/nicklaus

DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal xhdpi xxhdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi

# Recovery allowed devices
TARGET_OTA_ASSERT_DEVICE := nicklaus,e4plus

# Lights
PRODUCT_PACKAGES += \
    lights.mt6737m

PRODUCT_PACKAGES += \
    fingerprint.default

# Power
PRODUCT_PACKAGES += \
    power.mt6737m

# MTK stuff
BOARD_USES_MTK_HARDWARE := true

# Disable adb security
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
	ro.mount.fs=EXT4 \
	ro.adb.secure=0 \
	ro.secure=0 \
	ro.allow.mock.location=0 \
	ro.debuggable=1 \
	persist.service.acm.enable=0 \
	ro.config.low_ram=false

ADDITIONAL_DEFAULT_PROPERTIES += ro.adb.secure=0
ADDITIONAL_DEFAULT_PROPERTIES += ro.secure=0
ADDITIONAL_DEFAULT_PROPERTIES += persist.service.adb.enable=1

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/audio/audio_device.xml:system/etc/audio_device.xml \
    $(LOCAL_PATH)/configs/audio/audio_policy_configuration.xml:system/etc/audio_policy_configuration.xml \
    $(LOCAL_PATH)/configs/audio/a2dp_audio_policy_configuration.xml:/system/etc/a2dp_audio_policy_configuration.xml

# Media
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/configs/media_codecs.xml:system/etc/media_codecs.xml \
	$(LOCAL_PATH)/configs/media_profiles.xml:system/etc/media_profiles.xml

# Keyboard layout
PRODUCT_COPY_FILES += \
  $(LOCAL_PATH)/configs/mtk-kpd.kl:system/usr/keylayout/mtk-kpd.kl \
  $(LOCAL_PATH)/configs/ACCDET.kl:system/usr/keylayout/ACCDET.kl \


# Ramdisk
PRODUCT_COPY_FILES += \
		$(LOCAL_PATH)/rootdir/factory_init.connectivity.rc:root/factory_init.project.connectivity.rc \
    $(LOCAL_PATH)/rootdir/factory_init.project.rc:root/factory_init.project.rc \
		$(LOCAL_PATH)/rootdir/factory_init.rc:root/factory_init.rc \
		$(LOCAL_PATH)/rootdir/factory_init.usb.rc:root/factory_init.usb.rc \
    $(LOCAL_PATH)/rootdir/fstab.mt6735:root/fstab.mt6735 \
		$(LOCAL_PATH)/rootdir/init.connectivity.rc:root/init.connectivity.rc \
		$(LOCAL_PATH)/rootdir/init.microtrust.rc:root/init.microtrust.rc \
    $(LOCAL_PATH)/rootdir/init.modem.rc:root/init.modem.rc \
    $(LOCAL_PATH)/rootdir/init.mt6735.rc:root/init.mt6735.rc \
		$(LOCAL_PATH)/rootdir/init.mt6735.usb.rc:root/init.mt6735.usb.rc \
		$(LOCAL_PATH)/rootdir/init.project.rc:root/init.project.rc \
		$(LOCAL_PATH)/rootdir/init.volte.rc:root/init.volte.rc \
    $(LOCAL_PATH)/rootdir/ueventd.mt6735.rc:root/ueventd.mt6735.rc

# TWRP
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery/etc/twrp.fstab:recovery/root/etc/twrp.fstab

# Thermal
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/thermal/.ht120.mtc:system/vendor/etc/.tp/.ht120.mtc \
    $(LOCAL_PATH)/configs/thermal/thermal.conf:system/vendor/etc/.tp/thermal.conf \
    $(LOCAL_PATH)/configs/thermal/thermal.off.conf:system/vendor/etc/.tp/thermal.off.conf \
    $(LOCAL_PATH)/configs/thermal/.thermal_policy_00:system/vendor/etc/.tp/.thermal_policy_00

# Fingerprint
PRODUCT_PACKAGES += \
    fingerprintd

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:system/etc/permissions/android.hardware.fingerprint.xml

# Dalvik/HWUI
$(call inherit-product, frameworks/native/build/phone-xhdpi-2048-dalvik-heap.mk)

# Common stuff
$(call inherit-product, vendor/mad/config/common.mk)

# Vendor
$(call inherit-product, vendor/motorola/nicklaus/nicklaus-vendor.mk)
