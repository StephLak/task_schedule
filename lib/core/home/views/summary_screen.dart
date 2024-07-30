import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:task_schedule/constants/app_constants.dart';
import 'package:task_schedule/constants/app_images.dart';
import 'package:task_schedule/core/home/controller/home_controller.dart';
import 'package:task_schedule/core/home/models/chart_model.dart';
import 'package:task_schedule/core/home/models/summary_model.dart';
import 'package:task_schedule/helpers/app_strings/app_string_keys.dart';
import 'package:task_schedule/helpers/res/app_colors.dart';
import 'package:task_schedule/helpers/res/text_styles.dart';
import 'package:task_schedule/shared/common_button.dart';
import 'package:task_schedule/shared/custom_text_input.dart';
import 'package:task_schedule/shared/home_screen_layout.dart';
import 'package:task_schedule/utils/view_utils.dart';

class SummaryScreen extends StatelessWidget {
  const SummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());
    return HomeScreenLayout(
      title: AppStringKeys.projectSummary.tr,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: queryWidth() * 0.05),
            child: Column(
              children: [
                CustomInput(
                  controller: controller.searchController,
                  hint: AppStringKeys.search.trParams(AppConstants.extParam),
                  label:
                      AppStringKeys.search.trParams(AppConstants.extParamEmpty),
                  suffixIcon: SvgPicture.asset(
                    AppImages.searchNormal,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    children: Summaries.list
                        .map(
                          (summary) => Expanded(
                            child: Container(
                              height: 100,
                              padding: EdgeInsets.symmetric(
                                horizontal: queryWidth() * 0.03,
                                vertical: 15,
                              ),
                              margin: EdgeInsets.only(
                                right: summary.index == 1
                                    ? 10
                                    : summary.index == 2
                                        ? 5
                                        : 0,
                                left: summary.index == 2
                                    ? 5
                                    : summary.index == 3
                                        ? 10
                                        : 0,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(
                                  AppConstants.buttonRadius,
                                ),
                                gradient: LinearGradient(
                                  colors: summary.colors,
                                  begin: Alignment.topLeft,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: summary.colors[0].withOpacity(0.3),
                                    blurRadius: 5,
                                    offset: const Offset(0, 5),
                                  )
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        summary.count.toString(),
                                        style: Styles.heading(
                                          color: AppColors.whiteColor,
                                        ),
                                      ),
                                      SvgPicture.asset(
                                        summary.icon,
                                        height: 16,
                                      )
                                    ],
                                  ),
                                  Text(
                                    summary.text,
                                    style: Styles.lightBody(
                                      size: 12,
                                      color: AppColors.whiteColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: CustomButton(
                    text: AppStringKeys.viewAll.tr,
                    onPressed: () {},
                    isOutline: true,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: queryWidth(),
            color: AppColors.whiteColor,
            padding: EdgeInsets.symmetric(
                horizontal: queryWidth() * 0.05, vertical: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppStringKeys.productivity.tr,
                      style: Styles.heading(size: 18),
                    ),
                    const Icon(
                      CupertinoIcons.ellipsis,
                    )
                  ],
                ),
                SizedBox(
                  height: 240,
                  child: Obx(
                    () => SfCartesianChart(
                      isTransposed: true,
                      primaryXAxis: const CategoryAxis(),
                      primaryYAxis: const NumericAxis(
                        isVisible: false,
                      ),
                      tooltipBehavior: TooltipBehavior(
                        enable: true,
                        builder:
                            (data, point, series, pointIndex, seriesIndex) =>
                                Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 15),
                          child: RichText(
                            text: TextSpan(
                              text: BarChartData.list[pointIndex].y
                                  .toInt()
                                  .toString(),
                              style:
                                  Styles.heading(color: Colors.white, size: 16),
                              children: [
                                TextSpan(
                                  text: ' %',
                                  style: Styles.body(
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      series: <CartesianSeries>[
                        BarSeries<ChartData, String>(
                          dataSource: BarChartData.list,
                          xValueMapper: (ChartData data, _) => data.x,
                          yValueMapper: (ChartData data, _) => data.y,
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(AppConstants.buttonRadius),
                          ),
                          onPointTap: (pointInteractionDetails) => controller
                              .pointIndex
                              .value = pointInteractionDetails.pointIndex!,
                          initialSelectedDataIndexes: [
                            controller.pointIndex.value
                          ],
                          pointColorMapper: (ChartData data, int index) =>
                              controller.pointIndex.value == index
                                  ? AppColors.primaryColor
                                  : AppColors.barColor.withOpacity(0.12),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 100,
          )
        ],
      ),
    );
  }
}
