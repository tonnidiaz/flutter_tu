import "package:flutter/material.dart";
import "package:tu/tu.dart";

class TuDialogView extends StatefulWidget {
  final bool isForm;
  final Function(dynamic val)? onOk;
  final Function()? onCancel;
  final Widget? content;
  final String? title;
  final List<Widget> fields;
  final String okTxt;
  final bool hasActions;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? titlePadding;
  final Widget Function(Function(dynamic val) setValue)? builder;

  const TuDialogView(
      {super.key,
      this.isForm = false,
      this.padding,
      this.hasActions = true,
      this.onOk,
      this.onCancel,
      this.content,
      this.builder,
      this.titlePadding,
      this.okTxt = "Ok",
      this.title,
      this.fields = const []});

  @override
  State<TuDialogView> createState() => _TuDialogViewState();
}

class _TuDialogViewState extends State<TuDialogView> {
  dynamic value;
  _setValue(dynamic newValue) {
    setState(() {
      value = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return AlertDialog(
      actionsPadding: const EdgeInsets.fromLTRB(6, 0, 15, 10),
      titlePadding: widget.titlePadding,
      contentPadding: widget.padding ??
          EdgeInsets.fromLTRB(25, 20, 25, widget.hasActions ? 0 : 20),
      backgroundColor: Tu.colors.bg0,
      insetPadding: const EdgeInsets.all(20),
      elevation: 1.88,
      title: widget.title != null
          ? Text(
              widget.title!,
              style: TextStyle(color: Tu.colors.onSurface),
            )
          : null,
      content: widget.isForm
          ? Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...widget.fields,
                ],
              ))
          : widget.content ?? widget.builder!(_setValue),
      actions: !widget.hasActions
          ? null
          : [
              TextButton(
                child: const Text("Cancel"),
                onPressed: () {
                  if (widget.onCancel != null) {
                    widget.onCancel!();
                  } else {
                    clog('DLG GPOP');
                    gpop();
                  }
                },
              ),
              TextButton(
                child: Text(widget.okTxt),
                onPressed: () async {
                  if (widget.isForm) {
                    if (formKey.currentState!.validate()) {
                      // Validate form first
                      if (widget.onOk != null) {
                        await widget.onOk!(value);
                      }
                    }
                  } else {
                    if (widget.onOk != null) {
                      await widget.onOk!(value);
                    }
                  }
                },
              )
            ],
    );
  }
}
