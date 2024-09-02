import 'package:docdoc/settings/theming/colors.dart';
import 'package:docdoc/settings/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SectionWidget extends StatelessWidget {
  final String sectionTitle;
  final String? sectionButtonTitle;
  final void Function()? onTextButtonTap;
  final SectionType sectionType;
  final EdgeInsets? padding;
  final Color? fontColor;
  const SectionWidget({
    super.key,
    required this.sectionTitle,
    this.sectionButtonTitle,
    this.onTextButtonTap,
    this.sectionType = SectionType.normal,
    this.fontColor,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.symmetric(horizontal: 16.0).r,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            sectionTitle,
            style: TextStyles.font18DarkBlueBold
                .copyWith(color: fontColor ?? ColorsManager.darkBlue),
          ),
          Visibility(
            visible: sectionType == SectionType.withTextButton,
            child: TextButton(
              onPressed: onTextButtonTap,
              child: Text(
                sectionButtonTitle ?? "See All",
                style: TextStyles.font12BlueRegular,
              ),
            ),
          )
        ],
      ),
    );
  }
}

enum SectionType {
  normal,
  withTextButton;
}
