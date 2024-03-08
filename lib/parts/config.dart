import 'package:flutter/material.dart';
import 'package:vader_popup/parts/buttons.dart';
import 'package:vader_popup/parts/common.dart';
import 'package:vader_popup/parts/design.dart';

class PopupConfig {
  const PopupConfig({
    this.isAutoClosed = true,
    this.design = const PopupDesign(),
    this.confirmButtonLabel = "OK",
    this.yesButtonLabel = "Yes",
    this.noButtonLabel = "No",
    this.questionButtons,
    this.messageButtons,
    this.cancelButtonColor,
    this.iconByType = const {
      PopupType.info: Icon(Icons.info, color: Colors.blue, size: 70),
      PopupType.success: Icon(Icons.check_circle, color: Colors.green, size: 70),
      PopupType.warning: Icon(Icons.warning, color: Colors.orange, size: 70),
      PopupType.error: Icon(Icons.error, color: Colors.red, size: 70),
      PopupType.question: Icon(Icons.question_mark, color: Colors.blue, size: 70),
    },
    this.colorByType = const {
      PopupType.info: Colors.blue,
      PopupType.success: Colors.green,
      PopupType.warning: Colors.orange,
      PopupType.error: Colors.red,
      PopupType.question: Colors.blue,
      PopupType.input: Colors.blue,
      PopupType.chooser: Colors.blue,
    },
  });

  final bool isAutoClosed;
  final PopupDesign design;
  final String confirmButtonLabel;
  final String yesButtonLabel;
  final String noButtonLabel;
  final Color? cancelButtonColor;
  final Map<PopupType, Icon?> iconByType;
  final Map<PopupType, Color> colorByType;
  final List<PopupButton>? questionButtons;
  final List<PopupButton>? messageButtons;
}