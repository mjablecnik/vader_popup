import 'package:flutter/material.dart';
import 'package:vader_popup/parts/buttons.dart';
import 'package:vader_popup/parts/common.dart';
import 'package:vader_popup/parts/design.dart';

class PopupConfig {
  const PopupConfig({
    this.isAutoClosed = true,
    this.design = const PopupDesign(),
    this.dialogSize = const Size(200, 400),
    this.confirmButtonLabel = "OK",
    this.submitButtonLabel = "Submit",
    this.cancelButtonLabel = "Cancel",
    this.yesButtonLabel = "Yes",
    this.noButtonLabel = "No",
    this.questionButtons,
    this.messageButtons,
    this.cancelButtonColor,
    this.maxShortMessagesLines = 3,
    this.longMessageGradientFraction = 0.4,
    this.longMessageHeight = 315,
    this.shortMessageHeight = 60,
    this.chooseMessageHeight = 36,
    this.inputMessageHeight = 40,
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
      PopupType.choose: Colors.blue,
    },
  });

  final bool isAutoClosed;
  final Size dialogSize;
  final PopupDesign design;
  final String confirmButtonLabel;
  final String submitButtonLabel;
  final String cancelButtonLabel;
  final String yesButtonLabel;
  final String noButtonLabel;
  final Color? cancelButtonColor;
  final int maxShortMessagesLines;
  final double longMessageGradientFraction;
  final double longMessageHeight;
  final double shortMessageHeight;
  final double chooseMessageHeight;
  final double inputMessageHeight;
  final Map<PopupType, Icon?> iconByType;
  final Map<PopupType, Color> colorByType;
  final List<PopupButton>? questionButtons;
  final List<PopupButton>? messageButtons;
}