import 'package:docdoc/core/theming/colors.dart';
import 'package:docdoc/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solar_icons/solar_icons.dart';

class DocDocSnackBar {
  static void success({
    required BuildContext context,
    required String message,
  }) {
    custom(
      context: context,
      message: message,
      icon: SolarIconsOutline.checkCircle,
      backgroundColor: ColorsManager.successColor,
    );
  }

  static void error({
    required BuildContext context,
    required String message,
  }) {
    custom(
      context: context,
      message: message,
      icon: SolarIconsOutline.closeCircle,
      backgroundColor: ColorsManager.errorColor,
    );
  }

  static void custom({
    required BuildContext context,
    IconData? icon,
    Color? iconColor,
    Color? backgroundColor,
    TextStyle? textStyle,
    required String message,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon ?? SolarIconsOutline.checkCircle,
              color: iconColor ?? Colors.white,
              size: 20.sp,
            ),
            SizedBox(width: 8.w),
            Expanded(
              child: Text(
                message,
                style: textStyle ?? TextStyles.font16WhiteSemiBold,
              ),
            ),
          ],
        ),
        backgroundColor: backgroundColor ?? Colors.black,
      ),
    );
  }
}
