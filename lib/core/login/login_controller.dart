import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_schedule/constants/app_constants.dart';
import 'package:task_schedule/constants/app_images.dart';
import 'package:task_schedule/core/home/views/main_screen.dart';
import 'package:task_schedule/core/login/login_model.dart';
import 'package:task_schedule/helpers/app_strings/app_string_keys.dart';
import 'package:task_schedule/utils/view_utils.dart';

class LoginController extends GetxController {
  RxBool obscure = true.obs;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxBool formValid = false.obs;

  void updateObscure() {
    obscure.value = !obscure.value;
  }

  void checkFormValid() {
    formValid.value =
        emailController.text.isEmpty || passwordController.text.isEmpty
            ? false
            : true;
  }

  login() {
    if (emailController.text.length < 2) {
      showSnackbarMessage(
          message: AppStringKeys.isValidField
              .trParams(AppConstants.emailInputHintParam)
              .capitalizeFirst!);
    } else if (passwordController.text.length < 2) {
      showSnackbarMessage(
          message: AppStringKeys.isValidField
              .trParams(AppConstants.passwordInputHintParam)
              .capitalizeFirst!);
    } else {
      Get.to(() => const MainScreen());
    }
  }

  List<SocialAuth> socialAuths = [
    SocialAuth(
      text: AppStringKeys.continueWith.trParams(AppConstants.googleParam),
      icon: AppImages.google,
      onPressed: () {},
    ),
    SocialAuth(
      text: AppStringKeys.continueWith.trParams(AppConstants.facebookParam),
      icon: AppImages.facebook,
      onPressed: () {},
    ),
    SocialAuth(
      text: AppStringKeys.continueWith.trParams(AppConstants.appleParam),
      icon: AppImages.apple,
      onPressed: () {},
    ),
  ];

  @override
  void onInit() {
    emailController.addListener(checkFormValid);
    passwordController.addListener(checkFormValid);

    super.onInit();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
