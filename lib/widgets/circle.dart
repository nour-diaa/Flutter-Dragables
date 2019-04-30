import 'package:flutter/material.dart';

class CirclePiece extends StatelessWidget {
  final Color color;
  final double size;

  CirclePiece({this.color, this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(100),
      ),
    );
  }
}
