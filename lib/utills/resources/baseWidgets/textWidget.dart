import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../colors/app_colors.dart';

class BaseText extends StatelessWidget {
  const BaseText(
      {super.key,
        required this.text,
        required this.color,
        required this.fontWeight,
        required this.fontSize,
        this.textAlign,

        this.textDecoration, this.maxLines,
        //this.themeController,
      });

  final String text;
  final Color? color;
  final FontWeight fontWeight;
  final double fontSize;
  final TextAlign? textAlign;
  final TextDecoration? textDecoration;
  final int? maxLines;
 // final ThemeController? themeController;

  @override
  Widget build(BuildContext context) {
    return Text(
        text.tr,
        textAlign: textAlign,
        overflow: TextOverflow.ellipsis,
        maxLines: maxLines,
        style: TextStyle(
            color: color,
            fontWeight: fontWeight,
            fontSize: fontSize,
            decoration: textDecoration,
            decorationThickness: 1.5,
            decorationColor: AppColor.blackColor,
        ),
      );
  }
}