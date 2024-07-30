import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_schedule/core/home/widgets/date_picker_row.dart';
import 'package:task_schedule/core/home/widgets/schedule_widget.dart';
import 'package:task_schedule/core/home/widgets/task_widget.dart';
import 'package:task_schedule/core/home/widgets/week_widget.dart';
import 'package:task_schedule/helpers/app_strings/app_string_keys.dart';
import 'package:task_schedule/helpers/res/app_colors.dart';
import 'package:task_schedule/helpers/res/text_styles.dart';
import 'package:task_schedule/shared/home_screen_layout.dart';
import 'package:task_schedule/utils/view_utils.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeScreenLayout(
      isScrollable: false,
      title: AppStringKeys.calendar.tr,
      child: SizedBox(
        height: queryHeight() * 0.8,
        child: Column(
          children: [
            const DatePickerRow(),
            const WeekWidget(),
            Expanded(
              child: DefaultTabController(
                length: 2,
                child: Scaffold(
                  backgroundColor: AppColors.backgroundColor,
                  appBar: AppBar(
                    backgroundColor: AppColors.backgroundColor,
                    toolbarHeight: 0,
                    bottom: TabBar(
                      labelStyle: Styles.heading(size: 18),
                      unselectedLabelStyle: Styles.heading(
                          size: 18, color: AppColors.secondaryColor),
                      padding: EdgeInsets.zero,
                      indicatorPadding:
                          const EdgeInsets.symmetric(horizontal: 20),
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicatorColor: AppColors.primaryColor,
                      tabs: [
                        Tab(
                          text: AppStringKeys.schedule.tr,
                        ),
                        Tab(
                          text: AppStringKeys.task.tr,
                        ),
                      ],
                    ),
                  ),
                  body: const TabBarView(
                    children: [
                      ScheduleWidget(),
                      TaskWidget(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
