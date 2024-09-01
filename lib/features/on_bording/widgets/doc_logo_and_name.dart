import 'package:docdoc/core/theming/styles.dart';
import 'package:docdoc/core/utils/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class DocLogoAndName extends StatelessWidget {
  const DocLogoAndName({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(AssetsManager.svgDocDocLogo),
        SizedBox(width: 10.w),
        Text(
          'DocDoc',
          style: TextStyles.font24BlackBold,
        )
      ],
    );
  }
}
