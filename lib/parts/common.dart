import 'package:flutter/material.dart';

enum PopupType { info, success, warning, error, question, input, choose }

class PopupText {
  const PopupText({
    required this.text,
    this.style,
  });

  final String text;
  final TextStyle? style;
}

class CustomBuilder extends StatelessWidget {
  const CustomBuilder({super.key, required this.builder, required this.child});

  final Widget Function(BuildContext, Widget) builder;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return builder.call(context, child);
  }
}

class CustomPlaceholder extends StatelessWidget {
  const CustomPlaceholder({
    super.key,
    this.text,
    this.width,
    this.height,
  });

  final String? text;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Placeholder(
        strokeWidth: 1,
        child: Center(
          child: Text(
            text ?? "",
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
