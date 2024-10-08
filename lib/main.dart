import 'package:chess/gameboard.dart';
import 'package:chess/values/colors.dart';

import 'package:device_preview_screenshot/device_preview_screenshot.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  runApp(
    DevicePreview(
      backgroundColor: backgroundColor,
      tools: const [
        DeviceSection(
          frameVisibility: false,
          orientation: false,
        ),
        SystemSection(
          locale: false,
          theme: true,
        ),
        // AccessibilitySection(
        //   accessibleNavigation: false,
        //   boldText: false,
        //   invertColors: false,
        //   textScalingFactor: false,
        // ),
        DevicePreviewScreenshot(),
        SettingsSection(),
      ],
      devices: [
        Devices.android.samsungGalaxyA50,
        Devices.android.samsungGalaxyNote20,
        Devices.android.samsungGalaxyS20,
        Devices.android.samsungGalaxyNote20Ultra,
        Devices.android.onePlus8Pro,
        Devices.android.sonyXperia1II,
        Devices.ios.iPhoneSE,
        Devices.ios.iPhone12,
        Devices.ios.iPhone12Mini,
        Devices.ios.iPhone12ProMax,
        Devices.ios.iPhone13,
        Devices.ios.iPhone13ProMax,
        Devices.ios.iPhone13Mini,
        Devices.ios.iPhoneSE,
      ],
      enabled: true,
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chess',
      debugShowCheckedModeBanner: false,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      home: const GameBoard(),
    );
  }
}
