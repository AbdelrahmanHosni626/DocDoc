import 'package:docdoc/core/helpers/spacing.dart';
import 'package:docdoc/settings/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecommendationItem extends StatelessWidget {
  const RecommendationItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12).r,
          child: Image.network(
            "placeholder",
            height: 120.h,
            width: 110.w,
            fit: BoxFit.cover,
          ),
        ),
        horizontalSpace(16),
        Column(
          children: [
            Text(
              "Dr. Randy Wigham",
              style: TextStyles.font18DarkBlueBold,
            ),
            verticalSpace(5),
            Text(
              "General | RSUD Gatot Subroto",
              style: TextStyles.font12GreyRegular,
            ),
            verticalSpace(5),
            Text(
              "(4,279 reviews)",
              style: TextStyles.font12GreyMedium,
            ),
          ],
        ),
      ],
    );
  }
}
