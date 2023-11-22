import "package:flutter/material.dart";
import "package:tu/tu.dart";

class TuDialogView extends StatelessWidget {
  final bool isForm;
  final Function()? onOk;
  final Function()? onCancel;
  final Widget? content;
  final String? title;
  final List<Widget> fields;
  final String okTxt;
  final bool hasActions;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? titlePadding;
  const TuDialogView(
      {super.key,
      this.isForm = false,
      this.padding,
      this.hasActions = true,
      this.onOk,
      this.onCancel,
      this.content,
      this.titlePadding,
      this.okTxt = "Ok",
      this.title,
      this.fields = const []});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return AlertDialog(
      actionsPadding: const EdgeInsets.fromLTRB(6, 0, 15, 10),
      titlePadding: titlePadding,
      contentPadding:
          padding ?? EdgeInsets.fromLTRB(25, 20, 25, hasActions ? 0 : 20),
      backgroundColor: Tu.colors.bg0,
      insetPadding: const EdgeInsets.all(20),
      elevation: 1.88,
      title: title != null
          ? Text(
              title!,
              style: TextStyle(color: Tu.colors.text2),
            )
          : null,
      content: isForm
          ? Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...fields,
                ],
              ))
          : content,
      actions: !hasActions
          ? null
          : [
              TextButton(
                child: const Text("Cancel"),
                onPressed: () {
                  if (onCancel != null) {
                    onCancel!();
                  } else {
                    clog('GPOP');
                    gpop();
                  }
                },
              ),
              TextButton(
                child: Text(okTxt),
                onPressed: () async {
                  if (isForm) {
                    if (formKey.currentState!.validate()) {
                      // Validate form first
                      if (onOk != null) {
                        await onOk!();
                      }
                    }
                  } else {
                    if (onOk != null) {
                      await onOk!();
                    }
                  }
                },
              )
            ],
    );
  }
}
