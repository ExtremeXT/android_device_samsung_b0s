#!/usr/bin/env -S PYTHONPATH=../../../tools/extract-utils python3
#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

from extract_utils.fixups_blob import (
    blob_fixup,
    blob_fixups_user_type,
)

from extract_utils.main import (
    ExtractUtils,
    ExtractUtilsModule,
)

namespace_imports = [
    'device/samsung/s5e9925-common',
    'hardware/samsung',
    'hardware/samsung_slsi-linaro/exynos',
    'hardware/samsung_slsi-linaro/graphics',
    'vendor/samsung/s5e9925-common',
]

blob_fixups: blob_fixups_user_type = {
    (
        'vendor/lib64/hw/camera.s5e9925.so',
        'vendor/lib64/libexynoscamera3.so',
    ): blob_fixup()
        .add_needed('libui_shim.so'),
    'vendor/lib64/libexynoscamera3.so': blob_fixup()
        .sig_replace('16 00 00 94 0B 00 00 14', '1F 20 03 D5 0B 00 00 14')  # NOP SecCameraIPCtoRIL::enable m_sendRequest()
        .sig_replace('92 FF FF 97 0B 00 00 14', '1F 20 03 D5 0B 00 00 14')  # NOP SecCameraIPCtoRIL::disable m_sendRequest()
        .sig_replace('88 02 00 36 21 0F 00 B0', '1F 20 03 D5 21 0F 00 B0'), # enable RAW on all cameras
    'vendor/lib64/sensors.sensorhub.so': blob_fixup()
        .remove_needed('libhidltransport.so')
        .add_needed('libutils-v32.so')
        .binary_regex_replace(b'_ZN7android6Thread3runEPKcim', b'_ZN7utils326Thread3runEPKcim'),
   'vendor/lib64/libeis_core.so': blob_fixup()
        .add_needed('libutils-v32.so')
        .binary_regex_replace(b'_ZN7android6Thread3runEPKcim', b'_ZN7utils326Thread3runEPKcim'),
    'vendor/lib64/libvdis_core.so': blob_fixup()
        .add_needed('libshim_sensorndkbridge.so')
        .add_needed('libutils-v32.so')
        .binary_regex_replace(b'_ZN7android6Thread3runEPKcim', b'_ZN7utils326Thread3runEPKcim'),
}  # fmt: skip

module = ExtractUtilsModule(
    'b0s',
    'samsung',
    namespace_imports=namespace_imports,
    blob_fixups=blob_fixups,
)

module.add_proprietary_file('../s5e9925-common/proprietary-files-device.txt')
module.add_proprietary_file('../s5e9925-common/proprietary-files-rgb.txt')

if __name__ == '__main__':
    utils = ExtractUtils.device_with_common(
        module, 's5e9925-common', module.vendor
    )
    utils.run()
