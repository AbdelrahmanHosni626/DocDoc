import 'package:auto_route/auto_route.dart';
import 'package:docdoc/core/helpers/spacing.dart';
import 'package:docdoc/core/theming/styles.dart';
import 'package:docdoc/features/auth/cubits/auth_cubit.dart';
import 'package:docdoc/features/auth/cubits/auth_state.dart';
import 'package:docdoc/features/auth/ui/components/form_field_component.dart';
import 'package:docdoc/features/auth/ui/components/have_an_account_component.dart';
import 'package:docdoc/features/shared/widgets/docdoc_snack_bar.dart';
import 'package:docdoc/settings/router/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
        child: BlocConsumer<AuthCubit, AuthState>(
          listenWhen: (previous, current) =>
              current is RegisterLoading ||
              current is RegisterSuccess ||
              current is RegisterFailure,
          listener: (context, state) {
            buildRegisterListener(context, state);
          },
          builder: (context, state) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 30.w),
              child: Center(
                child: ListView(
                  children: [
                    verticalSpace(8),
                    Text(
                      'Create Account',
                      style: TextStyles.font24BlueBold,
                    ),
                    verticalSpace(8),
                    Text(
                      'Sign up now and start exploring all that our app has to offer. We\'re excited to welcome you to our community!',
                      style: TextStyles.font14GreyRegular,
                    ),
                    verticalSpace(36),
                    ValueListenableBuilder(
                      valueListenable: isLoading,
                      builder: (context, value, child) => FormFieldComponent(
                        isLogin: false,
                        isLoading: isLoading.value,
                      ),
                    ),
                    verticalSpace(20),
                    HaveAccountComponent(
                      text: "Already have an account? ",
                      textButton: "Login",
                      onPressed: () {
                        context.replaceRoute(const LoginRoute());
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void buildRegisterListener(BuildContext context, AuthState state) {
    state.whenOrNull(
      registerLoading: () {
        isLoading.value = true;
      },
      registerSuccess: (data) {
        isLoading.value = false;
      },
      registerFailure: (errorMessage) {
        isLoading.value = false;
        DocDocSnackBar.error(
          context: context,
          message: errorMessage,
        );
      },
    );
  }
}
