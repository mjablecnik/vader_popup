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
    required this.message,
    this.textAlign = TextAlign.center,
    this.config = const PopupConfig(),
    this.height,
  });

  final PopupText message;
  final TextAlign textAlign;
  final PopupConfig config;
  final double? height;

  @override
  Widget build(BuildContext context) {
    final textContent = Text(
      message.text,
      textAlign: textAlign,
      style: message.style ??
          const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
    );

    if (message.text.split("\n").length > config.maxShortMessagesLines) {
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
      return Center(
        child: SizedBox(
          height: height ?? config.shortMessageHeight,
          child: textContent,
        ),
      );
    }
  }
}

class PopupInput extends PopupContent {
  const PopupInput({
    super.key,
    this.label,
    this.message,
    this.config = const PopupConfig(),
    this.onSubmit,
    this.validator,
    this.controller,
    this.keyboardType,
    this.initialValue,
    this.formState,
  });

  final PopupText? label;
  final PopupText? message;
  final PopupConfig config;
  final Function(String)? onSubmit;
  final FormFieldValidator? validator;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? initialValue;
  final GlobalKey<FormState>? formState;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formState,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Wrap(
        children: [
          if (message != null)
            PopupMessage(
              message: message!,
              height: config.inputMessageHeight,
            ),
          TextFormField(
            cursorColor: Theme.of(context).primaryColor,
            controller: controller,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black,
              fontWeight: FontWeight.w400,
            ),
            onFieldSubmitted: onSubmit,
            validator: validator,
            keyboardType: keyboardType,
            initialValue: initialValue,
            decoration: InputDecoration(
              labelText: label?.text,
              labelStyle: label?.style ??
                  const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                    fontWeight: FontWeight.w400,
                  ),
              contentPadding: const EdgeInsets.only(bottom: 10, top: 10, left: 10),
              focusedBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(color: Colors.grey.shade400),
              ),
              border: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(color: Colors.grey.shade400),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(color: Colors.grey.shade400),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
