import 'package:capital_rollup_test/presentation/resource/text_style_definition.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../resource/color_definition.dart';

class InputField extends StatefulWidget {
  const InputField(
      {Key? key,
      this.enabled,
      this.textEditingController,
      this.textInputAction,
      this.textInputType,
      this.focusNode,
      this.onSubmitted,
      this.validator,
      this.hintText,
      this.forceRefresh,
      this.border,
      this.decoration,
      this.obscureText,
      this.readOnly,
      this.style,
      this.onFieldSubmitted,
      this.cursorColor,
      this.inputFormatters,
      this.onChanged,
      this.isPasswordField = false,
      this.suffixConstraints,
      this.suffixIcon,
      this.prefixIcon,
      this.hintStyle,
      this.onTap,
      this.hideHoverBorderColor,
      this.inputName,
      this.inputNameAsWidget,
      this.fillColor,
      this.contentPadding,
      this.shadeInputBackgroundColor = false,
      this.enabledBorderColor,
      this.errorBorderColor,
      this.focusedBorderColor,
      this.filled,
      this.prefixConstraints})
      : super(key: key);

  final TextEditingController? textEditingController;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  final FocusNode? focusNode;
  final ValueChanged<String>? onSubmitted;
  final FormFieldValidator<String>? validator;
  final String? hintText;
  final bool? obscureText;
  final bool? readOnly;
  final Function? forceRefresh;
  final InputDecoration? decoration;
  final TextStyle? style;
  final ValueChanged<String>? onFieldSubmitted;
  final Color? cursorColor;
  final List<TextInputFormatter>? inputFormatters;
  final ValueChanged<String>? onChanged;
  final bool? isPasswordField;
  final Widget? suffixIcon;
  final InputBorder? border;
  final Widget? prefixIcon;
  final BoxConstraints? suffixConstraints;
  final BoxConstraints? prefixConstraints;
  final TextStyle? hintStyle;
  final Function? onTap;
  final String? inputName;
  final Widget? inputNameAsWidget;
  final bool? hideHoverBorderColor;
  final Color? enabledBorderColor;
  final Color? errorBorderColor;
  final Color? focusedBorderColor;
  final Color? fillColor;
  final bool? filled;
  final bool? shadeInputBackgroundColor;
  final bool? enabled;

  final EdgeInsetsGeometry? contentPadding;
  @override
  _InputFieldState createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  bool _isVisible = false;
  bool _showVisibility = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.inputName != null
            ? Text(
                widget.inputName ?? "",
                style: TextStyleDefinition.k14fontSize
                    .copyWith(color: ColorDefinition.kInputAltColor),
              )
            : widget.inputNameAsWidget ?? const SizedBox(),
        const SizedBox(height: 7),
        TextFormField(
          enabled: widget.enabled,
          inputFormatters: widget.inputFormatters ?? [],
          focusNode: widget.focusNode,
          controller: widget.textEditingController,
          textInputAction: widget.textInputAction,
          onTap: () {
            if (widget.onTap != null) widget.onTap!();
          },
          onChanged: (args) {
            if (args.length > 1) {
              setState(() => _isVisible = true);
            } else if (args.isEmpty) {
              setState(() => _isVisible = false);
            } else if (widget.textEditingController!.text.isEmpty) {
              setState(() => _isVisible = false);
            }
            if (widget.forceRefresh != null) widget.forceRefresh!();
            if (widget.onChanged != null) widget.onChanged!(args);
          },
          obscureText: widget.isPasswordField! ? _showVisibility : false,
          readOnly: widget.readOnly ?? false,
          decoration: widget.decoration ??
              InputDecoration(
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                      width: 1.3,
                      color: widget.validator != null
                          ? widget.errorBorderColor ??
                              ColorDefinition.kErrorColor
                          : widget.enabledBorderColor ??
                              ColorDefinition.kInputBorderColor),
                ),
                border: widget.border ??
                    OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                suffixIcon: widget.suffixIcon ??
                    Padding(
                      padding: EdgeInsets.only(
                          right: widget.isPasswordField! && !_isVisible ||
                                  !(widget.focusNode ?? FocusNode()).hasFocus
                              ? 0.0
                              : 14.0),
                      child: widget.isPasswordField!
                          ? GestureDetector(
                              behavior: HitTestBehavior.translucent,
                              onTap: () {
                                setState(
                                    () => _showVisibility = !_showVisibility);
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    right: 14.0, left: 14.0),
                                child: Icon(
                                  _showVisibility
                                      ? Icons.visibility_off
                                      : Icons.remove_red_eye,
                                  size: 20,
                                  color: Colors.grey,
                                ),
                              ),
                            )
                          : const SizedBox(),
                    ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    width: 1.2,
                    color:
                        widget.errorBorderColor ?? ColorDefinition.kErrorColor,
                  ),
                ),
                suffixIconConstraints: widget.suffixConstraints ??
                    const BoxConstraints(minHeight: 0, minWidth: 0),
                prefixIcon: widget.prefixIcon,
                prefixIconConstraints: widget.prefixConstraints ??
                    const BoxConstraints(minHeight: 0, minWidth: 0),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    width: 1.2,
                    color: widget.enabledBorderColor ??
                        ColorDefinition.kInputBorderColor,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    width: 1.2,
                    color: widget.focusedBorderColor ??
                        ((widget.hideHoverBorderColor ?? false)
                            ? ColorDefinition.kBlackColor
                            : ColorDefinition.kInputFucosBorderColor),
                  ),
                ),
                contentPadding: widget.contentPadding ??
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                hintText: widget.hintText,
                fillColor: widget.fillColor,
                filled: widget.filled,
              ),
          onFieldSubmitted: widget.onFieldSubmitted ?? (_) {},
          validator: (val) {
            if (widget.validator != null) return widget.validator!(val);
            return null;
          },
          keyboardType: widget.textInputType,
        ),
      ],
    );
  }
}

