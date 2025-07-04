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
  final List<Widget> buttons;

  Future<dynamic> input(
    BuildContext context, {
    required String title,
    required String? message,
    required String label,
    PopupButton? confirmButton,
    PopupButton? cancelButton,
    Icon? icon,
    FormFieldValidator? validator,
    TextInputType? keyboardType,
    String? initialValue,
  }) {
    final formState = GlobalKey<FormState>();
    final inputController = TextEditingController();
    onSubmit(String value) {
      final result = formState.currentState?.validate();
      if (result == true) {
        Navigator.of(context).pop(value);
      }
    }

    return PopupDialog(
      header: PopupHeader(
        icon: icon,
        title: PopupText(text: title),
      ),
      content: PopupInput(
        label: PopupText(text: label),
        message: message != null ? PopupText(text: message) : null,
        config: config,
        formState: formState,
        controller: inputController,
        onSubmit: onSubmit,
        validator: validator,
        keyboardType: keyboardType,
        initialValue: initialValue,
      ),
      config: config,
      buttons: [
        cancelButton ??
            PopupButton(
              label: config.cancelButtonLabel,
              color: config.cancelButtonColor ?? Colors.grey.withAlpha(153),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
        confirmButton ??
            PopupButton(
              label: config.submitButtonLabel,
              color: config.colorByType[PopupType.input] ?? Colors.blue,
              onPressed: () {
                onSubmit(inputController.text);
              },
            ),
      ],
    ).show(context);
  }

  Future<dynamic> choose({
    required BuildContext context,
    required String title,
    required String message,
    required List<PopupOption> options,
    Icon? icon,
  }) {
    return dialog(
      context: context,
      title: title,
      message: message,
      icon: icon,
      type: PopupType.choose,
      buttons: options,
    );
  }

  Future<dynamic> question({
    required BuildContext context,
    PopupType type = PopupType.question,
    required String title,
    required String message,
    PopupButton? confirmButton,
    PopupButton? cancelButton,
    Icon? icon,
  }) {
    return dialog(
      context: context,
      title: title,
      message: message,
      icon: icon,
      type: PopupType.question,
      buttons: confirmButton == null && cancelButton == null && config.questionButtons != null
          ? config.questionButtons!
          : [
              cancelButton ??
                  PopupButton(
                    label: config.noButtonLabel,
                    color: config.cancelButtonColor ?? Colors.grey.withAlpha(153),
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                  ),
              confirmButton ??
                  PopupButton(
                    label: config.yesButtonLabel,
                    color: config.colorByType[type] ?? Colors.blue,
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                  ),
            ],
    );
  }

  Future<dynamic> message({
    required BuildContext context,
    required PopupType type,
    required String title,
    required String message,
    String? buttonLabel,
    Color? buttonColor,
    Icon? icon,
  }) {
    return dialog(
      context: context,
      type: type,
      title: title,
      message: message,
      icon: icon,
      buttons: config.messageButtons ??
          [
            PopupButton(
              label: buttonLabel ?? config.confirmButtonLabel,
              color: buttonColor ?? config.colorByType[type] ?? Colors.blue,
              width: double.infinity,
              onPressed: () {
                Navigator.of(context).pop(true);
              },
            ),
          ],
    );
  }

  Future<dynamic> dialog({
    required BuildContext context,
    required PopupType type,
    required String title,
    required String message,
    String? buttonLabel,
    Color? buttonColor,
    Icon? icon,
    List<Widget> buttons = const [],
  }) {
    return PopupDialog(
      header: PopupHeader(
        icon: icon ?? config.iconByType[type],
        title: PopupText(text: title),
      ),
      content: PopupMessage(
        message: PopupText(text: message),
        config: config,
        height: type == PopupType.choose ? config.chooseMessageHeight : config.shortMessageHeight,
      ),
      config: config,
      buttons: buttons,
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
            width: config.dialogSize.width,
            height: config.dialogSize.height,
            color: Colors.black.withAlpha(25),
            child: AlertDialog(
              backgroundColor: config.design.backgroundColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(config.design.borderRadius),
              ),
              content: SizedBox(
                width: config.dialogSize.width,
                child: DefaultLayout(
                  header: header,
                  content: content,
                  buttons: buttons,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
