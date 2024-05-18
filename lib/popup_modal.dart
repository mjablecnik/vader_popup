import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class PopupModal {
  Future<dynamic> show(
    BuildContext context, {
    EdgeInsetsGeometry padding = EdgeInsets.zero,
    Color color = Colors.grey,
    double height = 460,
    double? heightFactor,
    double backgroundOpacity = 0.8,
    required Widget body,
  }) {
    final screenHeight = MediaQuery.of(context).size.height;
    return showCupertinoModalBottomSheet(
      context: context,
      duration: const Duration(milliseconds: 300),
      enableDrag: true,
      backgroundColor: color,
      barrierColor: Colors.black.withOpacity(backgroundOpacity),
      builder: (context) => FractionallySizedBox(
        heightFactor: heightFactor ?? (100 - (screenHeight - height) / 100 * (screenHeight / 100)) / 100,
        child: Padding(
          padding: padding,
          child: Material(
            color: color,
            child: body,
          ),
        ),
      ),
    );
  }
}
