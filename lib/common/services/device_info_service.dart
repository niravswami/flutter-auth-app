import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';

class DeviceInfoService {
  static final DeviceInfoPlugin _deviceInfoPlugin = DeviceInfoPlugin();

  static Future<String?> getDeviceName() async {
    try {
      if (Platform.isAndroid) {
        AndroidDeviceInfo androidInfo = await _deviceInfoPlugin.androidInfo;
        return androidInfo.model; // Returns the device model name for Android
      } else if (Platform.isIOS) {
        IosDeviceInfo iosInfo = await _deviceInfoPlugin.iosInfo;
        return iosInfo.name; // Returns the device name for iOS
      } else if (Platform.isLinux) {
        LinuxDeviceInfo linuxInfo = await _deviceInfoPlugin.linuxInfo;
        return linuxInfo.name; // Returns the device name for Linux
      } else if (Platform.isMacOS) {
        MacOsDeviceInfo macOsInfo = await _deviceInfoPlugin.macOsInfo;
        return macOsInfo.model; // Returns the device model name for macOS
      } else if (Platform.isWindows) {
        WindowsDeviceInfo windowsInfo = await _deviceInfoPlugin.windowsInfo;
        return windowsInfo
            .computerName; // Returns the computer name for Windows
      } else {
        // Unsupported platform, return a default name
        return 'Unknown';
      }
    } catch (e) {
      print('Error getting device info: $e');
      return null;
    }
  }
}
