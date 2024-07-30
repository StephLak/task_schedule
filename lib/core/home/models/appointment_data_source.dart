import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:task_schedule/helpers/app_strings/app_string_keys.dart';

class AppointmentDataSource extends CalendarDataSource {
  AppointmentDataSource(List<Appointment> source) {
    appointments = source;
  }
}

DateTime getHour(int hour, {int minute = 0}) {
  final DateTime today = DateTime.now();
  return DateTime(today.year, today.month, today.day, hour, minute, 0);
}

List<Appointment> getAppointmentDataSource() {
  final List<Appointment> appointments = <Appointment>[
    Appointment(
      subject: AppStringKeys.sprintReview.tr,
      startTime: getHour(9),
      endTime: getHour(10),
      color: const Color(0xFFD08CDF),
      isAllDay: false,
    ),
    Appointment(
      subject: AppStringKeys.clientMeeting.tr,
      startTime: getHour(11),
      endTime: getHour(12),
      color: const Color(0xFFFD7722),
      isAllDay: false,
    ),
    Appointment(
      subject: AppStringKeys.dailyStandup.tr,
      startTime: getHour(12),
      endTime: getHour(12, minute: 30),
      color: const Color(0xFF5ECEB3),
      isAllDay: false,
    ),
  ];
  return appointments;
}
