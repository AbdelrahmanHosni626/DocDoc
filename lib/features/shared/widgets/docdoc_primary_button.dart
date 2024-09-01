import 'package:docdoc/core/theming/colors.dart';
import 'package:docdoc/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DocDocPrimaryButton extends StatelessWidget {
  final double? height;
  final double? width;
  final String title;
  final TextStyle? titleStyle;
  final Color? color;
  final Color? textColor;
  final void Function() onTap;
  final bool isOutLined;
  final bool isActive;
  final bool isLoading;
  final int flexBetweenTextAndPrefix;
  final BorderRadiusGeometry? borderRadius;

  const DocDocPrimaryButton({
    super.key,
    required this.onTap,
    this.height,
    this.width,
    required this.title,
    this.titleStyle,
    this.color,
    this.textColor,
    this.isOutLined = false,
    this.isActive = true,
    this.isLoading = false,
    this.flexBetweenTextAndPrefix = 3,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isActive ? onTap : null,
      child: Container(
        width: width ?? 312.w,
        height: height ?? 52.h,
        decoration: BoxDecoration(
          color: isOutLined
              ? Colors.transparent
              : color ??
                  (isActive
                      ? ColorsManager.mainBlue
                      : ColorsManager.mainBlue.withOpacity(0.4)),
          border: isOutLined
              ? Border.all(color: color ?? ColorsManager.mainBlue)
              : null,
          borderRadius: borderRadius ?? BorderRadius.circular(16).r,
        ),
        child: Center(
            child: isLoading
                ? CircularProgressIndicator(
                    color: isOutLined ? ColorsManager.mainBlue : Colors.white,
                  )
                : buildButtonText(context)),
      ),
    );
  }

  Text buildButtonText(BuildContext context) {
    return Text(
      title,
      style: titleStyle ??
          TextStyles.font16WhiteSemiBold.copyWith(
            color: textColor ??
                (isOutLined ? ColorsManager.mainBlue : Colors.white),
          ),
    );
  }
}
