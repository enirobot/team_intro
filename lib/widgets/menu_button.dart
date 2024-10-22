import 'package:flutter/material.dart';
import 'package:team_intro/constants.dart';


class MenuButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const MenuButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: AppConstants.buttonPadding,
        minimumSize: AppConstants.buttonMinSize,
      ),
      child: Text(text, style: AppConstants.buttonTextStyle),
    );
  }
}
