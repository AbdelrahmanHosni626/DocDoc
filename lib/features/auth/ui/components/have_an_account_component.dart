import 'package:docdoc/settings/theming/styles.dart';
import 'package:flutter/material.dart';

class HaveAccountComponent extends StatelessWidget {
  final String text;
  final String textButton;
  final void Function() onPressed;

  const HaveAccountComponent({
    super.key,
    required this.text,
    required this.textButton,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: TextStyles.font13DarkBlueRegular,
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(
            textButton,
            style: TextStyles.font13BlueSemiBold,
          ),
        ),
      ],
    );
  }
}
