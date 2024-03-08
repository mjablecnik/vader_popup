import 'package:flutter/material.dart';
import 'package:vader_popup/default_layout.dart';
import 'package:vader_popup/parts/buttons.dart';
import 'package:vader_popup/parts/common.dart';
import 'package:vader_popup/parts/config.dart';
import 'package:vader_popup/parts/content.dart';
import 'package:vader_popup/parts/header.dart';

class PopupDialog {
  const PopupDialog({
    this.header = const PopupHeader(),
    this.content = const PopupContent(),
    this.config = const PopupConfig(),
    this.buttons = const [],
  });

  final PopupHeader header;
  final PopupContent content;
  final PopupConfig config;
  final List<PopupButton> buttons;

  simpleMessage() {}

  longMessage() {}

  question() {}

  input() {}

  chooseList() {}


  Future<dynamic> dialog(
    BuildContext context, {
    required PopupType type,
    required String title,
    required String message,
    String? buttonLabel,
    Color? buttonColor,
    Icon? icon,
  }) {
    return PopupDialog(
      header: PopupHeader(
        icon: icon ?? config.iconByType[type],
        title: PopupText(text: title),
      ),
      content: PopupMessage(
        text: PopupText(text: message),
      ),
      buttons: [
        PopupButton(
          label: buttonLabel ?? config.confirmButtonLabel,
          color: buttonColor ?? config.colorByType[type] ?? Colors.blue,
          width: double.infinity,
          onPressed: () {
            Navigator.of(context).pop(true);
          },
        ),
      ],
    ).show(context);
  }

  Future<dynamic> show(BuildContext context) {
    return showGeneralDialog(
      context: context,
      barrierDismissible: config.isAutoClosed,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      pageBuilder: (context, animation, secondaryAnimation) {
        return GestureDetector(
          onTap: () {
            if (config.isAutoClosed || buttons.isEmpty) {
              Navigator.pop(context);
            }
          },
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.black.withOpacity(0.1),
            child: AlertDialog(
              backgroundColor: config.design.backgroundColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(config.design.borderRadius),
              ),
              content: DefaultLayout(
                header: header,
                content: content,
                buttons: buttons,
              ),
            ),
          ),
        );
      },
    );
  }
}
