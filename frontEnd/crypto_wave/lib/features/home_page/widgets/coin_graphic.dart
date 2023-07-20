import 'dart:async';

import 'package:crypto_wave/repositories/coins_repository/models/models.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

class CoinGraphic extends StatefulWidget {
  const CoinGraphic({super.key, required this.coin});
  final Coins coin;

  @override
  State<CoinGraphic> createState() => _CoinGraphicState();
}

class _CoinGraphicState extends State<CoinGraphic> {
  List<ChartData> chartData = [];
  late ZoomPanBehavior _zoomPanBehavior;
  Timer? _timer;

  @override
  void initState() {
    _zoomPanBehavior = ZoomPanBehavior(
      enablePinching: true,
      zoomMode: ZoomMode.x,
      enablePanning: true,
    );

    chartData = widget.coin.trade
        .map((e) => ChartData(
              time: DateTime.fromMillisecondsSinceEpoch(e.time),
              open: e.open,
              high: e.high,
              low: e.low,
              close: e.close,
            ))
        .toList();

    updateChartData();
    super.initState();
  }

  void updateChartData() {
    _timer = Timer.periodic(const Duration(seconds: 10), (_) {
      setState(() {
        chartData = widget.coin.trade
            .map((e) => ChartData(
                  time: DateTime.fromMillisecondsSinceEpoch(e.time),
                  open: e.open,
                  high: e.high,
                  low: e.low,
                  close: e.close,
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
    return SfCartesianChart(
      zoomPanBehavior: _zoomPanBehavior,
      series: <ChartSeries>[
        CandleSeries<ChartData, DateTime>(
          dataSource: chartData,
          xValueMapper: (ChartData data, _) => data.time,
          lowValueMapper: (ChartData data, _) => data.low,
          highValueMapper: (ChartData data, _) => data.high,
          openValueMapper: (ChartData data, _) => data.open,
          closeValueMapper: (ChartData data, _) => data.close,
        ),
      ],
      primaryXAxis: DateTimeAxis(
          dateFormat: DateFormat('mm:ss'),
          interval: 25,
          majorGridLines: const MajorGridLines(width: 0)),
      primaryYAxis: NumericAxis(
        numberFormat: NumberFormat.simpleCurrency(decimalDigits: 0),
      ),
    );
  }
}

class ChartData {
  ChartData(
      {required this.time,
      required this.open,
      required this.high,
      required this.low,
      required this.close});
  final DateTime time;
  final num? open;
  final num? high;
  final num? low;
  final num? close;
}
