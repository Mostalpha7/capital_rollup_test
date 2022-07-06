import 'package:flutter/material.dart';

import '../../../resource/color_definition.dart';

class CTAButton extends StatelessWidget {
  final GestureTapCallback onTap;
  final bool? isLoading;
  final Widget? child;
  final Color? bgColor;
  final Color? loadingColor;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final bool isActive;
  final Color? borderColor;
  final double? borderRadiusValue;
  final Border? border;
  const CTAButton(
      {Key? key,
      required this.onTap,
      required this.child,
      this.isLoading = false,
      this.bgColor,
      this.width,
      this.height = 48,
      this.padding,
      this.margin,
      this.border,
      this.loadingColor,
      this.borderColor = Colors.transparent,
      required this.isActive,
      this.borderRadiusValue = 12})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => isActive && isLoading == false ? onTap() : () {},
      child: Container(
        height: height,
        width: width ?? double.infinity,
        padding:
            isLoading! ? EdgeInsets.zero : padding ?? const EdgeInsets.all(12),
        margin: margin ?? EdgeInsets.zero,
        decoration: BoxDecoration(
          border: border ?? Border.all(color: borderColor!),
          borderRadius: BorderRadius.all(Radius.circular(borderRadiusValue!)),
          color: isActive
              ? bgColor ?? ColorDefinition.kBlackColor
              : (bgColor ?? ColorDefinition.kBlackColor).withOpacity(0.5),
        ),
        child: isLoading!
            ? Center(
                child: SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2.0,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      loadingColor ?? Colors.white,
                    ),
                  ),
                ),
              )
            : child,
      ),
    );
  }
}
