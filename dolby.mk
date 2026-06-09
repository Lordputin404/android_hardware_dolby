# Dolby path
DOLBY_PATH := hardware/dolby

# Configs
PRODUCT_COPY_FILES += \
    $(DOLBY_PATH)/configs/dax/dax-default.xml:$(TARGET_COPY_OUT_VENDOR)/etc/dolby/dax-default.xml \
    $(DOLBY_PATH)/configs/media/media_codecs_dolby_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_dolby_audio.xml

# Dolby
PRODUCT_PACKAGES += \
    XiaomiDolby \
	DSPVolumeSynchronizer \
    XiaomiDolbyResCommon

# LunarisDolby
PRODUCT_PACKAGES += \
    LunarisDolby

# Dolby Props
PRODUCT_VENDOR_PROPERTIES += \
    ro.vendor.audio.dolby.dax.support=true \
    ro.vendor.audio.dolby.surround.enable=false \
    vendor.audio.dolby.ds2.enabled=false \
    vendor.audio.dolby.ds2.hardbypass=false

# Hidl
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE += $(DOLBY_PATH)/configs/vintf/dolby_framework_matrix.xml
DEVICE_MANIFEST_FILE += \
    $(DOLBY_PATH)/configs/vintf/vendor.dolby.hardware.dms@2.0-service.xml \
    $(DOLBY_PATH)/configs/vintf/vendor.dolby.media.c2@1.0-service.xml

# Init
PRODUCT_PACKAGES += \
    init.dolby.rc

# Media Codec2 Packages
PRODUCT_PACKAGES += \
    android.hardware.media.c2@1.0.vendor \
    android.hardware.media.c2@1.1.vendor \
    android.hardware.media.c2@1.2.vendor \
    libcodec2_hidl@1.2.vendor \
    libsfplugin_ccodec_utils.vendor \
    libcodec2_soft_common.vendor

# Media Codec2 Props
PRODUCT_VENDOR_PROPERTIES += \
    vendor.audio.c2.preferred=true \
    debug.c2.use_dmabufheaps=1 \
    vendor.qc2audio.suspend.enabled=true \
    vendor.qc2audio.per_frame.flac.dec.enabled=true

# Sepolicy
BOARD_VENDOR_SEPOLICY_DIRS += \
	$(DOLBY_PATH)/sepolicy/vendor

# Spatial Audio permissions
PRODUCT_COPY_FILES += \
    $(DOLBY_PATH)/configs/permissions/android.hardware.sensor.dynamic.head_tracker.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.dynamic.head_tracker.xml \

# Spatial Audio: optimize spatializer effect
PRODUCT_PROPERTY_OVERRIDES += \
       audio.spatializer.effect.util_clamp_min=300

# Spatial Audio: declare use of spatial audio
PRODUCT_PROPERTY_OVERRIDES += \
       ro.audio.spatializer_enabled=true \
       ro.audio.headtracking_enabled=true \
       ro.audio.spatializer_transaural_enabled_default=false \
       persist.vendor.audio.spatializer.speaker_enabled=true

# Dolby vision Proprietary blobs
PRODUCT_COPY_FILES += \
    $(DOLBY_PATH)/proprietary/vendor/etc/dolby_vision.cfg:$(TARGET_COPY_OUT_VENDOR)/etc/dolby_vision.cfg \
    $(DOLBY_PATH)/proprietary/vendor/etc/init/vendor.dolbyvision.media.c2@1.0-service.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/vendor.dolbyvision.media.c2@1.0-service.rc

PRODUCT_PACKAGES += \
    c2.dolby.avc.dec \
    c2.dolby.avc.sec.dec \
    c2.dolby.client \
    c2.dolby.egl \
    c2.dolby.hevc.dec \
    c2.dolby.hevc.enc \
    c2.dolby.hevc.sec.dec \
    c2.dolby.store \
    libdolbyottcameracontrol \
    libdolbyvision \
    dolbycodec2

PRODUCT_PACKAGES += \
    libstagefright_foundation-swiitchoff

PRODUCT_COPY_FILES += \
    $(DOLBY_PATH)/proprietary/vendor/etc/init/vendor.dolby.media.dvs-service-vision.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/vendor.dolby.media.dvs-service-vision.rc

PRODUCT_PACKAGES += \
    vendor.dolby.dvs@1.0 \
    vendor.dolby.media.dvs-service.xml \
    dvs-hal-service

# Shim
PRODUCT_PACKAGES += \
    libcodec2_hidl_shim.vendor

$(call inherit-product, $(DOLBY_PATH)/dolby-vendor.mk)
