import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_schedule/core/home/controller/home_controller.dart';
import 'package:task_schedule/core/home/widgets/bottom_nav.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Obx(
              () => controller.pages[controller.selectedIndex.value - 1],
            ),
            const CustomNavBar(),
          ],
        ),
      ),
    );
  }
}
