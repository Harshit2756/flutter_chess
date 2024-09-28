import 'package:flutter/material.dart';

class DeadPiece extends StatelessWidget {
  final String imagePath;
  final bool isWhite;

  const DeadPiece({
    super.key,
    required this.imagePath,
    required this.isWhite,
  });
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      height: 10,
      width: 20,
      imagePath,
      // color: isWhite
      //     ? const Color.fromARGB(255, 255, 255, 255)
      //     : const Color.fromARGB(255, 0, 0, 0),
    );
  }
}
