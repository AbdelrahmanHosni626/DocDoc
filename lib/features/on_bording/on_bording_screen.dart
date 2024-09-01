import 'package:auto_route/auto_route.dart';
import 'package:docdoc/core/theming/styles.dart';
import 'package:docdoc/features/on_bording/widgets/doc_logo_and_name.dart';
import 'package:docdoc/features/on_bording/widgets/doctor_image_and_text.dart';
import 'package:docdoc/features/shared/widgets/docdoc_primary_button.dart';
import 'package:docdoc/settings/router/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
        child: Center(
          child: Column(
            children: [
              const DocLogoAndName(),
              SizedBox(height: 28.h),
              const DoctorImageAndText(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Column(
                  children: [
                    Text(
                      'Manage and schedule all of your medical appointments easily with Docdoc to get a new experience.',
                      style: TextStyles.font13GreyRegular,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 28.h),
                    DocDocPrimaryButton(
                      width: double.infinity,
                      title: 'Get Started',
                      onTap: () {
                        context.pushRoute(const LoginRoute());
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
