import 'package:flutter/material.dart';
import 'package:flutter_skeleton/utils/palette.dart';

enum MainButtonType {
  primary(
    color: Palette.primary,
    textColor: Palette.white,
  ),
  secondary(
    color: Palette.secondary,
    textColor: Palette.white,
  ),
  error(
    color: Palette.error,
    textColor: Palette.white,
  );

  final Color color;
  final Color textColor;
  const MainButtonType({required this.color, required this.textColor});
}

class MainButton extends StatelessWidget {
  final String text;
  final double width;
  final double height;
  final MainButtonType type;
  final Function()? onPressed;
  const MainButton({
    super.key,
    required this.text,
    this.width = double.infinity,
    this.height = 60,
    this.type = MainButtonType.primary,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: FilledButton(
        onPressed: onPressed,
        style: FilledButton.styleFrom(
          backgroundColor: type.color,
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Text(
          text,
          style: Palette.title.copyWith(color: type.textColor),
        ),
      ),
    );
  }
}
