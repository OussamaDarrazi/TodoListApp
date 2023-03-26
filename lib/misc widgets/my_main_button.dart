import 'package:flutter/material.dart';

class MyMainButton extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  const MyMainButton({
    super.key,  this.text = "", this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton.tonal(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
            const Color(0xFF4A3780)),
        minimumSize: MaterialStateProperty.all<Size>(
            Size(MediaQuery.of(context).size.width, 50)),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.w900),
      ),
    );
  }
}