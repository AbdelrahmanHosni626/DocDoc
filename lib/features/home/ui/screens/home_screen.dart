import 'package:auto_route/auto_route.dart';
import 'package:docdoc/core/helpers/spacing.dart';
import 'package:docdoc/core/utils/assets_manager.dart';
import 'package:docdoc/features/home/ui/components/home_screen/speciality/speciality_component.dart';
import 'package:docdoc/features/shared/widgets/docdoc_primary_button.dart';
import 'package:docdoc/settings/theming/colors.dart';
import 'package:docdoc/settings/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 28).r,
          child: ListView(
            children: [
              homeAppBar(),
              homeCard(),
              verticalSpace(24),
              const SpecialityComponent(),
            ],
          ),
        ),
      ),
    );
  }

  Widget homeAppBar() {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hi, Abdelrahman',
              style: TextStyles.font18DarkBlueBold,
            ),
            Text(
              'How Are you Today?',
              style: TextStyles.font12GreyRegular,
            ),
          ],
        ),
        const Spacer(),
        CircleAvatar(
          radius: 24.r,
          backgroundColor: ColorsManager.moreLighterGray,
          child: SvgPicture.asset(AssetsManager.notificationsIcon),
        ),
      ],
    );
  }

  Widget homeCard() {
    return SizedBox(
      height: 195.h,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: 165.h,
            width: double.infinity,
            padding: const EdgeInsets.all(16).r,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24).r,
              image: const DecorationImage(
                image: AssetImage(AssetsManager.homePattern),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Book and\nschedule with\nnearest doctor",
                  style: TextStyles.font18WhiteMedium,
                ),
                const Spacer(),
                DocDocPrimaryButton(
                  height: 38.h,
                  width: 109.w,
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(48).r,
                  onTap: () {},
                  title: "Find Nearby",
                  titleStyle: TextStyles.font12BlueRegular,
                ),
              ],
            ),
          ),
          PositionedDirectional(
            end: 15.w,
            bottom: 0,
            child: Image.asset(
              AssetsManager.cardDoctor,
              height: 195.h,
            ),
          ),
        ],
      ),
    );
  }
}
