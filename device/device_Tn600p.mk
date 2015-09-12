# Copyright (C) 2009 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#
# This file is the build configuration for a full Android
# build for sapphire hardware. This cleanly combines a set of
# device-specific aspects (drivers) with a device-agnostic
# product configuration (apps).
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)

$(call inherit-product, device/common/gps/gps_eu_supl.mk)

DEVICE_PACKAGE_OVERLAYS := device/zte/Tn600p/overlay

# Discard inherited values and use our own instead.
PRODUCT_NAME := zte_mooncake
PRODUCT_DEVICE := mooncake
PRODUCT_MODEL := ZTE Mooncake
PRODUCT_LOCALES := zh_CN

PRODUCT_PACKAGES += \
    LiveWallpapers \
    LiveWallpapersPicker \
    VisualizationWallpapers \
    MagicSmokeWallpapers \
    VisualizationWallpapers \
    librs_jni \
    Gallery3d \
    SpareParts \
    Development \
    Term \
    gralloc.mooncake \
    copybit.mooncake \
    gps.mooncake \
    lights.mooncake \
    sensors.mooncake \
    libOmxCore \
    libOmxVidEnc \
    FM \
    abtfilt \
    mooncakeParts \
    prox_cal \
    dexpreopt

# proprietary side of the device
$(call inherit-product-if-exists, vendor/zte/Tn600p/Tn600p-vendor.mk)

DISABLE_DEXPREOPT := false

# usbconfig
#PRODUCT_COPY_FILES += \
#    device/zte/mooncake/usbconfig:root/sbin/usbconfig

PRODUCT_COPY_FILES += \
    device/zte/Tn600p/prebuilt/system/usr/keylayout/qwerty.kl:system/usr/keylayout/qwerty.kl \
    device/zte/Tn600p/prebuilt/system/usr/keylayout/mooncake_keypad.kl:system/usr/keylayout/mooncake_keypad.kl

#system patch
PRODUCT_COPY_FILES += \
    device/zte/Tn600p/prebuilt/system/app/phoneWake.apk:system/app/phoneWake.apk \
    device/zte/Tn600p/prebuilt/system/bin/dexopt-wrapper:system/bin/dexopt-wrapper \
    device/zte/Tn600p/prebuilt/system/bin/touch_to_key:system/bin/touch_to_key \
    device/zte/Tn600p/prebuilt/system/etc/virtualkeys.msm-touchscreen:system/etc/virtualkeys.msm-touchscreen \
    device/zte/Tn600p/prebuilt/system/etc/hosts:system/etc/hosts \
    device/zte/Tn600p/prebuilt/system/lib/hw/gralloc.default.so:system/lib/hw/gralloc.default.so \
    device/zte/Tn600p/prebuilt/system/lib/hw/gralloc.mooncake.so:system/lib/hw/gralloc.mooncake.so \
    device/zte/Tn600p/prebuilt/system/usr/keychars/mooncake_keypad.kcm.bin:system/usr/keychars/mooncake_keypad.kcm.bin \
    device/zte/Tn600p/prebuilt/system/etc/enhanced.conf:system/etc/enhanced.conf 

#    device/zte/Tn600p/prebuilt/system/lib/hw/copybit.mooncake.so:system/lib/hw/copybit.mooncake.so \
#    device/zte/Tn600p/prebuilt/system/lib/hw/sensors.default.so:system/lib/hw/sensors.default.so \
#    device/zte/Tn600p/prebuilt/system/lib/hw/sensors.goldfish.so:system/lib/hw/sensors.goldfish.so \
#    device/zte/Tn600p/prebuilt/system/etc/apns-conf.xml:system/etc/apns-conf.xml \
#    device/zte/Tn600p/prebuilt/system/etc/gps.conf:system/etc/gps.conf \

# Vold
PRODUCT_COPY_FILES += \
    device/zte/Tn600p/prebuilt/system/etc/vold.fstab:system/etc/vold.fstab

# Init
PRODUCT_COPY_FILES += \
    device/zte/Tn600p/prebuilt/init.mooncake.rc:root/init.mooncake.rc \
    device/zte/Tn600p/prebuilt/ueventd.mooncake.rc:root/ueventd.mooncake.rc

# Audio
PRODUCT_COPY_FILES += \
    device/zte/Tn600p/prebuilt/system/etc/AudioFilter.csv:system/etc/AudioFilter.csv \
    device/zte/Tn600p/prebuilt/system/etc/AutoVolumeControl.txt:system/etc/AutoVolumeControl.txt

# App
#PRODUCT_COPY_FILES += \
#    packages/apps/RootExplorer.apk:system/app/RootExplorer.apk

# LOGO
PRODUCT_COPY_FILES += \
    device/zte/Tn600p/prebuilt/initlogo.rle:root/initlogo.rle

