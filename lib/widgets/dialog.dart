import "package:flutter/material.dart";
import "package:tu/tu.dart";

class TuDialogView extends StatelessWidget {
  final bool isForm;
  final Function()? onOk;
  final Widget? content;
  final String title;
  final List<Widget> fields;
  final String okTxt;
  final bool hasActions;
  const TuDialogView(
      {super.key,
      this.isForm = false,
      this.hasActions = true,
      this.onOk,
      this.content,
      this.okTxt = "Ok",
      this.title = "",
      this.fields = const []});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return AlertDialog(
      /*  contentPadding: EdgeInsets.fromLTRB(15, 0, 15, hasActions ? 0 : 20),
      titlePadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
     
      actionsPadding: const EdgeInsets.fromLTRB(6, 10, 15, 16), */
      //elevation: .5,
      insetPadding: const EdgeInsets.all(20),
      title: Text(
        title,
      ),
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
                /* text: "CANCEL",
                height: 35,
                bgColor: TuColors.medium,
                radius: 5,
                color: TuColors.text2(dark: true), */
                child: const Text("Cancel"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              TextButton(
                child: Text(okTxt),
                /* text: okTxt,
                height: 35,

                color: TuColors.text2(dark: true),
                radius: 5,
                bgColor: Colors.blue, */
                //bgColor: Colors.black87,
                // height: 35,
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
