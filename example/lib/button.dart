import 'package:art_buttons_kh/art_buttons_kh.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({
    super.key,
    required this.text,
    this.color = Colors.blue,
    required this.onPressed,
  });

  final String text;
  final Color color;
  final Function? onPressed;

  @override
  Widget build(BuildContext context) {
    return ArtButtonsKh(
      text: text,
      width: 280,
      height: 56,
      fontSize: 18,
      textColor: Colors.black,
      backgroundColor: color,
      onPressed: onPressed,
    );
  }
}

