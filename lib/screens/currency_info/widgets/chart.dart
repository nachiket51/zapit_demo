import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class ChartWidget extends StatelessWidget {
  final List<double> pricesData;

  const ChartWidget({Key? key, required this.pricesData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SfSparkLineChart(
      data: pricesData,
      axisLineColor: Colors.red,
    );
  }
}
