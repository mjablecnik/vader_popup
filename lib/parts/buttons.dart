import 'package:art_buttons_kh/art_buttons_kh.dart';
import 'package:flutter/material.dart';

class PopupButton extends StatelessWidget {
  const PopupButton({
    super.key,
    required this.label,
    required this.color,
    this.onPressed,
    this.fontSize = 14,
    this.width,
    this.height,
  });

  final String label;
  final Color color;
  final Function()? onPressed;
  final double? fontSize;
  final double? width;
  final double? height;

  factory PopupButton.large({
    required String label,
    required Color color,
    Function()? onPressed,
    double? fontSize = 16,
    double? height,
  }) {
    return PopupButton(
      label: label,
      color: color,
      onPressed: onPressed,
      fontSize: fontSize,
      height: 50,
      width: 230,
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return ArtButtonsKh(
          onPressed: onPressed ??
              () {
                Navigator.of(context).pop(false);
              },
          width: width ?? constraints.maxWidth / 2.075,
          height: height,
          backgroundColor: color,
          text: label,
          textColor: Colors.black,
          fontSize: fontSize,
        );
      }
    );
  }
}

class PopupOption<T> extends StatelessWidget {
  const PopupOption({
    super.key,
    required this.label,
    required this.value,
    this.color,
  });

  final String label;
  final T value;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return PopupButton.large(
      label: label,
      color: color ?? Colors.grey,
      onPressed: () {
        Navigator.of(context).pop(value);
      },
    );
  }
}