# Geno script
#PRODUCT_COPY_FILES += \
#    device/zte/Tn600p/prebuilt/sbin/geno:root/sbin/geno \
#    device/zte/Tn600p/prebuilt/sbin/odex:root/sbin/odex \
#    device/zte/Tn600p/prebuilt/sbin/timing:root/sbin/timing \
#    device/zte/Tn600p/prebuilt/sbin/gk/1-app2sd.sh:root/sbin/gk/1-app2sd.sh \
#    device/zte/Tn600p/prebuilt/sbin/gk/2-data2ext.sh:root/sbin/gk/2-data2ext.sh \
#    device/zte/Tn600p/prebuilt/sbin/gk/3-swap.sh:root/sbin/gk/3-swap.sh \
#    device/zte/Tn600p/prebuilt/sbin/gk/4-optimize.sh:root/sbin/gk/4-optimize.sh \
#    device/zte/Tn600p/prebuilt/sbin/gk/5-backup.sh:root/sbin/gk/5-backup.sh \
#    device/zte/Tn600p/prebuilt/sbin/gk/6-restore.sh:root/sbin/gk/6-restore.sh \
#    device/zte/Tn600p/prebuilt/sbin/gk/readme.txt:root/sbin/gk/readme.txt

# WLAN + BT
PRODUCT_COPY_FILES += \
    device/zte/Tn600p/prebuilt/system/etc/init.bt.sh:system/etc/init.bt.sh \
    device/zte/Tn600p/prebuilt/system/etc/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    device/zte/Tn600p/prebuilt/system/etc/dhcpcd/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf \
    device/zte/Tn600p/prebuilt/system/bin/hostapd:system/bin/hostapd \
    device/zte/Tn600p/prebuilt/system/etc/wifi/hostapd.conf:system/etc/wifi/hostapd.conf

# Install the features available on this device.
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml

#Kernel Modules
PRODUCT_COPY_FILES += \
    device/zte/Tn600p/prebuilt/system/wifi/ar6000.ko:system/wifi/ar6000.ko \
    device/zte/Tn600p/prebuilt/system/lib/modules/2.6.35.7-perf+/cifs.ko:system/lib/modules/2.6.35.7-perf+/cifs.ko \
    device/zte/Tn600p/prebuilt/system/lib/modules/2.6.35.7-perf+/zram.ko:system/lib/modules/2.6.35.7-perf+/zram.ko \
    device/zte/Tn600p/prebuilt/system/lib/modules/2.6.35.7-perf+/lzo_compress.ko:system/lib/modules/2.6.35.7-perf+/lzo_compress.ko \
    device/zte/Tn600p/prebuilt/system/lib/modules/2.6.35.7-perf+/lzo_decompress.ko:system/lib/modules/2.6.35.7-perf+/lzo_decompress.ko

#WiFi firmware
PRODUCT_COPY_FILES += \
    device/zte/Tn600p/prebuilt/system/wifi/regcode:system/wifi/regcode \
    device/zte/Tn600p/prebuilt/system/wifi/data.patch.hw2_0.bin:system/wifi/data.patch.hw2_0.bin \
    device/zte/Tn600p/prebuilt/system/wifi/athwlan.bin.z77:system/wifi/athwlan.bin.z77 \
    device/zte/Tn600p/prebuilt/system/wifi/athtcmd_ram.bin:system/wifi/athtcmd_ram.bin

#Media profile
PRODUCT_COPY_FILES += \
    device/zte/Tn600p/prebuilt/system/etc/media_profiles.xml:system/etc/media_profiles.xml

#PRODUCT_PROPERTY_OVERRIDES := \
#    keyguard.no_require_sim=true \
#    ro.com.android.dateformat=dd-MM-yyyy \
#    ro.ril.hsxpa=1 \
#    ro.ril.gprsclass=10 \
#    ro.media.dec.jpeg.memcap=10000000

PRODUCT_PROPERTY_OVERRIDES += \
    rild.libpath=/system/lib/libril-qc-1.so \
    rild.libargs=-d /dev/smd0 \
    wifi.interface=wlan0 \
    wifi.supplicant_scan_interval=15 \
    ro.com.android.dataroaming=false

PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=120 \
    ro.sf.hwrotation=0 \
    debug.sf.hw=0 \
    qemu.sf.lcd_density=120 \
    ro.sf.hwrotation=0 \
    debug.sf.hw=0 \
    persist.sys.language=zh \
    persist.sys.country=CN \
    persist.sys.timezone=Asia/Shanghai

#PRODUCT_PROPERTY_OVERRIDES += \
#    ro.sf.lcd_density=240 \
#    ro.sf.hwrotation=180 \
#    persist.sys.use_16bpp_alpha=1

# mooncake uses low-density artwork where available
PRODUCT_LOCALES += mdpi ldpi

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# This should not be needed but on-screen keyboard uses the wrong density without it.
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=120 \
    qemu.sf.lcd_density=120 

PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true \
    ro.com.android.dateformat=dd-MM-yyyy \
    ro.ril.hsxpa=2 \
    ro.ril.gprsclass=10 \
    persist.sys.language=zh \
    persist.sys.country=CN \
    persist.sys.timezone=Asia/Shanghai \
    ro.cdma.home.operator.numeric=46003 \
    ro.telephony.default_network=4 \
    ro.cdma.home.operator.alpha=中国电信 \
    ro.config.cdma_subscription=0 \
    ril.subscription.types=RUIM,NV \
    ro.cdma.voicemail.number=*86 \
    ro.telephony.call_ring.multiple=false

PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.locationfeatures=1 \
    ro.setupwizard.enable_bypass=1 \
    ro.media.dec.jpeg.memcap=20000000 \
    ro.opengles.version=131072

# ioz9 Fix APGS support
PRODUCT_PROPERTY_OVERRIDES += \
    ro.ril.def.agps.mode=2

# added by ioz9 2012-03-03
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.hwfeature_wakeupkey=3 \
    ro.config.hw_menu_unlockscreen=true
