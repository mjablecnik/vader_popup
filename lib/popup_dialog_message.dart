import 'package:flutter/widgets.dart';
import 'package:vader_popup/parts/common.dart';
import 'package:vader_popup/popup_dialog.dart';

extension PopupDialogMessage on PopupDialog {
  Future<dynamic> info(
    BuildContext context, {
    required String title,
    required String message,
  }) {
    return this.message(
      context,
      type: PopupType.info,
      title: title,
      message: message,
    );
  }

  Future<dynamic> success(
    BuildContext context, {
    required String title,
    required String message,
  }) {
    return this.message(
      context,
      type: PopupType.success,
      title: title,
      message: message,
    );
  }

  Future<dynamic> warning(
    BuildContext context, {
    required String title,
    required String message,
  }) {
    return this.message(
      context,
      type: PopupType.warning,
      title: title,
      message: message,
    );
  }

  Future<dynamic> error(
    BuildContext context, {
    required String title,
    required String message,
  }) {
    return this.message(
      context,
      type: PopupType.error,
      title: title,
      message: message,
    );
  }
}
