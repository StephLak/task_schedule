import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_schedule/constants/app_constants.dart';
import 'package:task_schedule/core/login/login_screen.dart';
import 'package:task_schedule/helpers/app_strings/app_string_keys.dart';
import 'package:task_schedule/helpers/res/app_colors.dart';

void main() {
  runApp(const ScheduleApp());
}

class ScheduleApp extends StatelessWidget {
  const ScheduleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      locale: AppConstants.englishLocale,
      translations: AppStringKeys(),
      fallbackLocale: AppConstants.englishLocale,
      title: 'Task Schedule App',
      debugShowCheckedModeBanner: false,
      theme: _buildTheme(Brightness.light),
      home: const LoginScreen(),
      builder: (context, child) {
        return MediaQuery(
          data:
              MediaQuery.of(context).copyWith(textScaler: TextScaler.noScaling),
          child: child!,
        );
      },
    );
  }
}

ThemeData _buildTheme(brightness) {
  var baseTheme = ThemeData(
    brightness: brightness,
    colorScheme: ColorScheme.fromSwatch(
      backgroundColor: AppColors.whiteColor,
    ),
    useMaterial3: true,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.whiteColor,
      iconTheme: IconThemeData(
        color: AppColors.primaryColor,
      ),
      titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.primaryColor),
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey),
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
    ),
  );

  return baseTheme.copyWith(
    textTheme: GoogleFonts.urbanistTextTheme(baseTheme.textTheme),
  );
}
