import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_schedule/helpers/app_strings/app_string_keys.dart';
import 'package:task_schedule/shared/home_screen_layout.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeScreenLayout(
      title: AppStringKeys.category.tr,
      child: const SizedBox(),
    );
  }
}
