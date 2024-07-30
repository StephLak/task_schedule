import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:task_schedule/core/home/controller/home_controller.dart';
import 'package:task_schedule/core/home/widgets/icon_container.dart';
import 'package:task_schedule/helpers/res/app_colors.dart';
import 'package:task_schedule/helpers/res/text_styles.dart';
import 'package:task_schedule/utils/view_utils.dart';

class DatePickerRow extends StatelessWidget {
  const DatePickerRow({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());
    return Padding(
      padding: EdgeInsets.only(
          bottom: 20.0, right: queryWidth() * 0.05, left: queryWidth() * 0.05),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: controller.showDateBottomSheet,
            child: Row(
              children: [
                Obx(
                  () => Text(
                    DateFormat('MMMM yyyy')
                        .format(controller.selectedDate.value),
                    style: Styles.heading(size: 18),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 5),
                  child: Icon(
                    CupertinoIcons.chevron_down,
                    size: 16,
                    color: AppColors.primaryColor,
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              IconContainer(
                icon: CupertinoIcons.chevron_back,
                onTap: () => controller.updateDate(false),
              ),
              const SizedBox(
                width: 10,
              ),
              IconContainer(
                icon: CupertinoIcons.chevron_forward,
                onTap: () => controller.updateDate(true),
              ),
            ],
          )
        ],
      ),
    );
  }
}
