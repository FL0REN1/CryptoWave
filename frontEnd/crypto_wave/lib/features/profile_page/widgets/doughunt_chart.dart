import 'dart:async';

import 'package:crypto_wave/repositories/wallet_repository/models/models.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DoughuntChart extends StatefulWidget {
  const DoughuntChart({super.key, required this.wallet});
  final List<WalletRead> wallet;

  @override
  State<DoughuntChart> createState() => _DoughuntChartState();
}

class _DoughuntChartState extends State<DoughuntChart> {
  List<ChartData> chartData = [];
  late double totalValue;
  Timer? _timer;

  @override
  void initState() {
    chartData = widget.wallet.map((e) => ChartData(x: e.currencyName, y: e.currencyCount)).toList();

    updateChartData();

    super.initState();
  }

  void updateChartData() {
    _timer = Timer.periodic(const Duration(seconds: 10), (_) {
      setState(() {
        chartData = widget.wallet
            .map((e) => ChartData(
                  x: e.currencyName,
                  y: e.currencyCount,
                ))
            .toList();
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
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
        DoughnutSeries<ChartData, dynamic>(
          dataSource: chartData,
          xValueMapper: (ChartData data, _) => data.x,
          yValueMapper: (ChartData data, _) => data.y,
          dataLabelSettings: DataLabelSettings(
            isVisible: true,
            textStyle: theme.textTheme.labelMedium,
          ),
        ),
      ],
    );
  }
}

class ChartData {
  ChartData({required this.x, required this.y});

  final String x;
  final double y;
}
