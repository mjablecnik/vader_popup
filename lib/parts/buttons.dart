import 'package:art_buttons_kh/art_buttons_kh.dart';
import 'package:flutter/material.dart';

class PopupButton extends StatelessWidget {
  const PopupButton({
    super.key,
    required this.label,
    required this.color,
    this.onPressed,
    this.fontSize = 14,
    this.width = 110,
    this.height,
  });

  final String label;
  final Color color;
  final Function()? onPressed;
  final double? fontSize;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return ArtButtonsKh(
      onPressed: onPressed ?? () {
        Navigator.of(context).pop(false);
      },
      width: width,
      backgroundColor: color,
      text: label,
      textColor: Colors.black,
      fontSize: fontSize,
    );
  }
}