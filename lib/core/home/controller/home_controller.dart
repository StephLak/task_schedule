import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:task_schedule/core/home/models/task_model.dart';
import 'package:task_schedule/core/home/views/calendar_screen.dart';
import 'package:task_schedule/core/home/views/category_screen.dart';
import 'package:task_schedule/core/home/views/profile_screen.dart';
import 'package:task_schedule/core/home/views/summary_screen.dart';
import 'package:task_schedule/helpers/app_strings/app_string_keys.dart';
import 'package:task_schedule/helpers/res/app_colors.dart';
import 'package:task_schedule/helpers/res/text_styles.dart';
import 'package:task_schedule/shared/common_button.dart';
import 'package:task_schedule/utils/view_utils.dart';

class HomeController extends GetxController {
  TextEditingController searchController = TextEditingController();
  RxInt selectedIndex = 2.obs;
  RxInt pointIndex = 3.obs;
  RxList<int> selectedTasks = RxList<int>();
  Rx<DateTime> selectedDate = Rx<DateTime>(DateTime.now());
  RxList<DateTime> dates = RxList<DateTime>([]);
  final ItemScrollController itemScrollController = ItemScrollController();

  void onChanged(bool isTrue, int index) {
    if (isTrue && !selectedTasks.contains(index)) {
      selectedTasks.add(index);
    } else {
      if (selectedTasks.contains(index)) {
        selectedTasks.remove(index);
      }
    }
  }

  updateDate(bool isNext) {
    if (isNext) {
      selectedDate.value = selectedDate.value.add(const Duration(days: 1));
    } else {
      selectedDate.value = selectedDate.value.subtract(const Duration(days: 1));
    }
    getDates();
  }

  selectDate(DateTime date) {
    selectedDate.value = date;
    getDates();
  }

  getDates() {
    dates.value = List<DateTime>.generate(
      60,
      (i) => DateTime.utc(
        selectedDate.value.year,
        selectedDate.value.month,
        selectedDate.value.day - 20,
      ).add(
        Duration(days: i),
      ),
    );
  }

  showDateBottomSheet() {
    TextStyle textStyle = Styles.heading(size: 16, fontWeight: FontWeight.w600);
    Get.bottomSheet(
      Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: queryWidth() * 0.1,
              vertical: 20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(),
                Text(
                  AppStringKeys.chooseDate.tr,
                  style: Styles.heading(size: 16),
                ),
                GestureDetector(
                  onTap: Get.back,
                  child: const Icon(
                    Icons.clear,
                    size: 24,
                    color: AppColors.primaryColor,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 280,
            padding: EdgeInsets.symmetric(horizontal: queryWidth() * 0.05),
            decoration: const BoxDecoration(
              border: Border.symmetric(
                horizontal: BorderSide(color: AppColors.faintGreyColor),
              ),
            ),
            child: CalendarDatePicker2(
              config: CalendarDatePicker2Config(
                calendarType: CalendarDatePicker2Type.single,
                selectedDayHighlightColor: AppColors.primaryColor,
                calendarViewMode: CalendarDatePicker2Mode.day,
                dayTextStyle: textStyle,
                selectedDayTextStyle:
                    textStyle.copyWith(color: AppColors.whiteColor),
                weekdayLabelTextStyle: textStyle,
              ),
              value: [selectedDate.value],
              onValueChanged: (dates) {
                selectedDate.value = dates.single;
                getDates();
                itemScrollController.scrollTo(
                  index: 19,
                  duration: const Duration(milliseconds: 1000),
                  curve: Curves.easeInOutCubic,
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: CustomButton(
              text: AppStringKeys.continueText.tr,
              onPressed: Get.back,
              width: queryWidth() * 0.8,
            ),
          ),
        ],
      ),
      backgroundColor: AppColors.whiteColor,
    );
  }

  List<Task> taskList = [
    Task(id: 1, title: AppStringKeys.taskTitle1.tr, dueDate: DateTime.now()),
    Task(id: 2, title: AppStringKeys.taskTitle2.tr, dueDate: DateTime.now()),
    Task(id: 3, title: AppStringKeys.taskTitle3.tr, dueDate: DateTime.now()),
    Task(id: 4, title: AppStringKeys.taskTitle4.tr, dueDate: DateTime.now()),
  ];

  updateIndex(int index) {
    selectedIndex.value = index;
  }

  RxList<Widget> pages = [
    const CategoryScreen(),
    const SummaryScreen(),
    const Scaffold(),
    const CalendarScreen(),
    const ProfileScreen(),
  ].obs;

  @override
  void onInit() {
    getDates();
    super.onInit();
  }
}
