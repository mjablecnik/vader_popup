import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:vader_popup/parts/common.dart';

class PopupContent extends StatelessWidget {
  const PopupContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomPlaceholder(
      text: "Content",
      width: double.infinity,
      height: 160,
    );
  }
}

class PopupMessage extends PopupContent {
  const PopupMessage({
    super.key,
    required this.text,
    this.textAlign = TextAlign.center,
  });

  final PopupText text;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Text(
        text.text,
        textAlign: textAlign,
        style: text.style ?? const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}

class PopupInput extends PopupContent {
  const PopupInput({
    super.key,
    this.label,
    this.validate,
    this.keyboardType,
  });

  final PopupText? label;
  final String? Function(String)? validate;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return const CustomPlaceholder(
      text: "Input",
      width: double.infinity,
      height: 60,
    );
  }
}
