if [ -d "build/make" ] && ! grep "PRODUCT_BUILD_PROP_OVERRIDES" build/make/core/soong_extra_config.mk > /dev/null; then
  cd build/soong
  patch='
diff --git a/core/soong_extra_config.mk b/core/soong_extra_config.mk
index 22a6f19..bed401d 100644
--- a/core/soong_extra_config.mk
+++ b/core/soong_extra_config.mk
@@ -45,6 +45,8 @@ $(call add_json_list, PRODUCT_ODM_PROPERTIES,            $(call collapse-prop-pa
 $(call add_json_list, PRODUCT_PROPERTY_OVERRIDES,        $(call collapse-prop-pairs,PRODUCT_PROPERTY_OVERRIDES))
 $(call add_json_list, PRODUCT_DEFAULT_PROPERTY_OVERRIDES,        $(call collapse-prop-pairs,PRODUCT_DEFAULT_PROPERTY_OVERRIDES))
 
+$(call add_json_list, PRODUCT_BUILD_PROP_OVERRIDES,      $(call collapse-prop-pairs,PRODUCT_BUILD_PROP_OVERRIDES))
+
 $(call add_json_str, BootloaderBoardName, $(TARGET_BOOTLOADER_BOARD_NAME))
 
 $(call add_json_bool, SdkBuild, $(filter sdk sdk_addon,$(MAKECMDGOALS))) 
'
  echo "$patch" | patch -p1
  cd -
fi

if [ -d "system/nfc" ] && ! grep "nfa_t4tnfcee_is_config" system/nfc/src/nfa/include/nfa_nfcee_int.h > /dev/null; then
  cd system/nfc
  git fetch https://github.com/LineageOS/android_system_nfc refs/changes/55/423355/1 && git cherry-pick FETCH_HEAD
  cd -
fi
