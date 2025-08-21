import 'package:flutter/material.dart';
import 'package:movies_app/utils/dialogs/custom_dialog_content.dart';

abstract class Dialogs {
  static customDialog({
    required BuildContext context,
    List<Widget>? actions,
    Widget? content,
  }) {
    return showDialog(
      context: context,
      builder: (context) =>
          CustomDialogContent(content: content, actions: actions),
    );
  }
}
