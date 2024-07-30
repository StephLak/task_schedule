import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:task_schedule/constants/app_constants.dart';
import 'package:task_schedule/constants/app_images.dart';
import 'package:task_schedule/core/home/models/appointment_data_source.dart';
import 'package:task_schedule/helpers/app_strings/app_string_keys.dart';
import 'package:task_schedule/helpers/res/app_colors.dart';
import 'package:task_schedule/helpers/res/text_styles.dart';
import 'package:task_schedule/utils/view_utils.dart';

class ScheduleWidget extends StatefulWidget {
  const ScheduleWidget({super.key});

  @override
  State<ScheduleWidget> createState() => _ScheduleWidgetState();
}

class _ScheduleWidgetState extends State<ScheduleWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.whiteColor,
      padding: EdgeInsets.only(right: queryWidth() * 0.05),
      child: SfCalendar(
        view: CalendarView.day,
        headerHeight: 0,
        viewHeaderHeight: 0,
        cellBorderColor: AppColors.faintGreyColor,
        selectionDecoration: const BoxDecoration(color: Colors.transparent),
        todayHighlightColor: AppColors.primaryColor,
        dataSource: AppointmentDataSource(getAppointmentDataSource()),
        timeSlotViewSettings: const TimeSlotViewSettings(
          timeIntervalHeight: 80,
          timeFormat: 'hh:mm',
        ),
        appointmentBuilder:
            (BuildContext context, CalendarAppointmentDetails details) {
          final Appointment appointment = details.appointments.first;

          if (appointment.subject.isNotEmpty) {
            return Container(
              height: 80,
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  Container(
                    width: 10,
                    decoration: BoxDecoration(
                      color: appointment.color,
                      borderRadius: const BorderRadius.horizontal(
                        left: Radius.circular(
                          AppConstants.buttonRadius,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ClipRRect(
                      borderRadius: const BorderRadius.horizontal(
                        right: Radius.circular(
                          AppConstants.buttonRadius,
                        ),
                      ),
                      child: Container(
                        color: appointment.color.withOpacity(0.15),
                        padding: const EdgeInsets.only(left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(appointment.subject, style: Styles.body()),
                            SizedBox(
                              height: appointment.startTime
                                          .difference(appointment.endTime) >
                                      const Duration(minutes: 30)
                                  ? 10
                                  : 0,
                            ),
                            Row(
                              children: [
                                SvgPicture.asset(
                                  AppImages.clock,
                                  color: AppColors.secondaryColor,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                    '${AppStringKeys.time.tr}: ${DateFormat('hh:mm a').format(appointment.startTime)} - ${DateFormat('hh:mm a').format(appointment.endTime)}',
                                    style: Styles.lightBody(
                                        size: 12,
                                        color: AppColors.secondaryColor))
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
          return Container(
            height: 70,
            margin: EdgeInsets.only(right: queryWidth() * 0.05),
            padding: const EdgeInsets.only(left: 10),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: AppColors.faintGreyColor),
              ),
            ),
          );
        },
        monthViewSettings: const MonthViewSettings(
          appointmentDisplayMode: MonthAppointmentDisplayMode.appointment,
        ),
      ),
    );
  }
}
