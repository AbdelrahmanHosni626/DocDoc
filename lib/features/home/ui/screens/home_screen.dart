import 'package:auto_route/auto_route.dart';
import 'package:docdoc/core/utils/assets_manager.dart';
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
}
