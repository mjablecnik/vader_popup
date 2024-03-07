import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:vader_popup/parts/common.dart';

class PopupHeader extends StatelessWidget {
  const PopupHeader({
    super.key,
    this.title,
    this.icon,
  });

  final PopupText? title;
  final Icon? icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (icon != null) icon!,
        const SizedBox(height: 20),
        if (title != null)
          Text(
            title!.text,
            textAlign: TextAlign.center,
            style: title!.style ??
                const TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
          ),
      ],
    );
  }
}
