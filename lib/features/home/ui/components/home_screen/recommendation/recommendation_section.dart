import 'package:docdoc/core/helpers/spacing.dart';
import 'package:docdoc/settings/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecommendationSection extends StatelessWidget {
  const RecommendationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12).r,
                child: Image.network(
                  "https://img.freepik.com/free-photo/wide-angle-shot-single-tree-growing-clouded-sky-sunset-surrounded-by-grass_181624-22807.jpg?t=st=1725278971~exp=1725282571~hmac=b2e9d16f12af4cfd39216f9f8c8ddc84eb218fb684cd2c4823c5740ee5d81481&w=740",
                  height: 120.h,
                  width: 110.w,
                  fit: BoxFit.cover,
                ),
              ),
              horizontalSpace(16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
        },
        separatorBuilder: (context, index) => SizedBox(height: 10.h),
      ),
    );
  }
}
