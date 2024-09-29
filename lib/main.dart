import 'package:chess/gameboard.dart';
import 'package:chess/values/colors.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    
       const MyApp(),
    
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Chess',
      debugShowCheckedModeBanner: false,
      home: GameBoard(),
    );
  }
}
