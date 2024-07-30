import 'package:flutter/material.dart';
import 'package:task_schedule/constants/app_constants.dart';
import 'package:task_schedule/helpers/res/app_colors.dart';

class IconContainer extends StatelessWidget {
  const IconContainer({
    super.key,
    required this.icon,
    required this.onTap,
  });

  final IconData icon;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 32,
        width: 32,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.faintGreyColor),
          borderRadius: BorderRadius.circular(
            AppConstants.buttonRadius,
          ),
        ),
        child: Center(
          child: Icon(
            icon,
            size: 16,
            color: AppColors.primaryColor,
          ),
        ),
      ),
    );
  }
}
