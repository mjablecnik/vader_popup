import 'package:flutter/material.dart';

class ModalLayout extends StatelessWidget {
  const ModalLayout({
    super.key,
    required this.body,
    this.padding = const EdgeInsets.only(left: 20, right: 20, top: 20),
    this.backgroundColor = Colors.grey,
    this.showCloseButton = true,
  });

  final EdgeInsetsGeometry padding;
  final Color backgroundColor;
  final bool showCloseButton;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: backgroundColor,
      child: Padding(
        padding: padding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (showCloseButton)
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: 32.0,
                    height: 32.0,
                    decoration: BoxDecoration(
                      color: Colors.grey[850],
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withAlpha(51), // 0.2 * 255 = 51
                          spreadRadius: 2,
                          blurRadius: 13,
                          offset: const Offset(5, 6),
                        ),
                      ],
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.close),
                      color: Colors.white,
                      padding: EdgeInsets.zero,
                      onPressed: Navigator.of(context).pop,
                    ),
                  ),
                ],
              ),
            const SizedBox(height: 12),
            body,
          ],
        ),
      ),
    );
  }
}
