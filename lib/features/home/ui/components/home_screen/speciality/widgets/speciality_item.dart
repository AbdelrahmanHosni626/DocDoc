import 'package:docdoc/core/helpers/spacing.dart';
import 'package:docdoc/core/utils/assets_manager.dart';
import 'package:docdoc/settings/theming/colors.dart';
import 'package:docdoc/settings/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SpecialityItem extends StatelessWidget {
  const SpecialityItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 28.r,
          backgroundColor: ColorsManager.lightBlue,
          child: SvgPicture.asset(AssetsManager.svgDocDocLogo),
        ),
        verticalSpace(10),
        Text(
          "Abdo",
          style: TextStyles.font12DarkBlueRegular,
        ),
      ],
    );
  }
}
