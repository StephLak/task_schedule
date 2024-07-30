import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_schedule/constants/app_images.dart';
import 'package:task_schedule/helpers/res/app_colors.dart';
import 'package:task_schedule/helpers/res/text_styles.dart';
import 'package:task_schedule/utils/view_utils.dart';

class HomeScreenLayout extends StatelessWidget {
  const HomeScreenLayout({
    super.key,
    required this.title,
    required this.child,
    this.isScrollable = true,
  });

  final String title;
  final Widget child;
  final bool isScrollable;

  Widget viewBody() {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 10, bottom: 10),
          child: Divider(
            color: AppColors.faintGreyColor,
          ),
        ),
        child,
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        surfaceTintColor: AppColors.backgroundColor,
        title: Text(
          title,
          style: Styles.heading(
            size: 16,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: queryWidth() * 0.05),
            child: Stack(
              children: [
                SvgPicture.asset(AppImages.notification),
                Positioned(
                  top: 6,
                  right: 4,
                  child: Container(
                    height: 12,
                    width: 12,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColors.whiteColor,
                        width: 1.5,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      drawer: const Drawer(),
      body: isScrollable
          ? SingleChildScrollView(
              child: viewBody(),
            )
          : viewBody(),
    );
  }
}
