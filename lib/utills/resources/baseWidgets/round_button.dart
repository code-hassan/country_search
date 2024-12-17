import 'package:flutter/material.dart';
import 'package:untitled/utills/resources/baseWidgets/textWidget.dart';
import '../colors/app_colors.dart';

class RoundButton extends StatelessWidget {
  const RoundButton({
    super.key,
    this.loading = false,
    required this.title,
    this.height = 50,
    this.width = 60,
    required this.onPress,
    this.textColor = AppColor.whiteColor,
    required this.buttonColor,
    this.radius = 12,
    this.loaderColor = AppColor.whiteColor,
  });

  final bool loading;
  final String title;
  final double height, width, radius;
  final VoidCallback onPress;
  final Color textColor, buttonColor, loaderColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashFactory: NoSplash.splashFactory,
      onTap: onPress,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(radius),
        ),
        child: loading
            ? Center(
                child: CircularProgressIndicator(
                  color: loaderColor,
                ),
              )
            : Center(
                child: BaseText(
                text: title,
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: textColor,
              )),
      ),
    );
  }
}
