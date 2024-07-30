import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:task_schedule/constants/app_constants.dart';
import 'package:task_schedule/constants/app_images.dart';
import 'package:task_schedule/core/login/login_controller.dart';
import 'package:task_schedule/helpers/app_strings/app_string_keys.dart';
import 'package:task_schedule/helpers/res/app_colors.dart';
import 'package:task_schedule/helpers/res/text_styles.dart';
import 'package:task_schedule/shared/common_button.dart';
import 'package:task_schedule/shared/custom_text_input.dart';
import 'package:task_schedule/utils/view_utils.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController controller = Get.put(LoginController());
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: queryHeight(),
          width: queryWidth(),
          padding: EdgeInsets.symmetric(
            horizontal: queryWidth() * 0.05,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text(
                  AppStringKeys.login.tr,
                  style: Styles.heading(),
                ),
                Text(
                  AppStringKeys.signInText.tr,
                  style: Styles.lightBody(),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: CustomInput(
                    controller: controller.emailController,
                    hint: AppStringKeys.enterHere
                        .trParams(AppConstants.emailInputHintParam),
                    label: AppStringKeys.usernameEmail.tr,
                  ),
                ),
                Obx(
                  () => CustomInput(
                    controller: controller.passwordController,
                    hint: AppStringKeys.enterHere
                        .trParams(AppConstants.passwordInputHintParam),
                    label: AppStringKeys.password.tr,
                    obscure: controller.obscure.value,
                    suffixIcon: GestureDetector(
                      onTap: controller.updateObscure,
                      child: SvgPicture.asset(
                        controller.obscure.value
                            ? AppImages.eyeSlash
                            : AppImages.eye,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    AppStringKeys.forgotPassword.tr,
                    style: Styles.body(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: Obx(
                    () => CustomButton(
                      text: AppStringKeys.login.tr,
                      onPressed: controller.login,
                      enabled: controller.formValid.value,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    AppStringKeys.orLoginWith.tr,
                    style: Styles.lightBody(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Column(
                    children: controller.socialAuths
                        .map(
                          (auth) => Container(
                            height: 56,
                            width: queryWidth(),
                            padding: EdgeInsets.symmetric(
                                horizontal: queryWidth() * 0.05),
                            margin: const EdgeInsets.only(top: 20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  AppConstants.buttonRadius),
                              border: Border.all(
                                color: AppColors.faintGreyColor,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SvgPicture.asset(auth.icon),
                                Text(
                                  auth.text,
                                  style: Styles.heading(size: 16),
                                ),
                                const SizedBox(
                                  width: 40,
                                ),
                              ],
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 50.0,
                    bottom: 40,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppStringKeys.dontHave.tr,
                        style: Styles.lightBody(),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        AppStringKeys.registerHere.tr,
                        style: Styles.body(),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
