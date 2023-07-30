import 'package:crypto_wave/repositories/coins_repository/models/models.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';
import 'dart:async';

class CoinGraphicRichest extends StatefulWidget {
  const CoinGraphicRichest({Key? key, required this.coin}) : super(key: key);
  final Coins? coin;

  @override
  State<CoinGraphicRichest> createState() => _CoinGraphicRichestState();
}

class _CoinGraphicRichestState extends State<CoinGraphicRichest> {
  List<ChartData> chartData = [];
  late ZoomPanBehavior _zoomPanBehavior;
  late CrosshairBehavior _crosshairBehavior;
  Timer? _timer;

  @override
  void initState() {
    _zoomPanBehavior = ZoomPanBehavior(
      enablePinching: true,
      zoomMode: ZoomMode.x,
      enablePanning: true,
    );

    _crosshairBehavior = CrosshairBehavior(
      enable: true,
      activationMode: ActivationMode.singleTap,
      shouldAlwaysShow: true,
    );

    chartData = widget.coin!.trade
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
        chartData = widget.coin!.trade
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
    final theme = Theme.of(context);
    return SfCartesianChart(
      zoomPanBehavior: _zoomPanBehavior,
      crosshairBehavior: _crosshairBehavior,
      onSelectionChanged: (args) {
        // Обработка выбранных данных при активации кроссхеера
      },
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
        majorGridLines: const MajorGridLines(width: 0),
      ),
      primaryYAxis: NumericAxis(
        numberFormat: NumberFormat.simpleCurrency(decimalDigits: 0),
      ),
      tooltipBehavior: TooltipBehavior(
        enable: true,
        header: '',
        format:
            'open: point.open\nhigh: point.high\nlow: point.low\nclose: point.close',
      ),
      title: ChartTitle(
        text: (widget.coin != null)
            ? '${widget.coin!.details.priceInUSD}'
            : 'N/A',
        textStyle: theme.textTheme.bodyMedium,
      ),
      legend: const Legend(isVisible: false),
    );
  }
}

class ChartData {
  ChartData({
    required this.time,
    required this.open,
    required this.high,
    required this.low,
    required this.close,
  });
  final DateTime time;
  final num? open;
  final num? high;
  final num? low;
  final num? close;
}
