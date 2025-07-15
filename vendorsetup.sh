if [ -d "frameworks/base" ] && ! grep "doubleTapEnabledNative" frameworks/base/packages/SystemUI/src/com/android/systemui/shade/PulsingGestureListener.kt > /dev/null; then
  cd frameworks/base
  curl https://github.com/PixelOS-AOSP/frameworks_base/commit/91573036ac7b679b89ffee4ff20c1f20a16d2735.patch | git am
  cd -
fi
