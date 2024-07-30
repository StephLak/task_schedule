import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_schedule/constants/app_constants.dart';

double queryHeight() {
  return Get.size.height;
}

double queryWidth() {
  return Get.size.width;
}

void showSnackbarMessage({
  required String message,
  bool isSuccess = false,
  int seconds = 2,
  bool isBottom = true,
}) {
  final snackbar = GetSnackBar(
    message: message,
    backgroundColor:
        isSuccess ? Colors.green.withOpacity(0.9) : Colors.red.withOpacity(0.9),
    duration: Duration(seconds: seconds),
    margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
    padding: const EdgeInsets.fromLTRB(30, 16, 30, 16),
    borderRadius: AppConstants.buttonRadius,
    snackPosition: isBottom ? SnackPosition.BOTTOM : SnackPosition.TOP,
  );

  Get.showSnackbar(snackbar);
}
