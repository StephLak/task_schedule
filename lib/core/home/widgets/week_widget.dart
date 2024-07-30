import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:task_schedule/constants/app_constants.dart';
import 'package:task_schedule/core/home/controller/home_controller.dart';
import 'package:task_schedule/helpers/res/app_colors.dart';
import 'package:task_schedule/helpers/res/text_styles.dart';

class WeekWidget extends StatelessWidget {
  const WeekWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());
    return Container(
      height: 80,
      margin: const EdgeInsets.only(bottom: 10),
      child: Obx(
        () => ScrollablePositionedList.builder(
          scrollDirection: Axis.horizontal,
          initialScrollIndex: 19,
          itemScrollController: controller.itemScrollController,
          itemCount: controller.dates.value.length,
          itemBuilder: (context, index) {
            final DateTime date = controller.dates.value[index];
            final bool isCurrent =
                DateUtils.isSameDay(controller.selectedDate.value, date);
            return Center(
              child: GestureDetector(
                onTap: () => controller.selectedDate(date),
                child: Container(
                  height: 70,
                  width: 50,
                  margin: const EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(AppConstants.buttonRadius),
                    color: isCurrent
                        ? AppColors.primaryColor
                        : AppColors.whiteColor,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        DateFormat('EEE').format(date).toUpperCase(),
                        style: Styles.heading(
                            size: 12,
                            color: isCurrent
                                ? AppColors.whiteColor
                                : AppColors.secondaryColor),
                      ),
                      Text(
                        date.day.toString(),
                        style: Styles.heading(
                            size: 16,
                            color: isCurrent
                                ? AppColors.whiteColor
                                : AppColors.primaryColor),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
