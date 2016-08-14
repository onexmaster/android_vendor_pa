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

# Check for target product
ifeq (pa_h815,$(TARGET_PRODUCT))

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)

# Include ParanoidAndroid common configuration
TARGET_BOOT_ANIMATION_RES := 1440
include vendor/pa/main.mk

# Inherit AOSP device configuration
$(call inherit-product, device/lge/h815/device.mk)

# Override AOSP build properties
PRODUCT_NAME := pa_h815
PRODUCT_DEVICE := h815
PRODUCT_BRAND := lge
PRODUCT_MODEL := LG-h815
PRODUCT_MANUFACTURER := LGE

PRODUCT_BUILD_PROP_OVERRIDES += \
    BUILD_FINGERPRINT="lge/p1_tmo_us/p1:6.0/MRA58K/1603210524c8d:user/release-keys" \
    PRIVATE_BUILD_DESC="p1_tmo_us-user 6.0 MRA58K 1603210524c8d release-keys"

endif
