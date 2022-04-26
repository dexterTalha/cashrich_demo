import 'package:cashrich_demo/controller/main_controller.dart';
import 'package:cashrich_demo/model/bitcoin_model.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class ShowChart extends StatelessWidget {
  const ShowChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<charts.Series<BitCoinModel, String>> series = [
      charts.Series(
        id: "developers",
        data: MainController.instance.models,
        domainFn: (BitCoinModel series, _) => series.symbol!,
        measureFn: (BitCoinModel series, _) => series.quote!.uSD!.price,
        colorFn: (BitCoinModel series, _) => charts.ColorUtil.fromDartColor(Colors.green),
      )
    ];
    return Container(
      child: Center(
        child: charts.BarChart(
          series,
          animate: true,
        ),
      ),
    );
  }
}
