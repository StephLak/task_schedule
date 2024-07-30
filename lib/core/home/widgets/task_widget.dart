import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:task_schedule/constants/app_constants.dart';
import 'package:task_schedule/core/home/controller/home_controller.dart';
import 'package:task_schedule/helpers/app_strings/app_string_keys.dart';
import 'package:task_schedule/helpers/res/app_colors.dart';
import 'package:task_schedule/helpers/res/text_styles.dart';
import 'package:task_schedule/utils/view_utils.dart';

class TaskWidget extends StatelessWidget {
  const TaskWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());
    return Container(
      color: AppColors.whiteColor,
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        children: controller.taskList
            .map(
              (task) => Container(
                height: 75,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                margin: EdgeInsets.symmetric(
                    horizontal: queryWidth() * 0.05, vertical: 10),
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius:
                      BorderRadius.circular(AppConstants.buttonRadius),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(4, 8),
                      blurRadius: 24,
                      color: Colors.black.withOpacity(0.08),
                    )
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          task.title,
                          style: Styles.lightBody(
                            size: 16,
                            color: AppColors.primaryColor,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          '${AppStringKeys.dueDate.tr}: ${DateFormat('EEE, MMM d yyyy').format(task.dueDate)}',
                          style: Styles.lightBody(
                            size: 12,
                            fontWeight: FontWeight.w400,
                            color: AppColors.faintTextColor,
                          ),
                        )
                      ],
                    ),
                    Obx(
                      () => Transform.scale(
                        scale: 1.3,
                        child: Checkbox(
                          value: controller.selectedTasks.contains(task.id),
                          side: const BorderSide(
                            width: 1,
                            color: AppColors.secondaryColor,
                          ),
                          checkColor: AppColors.whiteColor,
                          shape: BeveledRectangleBorder(
                              borderRadius: BorderRadius.circular(2)),
                          activeColor: const Color(0xFF5ECEB3),
                          onChanged: (value) =>
                              controller.onChanged(value!, task.id),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
