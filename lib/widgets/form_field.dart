import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../tu.dart';

class TuFormField extends StatefulHookWidget {
  final String? label;
  final String hint;
  final dynamic value;
  final Widget? suffix;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Widget? prefix;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final Function(Function)? onShowHidePass;
  final String? Function(String?)? validator;
  final bool required;
  final bool isPass;
  final bool showEye;
  final bool hasBorder;
  final bool enabled;
  final TextInputType keyboard;
  final double radius;
  final double elevation;
  final double height;
  final double my;
  final bool isLegacy;
  final bool readOnly;
  final bool autofocus;
  final int? maxLines;
  final int? minLines;
  final double? width;
  final int? maxLength;
  final TextAlign textAlign;
  final TextAlignVertical? textAlignV;
  final bool expands;
  final FloatingLabelAlignment? labelAlignment;
  final Function()? onTap;
  final FocusNode? focusNode;
  final Color? fill;
  final List<TextInputFormatter> inputFormatters;
  const TuFormField(
      {super.key,
      this.label,
      this.my = 2.5,
      this.textAlignV,
      this.focusNode,
      this.enabled = true,
      this.suffixIcon,
      this.suffix,
      this.onSubmitted,
      this.width,
      this.prefixIcon,
      this.prefix,
      this.onTap,
      this.hint = "",
      this.value,
      this.radius = 4,
      this.elevation = 0,
      this.height = 12,
      this.maxLines,
      this.minLines,
      this.maxLength,
      this.onChanged,
      this.onShowHidePass,
      this.required = false,
      this.isLegacy = false,
      this.autofocus = false,
      this.expands = false,
      this.readOnly = false,
      this.isPass = false,
      this.showEye = true,
      this.hasBorder = true,
      this.inputFormatters = const [],
      this.validator,
      this.fill,
      this.textAlign = TextAlign.start,
      this.labelAlignment,
      this.keyboard = TextInputType.name});

  @override
  State<TuFormField> createState() => _TuFormFieldState();
}

class _TuFormFieldState extends State<TuFormField> {
  final _controller = TextEditingController();
  late FocusNode _focusNode;
  bool _hasFocus = false;
  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _focusNode = widget.focusNode ?? FocusNode();
    _focusNode.addListener(() {
      setState(() {
        _hasFocus = _focusNode.hasFocus;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final showPass = useState(false);
    void updateVal() {
      if (widget.value == null) {
        _controller.text = "";
      } else if (widget.value != _controller.text) {
        _controller.text = "${widget.value}";
      }
    }

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      updateVal();
    });
    final border = widget.hasBorder
        ? UnderlineInputBorder(
            borderSide: BorderSide(color: Tu.colors.primaryFade, width: 2),
            borderRadius: BorderRadius.circular(widget.radius),
          )
        : OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.radius),
            borderSide: const BorderSide(color: Colors.transparent));
    final focusedBorder = !widget.hasBorder
        ? OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.radius),
            borderSide: const BorderSide(color: Colors.transparent))
        : UnderlineInputBorder(
            borderSide: BorderSide(color: Tu.colors.primary, width: 3),
            borderRadius: BorderRadius.circular(widget.radius),
          );
    return Obx(
      () => TextFormField(
        textAlign: widget.textAlign,
        maxLength: widget.maxLength,
        textCapitalization: TextCapitalization.sentences,
        inputFormatters: widget.inputFormatters,
        onTapOutside: (e) {
          _focusNode.unfocus();
        },
        readOnly: widget.readOnly,
        controller: _controller,
        autofocus: widget.autofocus,
        onTap: widget.onTap,
        expands: widget.expands,
        onFieldSubmitted: widget.onSubmitted,
        focusNode: _focusNode,
        onChanged: widget.onChanged,
        obscureText: widget.isPass && !showPass.value,
        maxLines: widget.maxLines,
        minLines: widget.minLines,
        validator: widget.validator ??
            (val) {
              String? msg;
              if ((widget.required && val != null && val.isEmpty) ||
                  val == null) {
                msg = "Field is required!";
              }
              return msg;
            },
        autocorrect: true,
        keyboardType: widget.keyboard,
        style: const TextStyle(
          fontSize: 16,
        ),
        decoration: InputDecoration(
          enabled: widget.enabled,
          prefixIconColor: _hasFocus ? Tu.colors.onSurface : Tu.colors.note,
          suffixIconColor: _hasFocus ? Tu.colors.onSurface : Tu.colors.note,
          fillColor: widget.fill ?? Tu.colors.bgField,

          filled: true,
          isDense: false,
          contentPadding: EdgeInsets.only(
            top: widget.height,
            bottom: widget.height,
            left: 15,
            right: 15,
          ),

          prefixIcon: widget.prefixIcon,
          prefix: widget.prefix,
          suffix: widget.suffix,
          suffixIcon: widget.isPass && widget.showEye
              ? IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () async {
                    //SHowHide pass

                    if (!showPass.value && widget.onShowHidePass != null) {
                      // Pass hidden and the event handler is provided
                      // Invoke the handler
                      void setShowPass(bool val) {
                        showPass.value = val;
                      }

                      await widget.onShowHidePass!(setShowPass);
                    } else {
                      showPass.value = !showPass.value;
                    }
                  },
                  splashRadius: 18,
                  icon: Icon(!showPass.value
                      ? CupertinoIcons.eye
                      : CupertinoIcons.eye_slash))
              : widget.suffixIcon,

          labelText:
              !widget.hasBorder || !widget.isLegacy ? widget.label : null,

          hintText: widget.hint,

          floatingLabelAlignment: widget.labelAlignment,

          enabledBorder: border,
          focusedBorder: focusedBorder,
          focusedErrorBorder: focusedBorder,
          errorBorder: border,

          //border: radius != null ? border : null,
        ),
        textAlignVertical: widget.textAlignV,
      ),
    );
  }
}
