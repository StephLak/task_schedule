import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_schedule/core/home/models/bottom_nav_model.dart';
import 'package:task_schedule/helpers/res/app_colors.dart';

class BottomNavRow extends StatelessWidget {
  const BottomNavRow({
    super.key,
    this.selectedIndex,
    this.isOnlyIcon = true,
    this.onTap,
  });

  final int? selectedIndex;
  final bool isOnlyIcon;
  final Function(int index)? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: BottomNavs.all.map(
        (nav) {
          return Expanded(
            child: nav.index != 3 && isOnlyIcon
                ? GestureDetector(
                    onTap: () => onTap!(nav.index),
                    child: nav.index == 5
                        ? Image.asset(
                            nav.icon!,
                            height: 25,
                          )
                        : SvgPicture.asset(
                            selectedIndex == nav.index && nav.activeIcon != null
                                ? nav.activeIcon!
                                : nav.icon!,
                            height: 25,
                          ),
                  )
                : nav.index == 3 && !isOnlyIcon
                    ? Container(
                        height: 56,
                        width: 56,
                        margin: const EdgeInsets.only(bottom: 25),
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.primaryColor,
                            boxShadow: [
                              BoxShadow(
                                  color: AppColors.buttonGreyColor,
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: Offset(0, 10))
                            ]),
                        child: const Icon(
                          Icons.add,
                          color: AppColors.whiteColor,
                          size: 40,
                        ),
                      )
                    : const SizedBox(),
          );
        },
      ).toList(),
    );
  }
}