class InputFieldAlt extends StatefulWidget {
  const InputFieldAlt({
    Key? key,
    this.textEditingController,
    this.border,
    this.textInputAction,
    this.textInputType,
    this.focusNode,
    this.onSubmitted,
    this.hintText,
    this.maxLines = 1,
    this.maxLength = 20,
    this.showSuffix = true,
    this.enableBorder = true,
    this.isDense = false,
    this.onChanged,
    this.validator,
    this.enabled = true,
    this.contentPadding,
    this.decoration,
    this.enabledBorderColor,
    this.fillColor,
    this.errorBorderColor,
    this.filled,
    this.focusedBorderColor,
    this.hideHoverBorderColor,
    this.shadeInputBackgroundColor,
    this.suffixIcon,
    this.prefixIcon,
    this.suffixConstraints,
    this.prefixConstraints,
    this.isPasswordField = false,
  }) : super(key: key);

  final TextEditingController? textEditingController;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  final FocusNode? focusNode;
  final ValueChanged<String>? onSubmitted;
  final String? hintText;
  final int? maxLines;
  final int? maxLength;
  final bool? showSuffix;
  final bool? enableBorder;
  final bool? isDense;
  final Function? onChanged;
  final Function? validator;
  final EdgeInsetsGeometry? contentPadding;
  final bool? enabled;
  final InputDecoration? decoration;
  final bool? hideHoverBorderColor;
  final Color? enabledBorderColor;
  final Color? errorBorderColor;
  final Color? focusedBorderColor;
  final Color? fillColor;
  final bool? filled;
  final bool? shadeInputBackgroundColor;
  final InputBorder? border;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final BoxConstraints? suffixConstraints;
  final BoxConstraints? prefixConstraints;
  final bool? isPasswordField;
  @override
  _WatchlistFormInputFieldState createState() =>
      _WatchlistFormInputFieldState();
}

class _WatchlistFormInputFieldState extends State<InputFieldAlt> {
  bool _showVisibility = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: widget.focusNode,
      controller: widget.textEditingController,
      textInputAction: widget.textInputAction,
      validator: (e) {
        if (widget.validator != null) {
          return widget.validator!(e);
        }
        return null;
      },
      onChanged: (args) {
        if (widget.onChanged != null) {
          widget.onChanged!();
        }

        if (args.length > 1) {
          setState(() {
            _showVisibility = true;
          });
        } else if (args.isEmpty) {
          setState(() {
            _showVisibility = false;
          });
        } else if (widget.textEditingController!.text.isEmpty) {
          setState(() {
            _showVisibility = false;
          });
        }
      },
      decoration: widget.decoration ??
          InputDecoration(
            border: widget.border,
            suffixIcon: widget.suffixIcon ??
                Padding(
                  padding: EdgeInsets.only(
                      right: widget.isPasswordField! && !_showVisibility ||
                              !(widget.focusNode ?? FocusNode()).hasFocus
                          ? 0.0
                          : 14.0),
                  child: widget.isPasswordField!
                      ? GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: () {
                            setState(() => _showVisibility = !_showVisibility);
                          },
                          child: Padding(
                            padding:
                                const EdgeInsets.only(right: 14.0, left: 14.0),
                            child: Icon(
                              _showVisibility
                                  ? Icons.remove_red_eye
                                  : Icons.cabin,
                              size: 20,
                              color: Colors.grey,
                            ),
                          ),
                        )
                      : const SizedBox(),
                ),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                    color: widget.errorBorderColor ??
                        ColorDefinition.kErrorColor)),
            suffixIconConstraints: widget.suffixConstraints ??
                const BoxConstraints(minHeight: 0, minWidth: 0),
            prefixIcon: widget.prefixIcon,
            prefixIconConstraints: widget.prefixConstraints ??
                const BoxConstraints(minHeight: 0, minWidth: 0),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                width: 1.2,
                color: widget.enabledBorderColor ??
                    ColorDefinition.kInputBorderColor,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                width: 1.2,
                color: widget.focusedBorderColor ??
                    ((widget.hideHoverBorderColor ?? false)
                        ? ColorDefinition.kBlackColor
                        : ColorDefinition.kInputFucosBorderColor),
              ),
            ),
            contentPadding: widget.contentPadding ??
                const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            hintText: widget.hintText,
            fillColor: widget.fillColor,
            filled: widget.filled,
            counterText: "",
          ),
      onFieldSubmitted: (_) {},
      keyboardType: widget.textInputType,
      maxLength: widget.maxLength,
      maxLines: widget.maxLines,
      enabled: widget.enabled,
    );
  }
}
