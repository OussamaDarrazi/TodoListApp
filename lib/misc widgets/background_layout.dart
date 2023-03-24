import 'package:flutter/material.dart';
import 'package:todo_app/misc%20widgets/circle_design.dart';

class BackgroundLayout extends StatelessWidget {
  const BackgroundLayout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 2,
          child: Stack(children: [
            Container(
              color: const Color(0xFF4A3780),
            ),
            const Positioned(
              left: -50,
              top: 50,
              child: CircleDesign(),
            ),
            const Positioned(
              right: -20,
              top: -10,
              child: CircleDesign(radius: 80,),
            ),
          ]),
        ),
        Expanded(
          flex: 5,
          child: Container(
            color: const Color(0xFFF1F5F9),
          ),
        ),
      ],
    );
  }
}
