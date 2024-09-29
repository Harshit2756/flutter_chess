// import 'package:chess/gameboard.dart';
// import 'package:chess/values/colors.dart';
// import 'package:device_preview/device_preview.dart';
// import 'package:flutter/material.dart';

// void main() {
//   runApp(
//     DevicePreview(
//       backgroundColor: backgroundColor,
//       tools: const [
//         DeviceSection(
//           frameVisibility: false,
//           orientation: false,
//         ),
//         SystemSection(
//           locale: false,
//           theme: true,
//         ),
//         // AccessibilitySection(
//         //   accessibleNavigation: false,
//         //   boldText: false,
//         //   invertColors: false,
//         //   textScalingFactor: false,
//         // ),
//         SettingsSection(),
//       ],
//       devices: [
//         Devices.android.samsungGalaxyA50,
//         Devices.android.samsungGalaxyNote20,
//         Devices.android.samsungGalaxyS20,
//         Devices.android.samsungGalaxyNote20Ultra,
//         Devices.android.onePlus8Pro,
//         Devices.android.sonyXperia1II,
//         Devices.ios.iPhoneSE,
//         Devices.ios.iPhone12,
//         Devices.ios.iPhone12Mini,
//         Devices.ios.iPhone12ProMax,
//         Devices.ios.iPhone13,
//         Devices.ios.iPhone13ProMax,
//         Devices.ios.iPhone13Mini,
//         Devices.ios.iPhoneSE,
//       ],
//       enabled: false,
//       builder: (context) => const MyApp(),
//     ),
//   );
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Chess',
//       debugShowCheckedModeBanner: false,
//       locale: DevicePreview.locale(context),
//       builder: DevicePreview.appBuilder,
//       home: const GameBoard(),
//     );
//   }
// }
