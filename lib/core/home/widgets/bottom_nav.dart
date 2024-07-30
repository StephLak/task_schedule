import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_schedule/core/home/controller/home_controller.dart';
import 'package:task_schedule/helpers/res/app_colors.dart';
import 'package:task_schedule/core/home/widgets/bottom_nav_row.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());
    return Align(
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        height: 100,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 60,
                decoration: const BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.faintGreyColor,
                      spreadRadius: 2,
                      blurRadius: 8,
                    ),
                  ],
                ),
                child: Obx(
                  () => BottomNavRow(
                    selectedIndex: controller.selectedIndex.value,
                    onTap: controller.updateIndex,
                  ),
                ),
              ),
            ),
            const Align(
              alignment: Alignment.bottomCenter,
              child: BottomNavRow(
                isOnlyIcon: false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
