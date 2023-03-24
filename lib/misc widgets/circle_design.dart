import 'package:flutter/material.dart';
class CircleDesign extends StatelessWidget {
  final double radius;
  final double stroke;
  const CircleDesign({super.key, this.radius = 100, this.stroke = 30});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: radius*2,
      width: radius*2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(width: stroke, color: Color.fromRGBO(231, 226, 243, .1))
      ),
    );
  }
}
