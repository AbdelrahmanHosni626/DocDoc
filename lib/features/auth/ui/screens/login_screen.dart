import 'package:auto_route/auto_route.dart';
import 'package:docdoc/core/helpers/spacing.dart';
import 'package:docdoc/features/auth/cubits/auth_cubit.dart';
import 'package:docdoc/features/auth/cubits/auth_state.dart';
import 'package:docdoc/features/auth/ui/components/form_field_component.dart';
import 'package:docdoc/features/auth/ui/components/have_an_account_component.dart';
import 'package:docdoc/features/shared/widgets/docdoc_snack_bar.dart';
import 'package:docdoc/settings/router/app_router.gr.dart';
import 'package:docdoc/settings/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late ValueNotifier<bool> isLoading;

  @override
  void initState() {
    super.initState();
    isLoading = ValueNotifier(false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 30.w),
          child: Center(
            child: BlocConsumer<AuthCubit, AuthState>(
              listenWhen: (previous, current) =>
                  current is LoginLoading ||
                  current is LoginSuccess ||
                  current is LoginFailure,
              listener: (context, state) {
                buildLoginListener(context, state);
              },
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    verticalSpace(8),
                    Text(
                      'Welcome Back',
                      style: TextStyles.font24BlueBold,
                    ),
                    verticalSpace(8),
                    Text(
                      'We\'re excited to have you back, can\'t wait to see what you\'ve been up to since you last logged in.',
                      style: TextStyles.font14GreyRegular,
                    ),
                    verticalSpace(36),
                    ValueListenableBuilder(
                      valueListenable: isLoading,
                      builder: (context, value, child) => FormFieldComponent(
                        isLogin: true,
                        isLoading: isLoading.value,
                      ),
                    ),
                    verticalSpace(20),
                    termsAndConditions(),
                    verticalSpace(60),
                    HaveAccountComponent(
                      text: "Don't have an account? ",
                      textButton: "Sign Up",
                      onPressed: () {
                        context.replaceRoute(const RegisterRoute());
                      },
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget termsAndConditions() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'By logging, you agree to our',
            style: TextStyles.font13GreyRegular,
          ),
          TextSpan(
            text: '  Terms & Conditions',
            style: TextStyles.font14DarkBlueMedium,
          ),
          TextSpan(text: ' and', style: TextStyles.font13GreyRegular),
          TextSpan(
            text: '  PrivacyPolicy.',
            style: TextStyles.font14DarkBlueMedium,
          ),
        ],
      ),
    );
  }

  void buildLoginListener(BuildContext context, AuthState state) {
    state.whenOrNull(loginLoading: () {
      isLoading.value = true;
    }, loginSuccess: (data) {
      isLoading.value = false;
      DocDocSnackBar.success(
        context: context,
        message: "Logged In Successfully",
      );
    }, loginFailure: (errorMessage) {
      isLoading.value = false;
      DocDocSnackBar.error(
        context: context,
        message: errorMessage,
      );
    });
  }
}
