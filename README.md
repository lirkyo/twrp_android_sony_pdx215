# OrangeFox Recovery Device Tree for Sony Xperia Mark III Series

OrangeFox Recovery device tree for Sony Xperia Mark III series (pdx214 / pdx215 / pdx217).

Originally based on TWRP, fully adapted for OrangeFox Recovery R11.x.

## Supported Devices

| Device | Codename | Released |
|--------|----------|----------|
| Sony Xperia 1 III  | pdx215 (Sagami) | August 2021 |
| Sony Xperia 5 III  | pdx214 (Sagami) | October 2021 |
| Sony Xperia Pro-I  | pdx217 | December 2021 |

## Device Specifications (Xperia 1 III)

| Component | Specification |
|-----------|--------------|
| SoC | Qualcomm SM8350 Snapdragon 888 (lahaina) |
| CPU | 8x Kryo 680 up to 2.84GHz |
| GPU | Adreno 660 |
| Memory | 12GB LPDDR5 |
| Storage | 256GB / 512GB UFS 3.0 |
| Battery | 4500mAh Li-Po |
| Display | 1644 x 3840 pixels, 21:9, 6.5" |
| Android | Shipped with 11, upgradable to 13 |

## OrangeFox Features

**Working:**
- Booting via vendor_boot-as-recovery (Header v3)
- **Decryption** (FBE v2 with metadata encryption, Android 12/13)
- ADB and MTP
- FastbootD
- Virtual A/B OTA updates
- Super partition backup/restore
- Magisk addon support
- App Manager
- Advanced Security features
- Bash shell, Nano editor, ZIP tools
- Flash backup partitions (boot, dtbo, vbmeta, XBL, etc.)
- SD Card and USB OTG storage
- NTFS / exFAT support
- OrangeFox OTA for custom ROMs

**Not Working:**
- Vibration (Sony-specific haptics not supported in recovery)

## Building

```bash
# Initialize OrangeFox build environment
source build/envsetup.sh

# For Xperia 1 III:
source device/sony/pdx215/vendorsetup.sh
lunch twrp_pdx215-eng
make -j$(nproc) vendorbootimage

# For Xperia 5 III:
lunch twrp_pdx214-eng
make -j$(nproc) vendorbootimage
```

## Key Configuration
- **Kernel**: Prebuilt Image + DTB + DTBO (Header v3)
- **FBE**: QCOM FBE Decryption with metadata partition
- **File systems**: F2FS (data), EXT4/EROFS (system partitions)
- **Dynamic partitions**: Super partition with system, vendor, product, odm, system_ext, vendor_dlkm
- **UFS**: BSG/UFS boot LUN switching for failsafe updates

## Credits
- Original TWRP device tree by TwrpBuilder
- OrangeFox Recovery Team
- FsCrypt fix by mauronofrio
- Decryption by bigbiff
- OnePlus 8 TWRP by mauronofrio
- Xiaomi Mi 10 TWRP by sekaiacg
