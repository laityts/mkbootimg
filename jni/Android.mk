APP_PLATFORM := android-16
APP_PIE      := true
LOCAL_PATH   := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE            := libmincrypt
LOCAL_MODULE_FILENAME   := libmincrypt
LOCAL_SRC_FILES         := libmincrypt/dsa_sig.c \
                               libmincrypt/p256.c \
                               libmincrypt/p256_ec.c \
                               libmincrypt/p256_ecdsa.c \
                               libmincrypt/rsa.c \
                               libmincrypt/sha.c \
                               libmincrypt/sha256.c
LOCAL_EXPORT_C_INCLUDES := mincrypt
LOCAL_CFLAGS            :=  -ffunction-sections -O3
include $(BUILD_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE            := mkbootimg
LOCAL_MODULE_FILENAME   := mkbootimg
LOCAL_SRC_FILES         := mkbootimg.c
LOCAL_CFLAGS            := -ffunction-sections -O3
LOCAL_LDFLAGS           := -static -Wl,--gc-sections -s
LOCAL_STATIC_LIBRARIES := libmincrypt
include $(BUILD_EXECUTABLE)

include $(CLEAR_VARS)
LOCAL_MODULE            := unpackbootimg
LOCAL_MODULE_FILENAME   := unpackbootimg
LOCAL_SRC_FILES         := unpackbootimg.c
LOCAL_CFLAGS            :=  -ffunction-sections -O3
LOCAL_LDFLAGS           := -static -Wl,--gc-sections -s
include $(BUILD_EXECUTABLE)