import 'package:flutter/material.dart';

class RectanglePiece extends StatelessWidget {
  final Color color;
  final double size;

  RectanglePiece({this.color, this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
