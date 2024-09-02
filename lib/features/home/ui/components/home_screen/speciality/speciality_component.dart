import 'package:docdoc/features/home/ui/components/home_screen/speciality/widgets/speciality_item.dart';
import 'package:docdoc/features/shared/widgets/section_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SpecialityComponent extends StatelessWidget {
  const SpecialityComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionWidget(
          sectionTitle: "Doctor Speciality",
          sectionType: SectionType.withTextButton,
          padding: EdgeInsets.zero,
          onTextButtonTap: () {},
        ),
        SizedBox(
          height: 100.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, index) {
              return const SpecialityItem();
            },
            separatorBuilder: (context, index) => SizedBox(width: 24.w),
          ),
        ),
      ],
    );
  }
}
