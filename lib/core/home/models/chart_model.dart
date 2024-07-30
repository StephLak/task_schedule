class ChartData {
  ChartData(this.x, this.y);

  final String x;
  final double y;
}

class BarChartData {
  static List<ChartData> list = [
    ChartData('Jan', 58),
    ChartData('Feb', 80),
    ChartData('Mar', 40),
    ChartData('Apr', 56),
    ChartData('May', 70),
    ChartData('Jun', 74),
  ];
}
