import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DoughuntChart extends StatefulWidget {
  const DoughuntChart({super.key});

  @override
  State<DoughuntChart> createState() => _DoughuntChartState();
}

class _DoughuntChartState extends State<DoughuntChart> {
  late List<_ChartData> data;
  late double totalValue;

  @override
  void initState() {
    data = [
      _ChartData('2', 25),
      _ChartData('2', 38),
      _ChartData('2', 34),
      _ChartData('2', 52)
    ];

    totalValue = data.map((item) => item.y).reduce((a, b) => a + b);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SfCircularChart(
      legend: Legend(
        isVisible: true,
        overflowMode: LegendItemOverflowMode.wrap,
        textStyle: theme.textTheme.labelMedium,
      ),
      margin: const EdgeInsets.all(0),
      series: <CircularSeries>[
        DoughnutSeries<_ChartData, dynamic>(
          dataSource: data,
          xValueMapper: (_ChartData data, _) => data.x,
          yValueMapper: (_ChartData data, _) => data.y,
          dataLabelSettings: DataLabelSettings(
            isVisible: true,
            textStyle: theme.textTheme.labelMedium,
          ),
        ),
      ],
    );
  }
}

class _ChartData {
  _ChartData(this.x, this.y);

  final String x;
  final double y;
}
