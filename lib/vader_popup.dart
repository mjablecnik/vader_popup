library vader_popup;

import 'package:flutter/material.dart';
import 'package:vader_popup/default_layout.dart';
import 'package:vader_popup/parts/buttons.dart';
import 'package:vader_popup/parts/common.dart';
import 'package:vader_popup/parts/content.dart';
import 'package:vader_popup/parts/design.dart';
import 'package:vader_popup/parts/header.dart';

Icon? getIconByType(PopupType type, {double size = 70}) {
  switch (type) {
    case PopupType.info:
      return Icon(Icons.info, color: Colors.blue, size: size);
    case PopupType.success:
      return Icon(Icons.check_circle, color: Colors.green, size: size);
    case PopupType.warning:
      return Icon(Icons.warning, color: Colors.orange, size: size);
    case PopupType.error:
      return Icon(Icons.error, color: Colors.red, size: size);
    case PopupType.question:
      return Icon(Icons.question_mark, color: Colors.blue, size: size);
    case PopupType.input:
    case PopupType.chooser:
      return null;
  }
}

Color getColorByType(PopupType type, {Color defaultColor = Colors.blue}) {
  switch (type) {
    case PopupType.info:
      return Colors.blue;
    case PopupType.success:
      return Colors.green;
    case PopupType.warning:
      return Colors.orange;
    case PopupType.error:
      return Colors.red;
    case PopupType.question:
      return Colors.blue;
    case PopupType.input:
    case PopupType.chooser:
      return defaultColor;
  }
}

class VaderPopup {
  simpleMessage() {}

  longMessage() {}

  question() {}

  input() {}

  chooseList() {}

  static Future<dynamic> info(
    BuildContext context, {
    required String title,
    required String message,
  }) {
    return VaderPopup.dialog(
      context,
      type: PopupType.info,
      title: title,
      message: message,
    );
  }

  static Future<dynamic> success(
    BuildContext context, {
    required String title,
    required String message,
  }) {
    return VaderPopup.dialog(
      context,
      type: PopupType.success,
      title: title,
      message: message,
    );
  }

  static Future<dynamic> warning(
      BuildContext context, {
        required String title,
        required String message,
      }) {
    return VaderPopup.dialog(
      context,
      type: PopupType.warning,
      title: title,
      message: message,
    );
  }

  static Future<dynamic> error(
      BuildContext context, {
        required String title,
        required String message,
      }) {
    return VaderPopup.dialog(
      context,
      type: PopupType.error,
      title: title,
      message: message,
    );
  }

  static Future<dynamic> dialog(
    BuildContext context, {
    required PopupType type,
    required String title,
    required String message,
    Color? buttonColor,
    Icon? icon,
  }) {
    return VaderPopup.customDialog(
      context: context,
      header: PopupHeader(
        icon: icon ?? getIconByType(type),
        title: PopupText(text: title),
      ),
      content: PopupMessage(
        text: PopupText(text: message),
      ),
      buttons: [
        PopupButton(
          label: "OK",
          color: buttonColor ?? getColorByType(type),
          width: double.infinity,
          onPressed: () {
            Navigator.of(context).pop(true);
          },
        ),
      ],
    );
  }

  static Future<dynamic> customDialog({
    required BuildContext context,
    header = const PopupHeader(),
    content = const PopupContent(),
    PopupDesign design = const PopupDesign(),
    List<PopupButton> buttons = const [],
    bool isAutoClosed = true,
  }) {
    return showGeneralDialog(
      context: context,
      barrierDismissible: isAutoClosed,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      pageBuilder: (context, animation, secondaryAnimation) {
        return GestureDetector(
          onTap: () {
            if (isAutoClosed || buttons.isEmpty) {
              Navigator.pop(context);
            }
          },
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.black.withOpacity(0.1),
            child: AlertDialog(
              backgroundColor: design.backgroundColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(design.borderRadius),
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
