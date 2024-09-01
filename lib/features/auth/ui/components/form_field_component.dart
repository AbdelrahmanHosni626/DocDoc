import 'package:docdoc/core/helpers/app_regex.dart';
import 'package:docdoc/core/helpers/spacing.dart';
import 'package:docdoc/core/theming/styles.dart';
import 'package:docdoc/features/auth/cubits/auth_cubit.dart';
import 'package:docdoc/features/auth/data/models/login_request_body.dart';
import 'package:docdoc/features/auth/data/models/register_request_body.dart';
import 'package:docdoc/features/shared/widgets/docdoc_primary_button.dart';
import 'package:docdoc/features/shared/widgets/docdoc_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'password_validations_component.dart';

class FormFieldComponent extends StatefulWidget {
  final bool isLogin;
  final bool? isLoading;

  const FormFieldComponent({super.key, required this.isLogin, this.isLoading});

  @override
  State<FormFieldComponent> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<FormFieldComponent> {
  bool isObscureText = true;

  bool hasLowercase = false;
  bool hasUppercase = false;
  bool hasSpecialCharacters = false;
  bool hasNumber = false;
  bool hasMinLength = false;
  bool isObscureTextConfirmed = true;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    setupPasswordControllerListener();
  }

  void setupPasswordControllerListener() {
    passwordController.addListener(() {
      setState(() {
        hasLowercase = AppRegex.hasLowerCase(passwordController.text);
        hasUppercase = AppRegex.hasUpperCase(passwordController.text);
        hasSpecialCharacters =
            AppRegex.hasSpecialCharacter(passwordController.text);
        hasNumber = AppRegex.hasNumber(passwordController.text);
        hasMinLength = AppRegex.hasMinLength(passwordController.text);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: widget.isLogin
          ? Column(
              children: [
                DocDocTextFormField(
                  hintText: 'Email',
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        !AppRegex.isEmailValid(value)) {
                      return 'Please enter a valid email';
                    }
                  },
                  controller: emailController,
                  isObSecureText: false,
                  keyboardType: TextInputType.emailAddress,
                ),
                verticalSpace(18),
                DocDocTextFormField(
                  controller: passwordController,
                  hintText: 'Password',
                  isObSecureText: isObscureText,
                  keyboardType: TextInputType.visiblePassword,
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        isObscureText = !isObscureText;
                      });
                    },
                    child: Icon(
                      isObscureText ? Icons.visibility_off : Icons.visibility,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a valid password';
                    }
                  },
                ),
                verticalSpace(24),
                PasswordValidationsComponent(
                  hasLowerCase: hasLowercase,
                  hasUpperCase: hasUppercase,
                  hasNumber: hasNumber,
                  hasMinLength: hasMinLength,
                  hasSpecialCharacter: hasSpecialCharacters,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Forgot Password?',
                    style: TextStyles.font12BlueRegular,
                  ),
                ),
                verticalSpace(32),
                DocDocPrimaryButton(
                  title: 'Login',
                  onTap: () {
                    buildLoginMethod(context);
                  },
                  isLoading: widget.isLoading ?? false,
                ),
              ],
            )
          : Column(
              children: [
                DocDocTextFormField(
                  hintText: 'Name',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a valid name';
                    }
                  },
                  controller: nameController,
                  isObSecureText: false,
                  keyboardType: TextInputType.name,
                ),
                verticalSpace(18),
                DocDocTextFormField(
                  hintText: 'Phone Number',
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        !AppRegex.isPhoneNumberValid(value)) {
                      return 'Please enter a valid phone number';
                    }
                  },
                  controller: phoneController,
                  isObSecureText: false,
                  keyboardType: TextInputType.phone,
                ),
                verticalSpace(18),
                DocDocTextFormField(
                  hintText: 'Email',
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        !AppRegex.isEmailValid(value)) {
                      return 'Please enter a valid email';
                    }
                  },
                  controller: emailController,
                  isObSecureText: false,
                  keyboardType: TextInputType.emailAddress,
                ),
                verticalSpace(18),
                DocDocTextFormField(
                  controller: passwordController,
                  hintText: 'Password',
                  isObSecureText: isObscureText,
                  keyboardType: TextInputType.visiblePassword,
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        isObscureText = !isObscureText;
                      });
                    },
                    child: Icon(
                      isObscureText ? Icons.visibility_off : Icons.visibility,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a valid password';
                    }
                  },
                ),
                verticalSpace(18),
                DocDocTextFormField(
                  controller: confirmPasswordController,
                  hintText: 'Confirm Password',
                  isObSecureText: isObscureTextConfirmed,
                  keyboardType: TextInputType.visiblePassword,
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        isObscureTextConfirmed = !isObscureTextConfirmed;
                      });
                    },
                    child: Icon(
                      isObscureTextConfirmed
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                  ),
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        value != passwordController.text) {
                      return 'Passwords do not match';
                    }
                  },
                ),
                verticalSpace(24),
                PasswordValidationsComponent(
                  hasLowerCase: hasLowercase,
                  hasUpperCase: hasUppercase,
                  hasNumber: hasNumber,
                  hasMinLength: hasMinLength,
                  hasSpecialCharacter: hasSpecialCharacters,
                ),
                verticalSpace(32),
                DocDocPrimaryButton(
                  title: 'Create Account',
                  onTap: () {
                    buildRegisterMethod(context);
                  },
                  isLoading: widget.isLoading ?? false,
                ),
              ],
            ),
    );
  }

  void buildLoginMethod(BuildContext context) {
    if (formKey.currentState!.validate()) {
      context.read<AuthCubit>().emitLoginStates(
            LoginRequestBody(
              email: emailController.text,
              password: passwordController.text,
            ),
          );
    }
  }

  void buildRegisterMethod(BuildContext context) {
    if (formKey.currentState!.validate()) {
      context.read<AuthCubit>().emitRegisterStates(
            RegisterRequestBody(
              name: nameController.text,
              email: emailController.text,
              phone: phoneController.text,
              gender: 0,
              password: passwordController.text,
              confirmPassword: confirmPasswordController.text,
            ),
          );
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    nameController.dispose();
    phoneController.dispose();
    super.dispose();
  }
}
