import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_schedule/constants/app_images.dart';
import 'package:task_schedule/helpers/app_strings/app_string_keys.dart';

class Summary {
  final int index;
  final int count;
  final String text;
  final String icon;
  final List<Color> colors;

  const Summary({
    required this.index,
    required this.count,
    required this.text,
    required this.icon,
    required this.colors,
  });
}

class Summaries {
  static List<Summary> list = [
    Summary(
      index: 1,
      count: 10,
      text: AppStringKeys.projectProgress.tr,
      icon: AppImages.clock,
      colors: [const Color(0xFF3A9ADE), const Color(0xFF5EACE4)],
    ),
    Summary(
      index: 2,
      count: 24,
      text: AppStringKeys.projectCompleted.tr,
      icon: AppImages.verify,
      colors: [const Color(0xFF3F8B8D), const Color(0xFF58B2B4)],
    ),
    Summary(
      index: 3,
      count: 5,
      text: AppStringKeys.projectCancelled.tr,
      icon: AppImages.closeCircle,
      colors: [const Color(0xFFDD4A4A), const Color(0xFFE87777)],
    ),
  ];
}
