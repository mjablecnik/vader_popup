import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:vader_popup/parts/common.dart';
import 'package:fading_edge_scrollview/fading_edge_scrollview.dart';
import 'package:vader_popup/parts/config.dart';

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
    this.config = const PopupConfig(),
  });

  final PopupText text;
  final TextAlign textAlign;
  final PopupConfig config;

  @override
  Widget build(BuildContext context) {
    final textContent = Text(
      text.text,
      textAlign: textAlign,
      style: text.style ?? const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
    );

    if (text.text.split("\n").length > config.maxShortMessagesLines) {
      return SizedBox(
        height: config.longMessageHeight,
        child: FadingEdgeScrollView.fromSingleChildScrollView(
          gradientFractionOnStart: config.longMessageGradientFraction,
          gradientFractionOnEnd: config.longMessageGradientFraction,
          child: SingleChildScrollView(
            controller: ScrollController(),
            child: textContent,
          ),
        ),
      );
    } else {
      return SizedBox(
        height: config.shortMessageHeight,
        child: textContent,
      );
    }
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
