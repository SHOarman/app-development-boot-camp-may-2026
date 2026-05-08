import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final String? imagePath;
  final Color backgroundColor;
  final Color textColor;

  const CustomButton({
    super.key,
    required this.text,
    required this.onTap,
    this.imagePath,
    this.backgroundColor = const Color(0xFF154da1),
    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    final sw = MediaQuery.of(context).size.width;
    final sh = MediaQuery.of(context).size.height;

    final vPad = sh * 0.018;
    final iconSize = sw * 0.05;

    return Material(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            vertical: vPad,
            horizontal: sw * 0.044,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: TextStyle(color: textColor),
              ),
              if (imagePath != null) ...[
                SizedBox(width: sw * 0.022),
                SvgPicture.asset(
                  imagePath!,
                  height: iconSize,
                  width: iconSize,
                  colorFilter: ColorFilter.mode(textColor, BlendMode.srcIn),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}