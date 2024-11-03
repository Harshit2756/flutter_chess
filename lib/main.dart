import 'package:chess/gameboard.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  runApp(const MyApp());
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
