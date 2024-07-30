import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_schedule/constants/app_constants.dart';
import 'package:task_schedule/helpers/res/app_colors.dart';
import 'package:task_schedule/helpers/res/text_styles.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final double? width;
  final double? height;
  final double fontSize;
  final bool isOutline;
  final bool enabled;
  final double borderWidth;
  final double borderRadius;
  final FontWeight fontWeight;
  final bool loading;
  final IconData? icon;
  final Color? backgroundColor;
  final Color? textColor;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.fontSize = 16,
    this.width,
    this.height,
    this.isOutline = false,
    this.enabled = true,
    this.borderWidth = 1.5,
    this.borderRadius = AppConstants.buttonRadius,
    this.fontWeight = FontWeight.w700,
    this.loading = false,
    this.icon,
    this.backgroundColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: loading || !enabled ? () {} : onPressed,
      child: Container(
        height: height ?? 56,
        width: width ?? Get.size.width * 0.9,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          border: isOutline
              ? Border.all(color: AppColors.primaryColor, width: borderWidth)
              : const Border.symmetric(),
          color: backgroundColor ??
              (isOutline
                  ? AppColors.whiteColor
                  : !enabled
                      ? AppColors.buttonGreyColor
                      : AppColors.primaryColor),
        ),
        child: Center(
          child: loading
              ? Transform.scale(
                  scale: 0.5,
                  child: CircularProgressIndicator(
                    color: isOutline
                        ? AppColors.whiteColor
                        : AppColors.primaryColor,
                    strokeWidth: 4,
                  ),
                )
              : Text(
                  text,
                  style: Styles.heading(
                    size: fontSize,
                    fontWeight: fontWeight,
                    color: textColor ??
                        (isOutline
                            ? AppColors.primaryColor
                            : AppColors.whiteColor),
                  ),
                ),
        ),
      ),
    );
  }
}
