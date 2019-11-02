import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class SimpleTimeSeriesChart extends StatelessWidget {
  const SimpleTimeSeriesChart(this.seriesList);

  /// Creates a [TimeSeriesChart] with sample data and no transition.
  factory SimpleTimeSeriesChart.withSampleData() {
    return SimpleTimeSeriesChart(
      _createSampleData(),
    );
  }

  final List<charts.Series<TimeSeriesSales, DateTime>> seriesList;

  @override
  Widget build(BuildContext context) => charts.TimeSeriesChart(
    seriesList,
    animate: false,
    dateTimeFactory: const charts.LocalDateTimeFactory(),
    domainAxis: charts.DateTimeAxisSpec(
      tickFormatterSpec: charts.AutoDateTimeTickFormatterSpec(
        day: charts.TimeFormatterSpec(
          format: 'EEE',
          transitionFormat: 'EEE',
        ),
      ),
    ),
  );

  /// Create one series with sample hard coded data.
  static List<charts.Series<TimeSeriesSales, DateTime>> _createSampleData() {
    final List<TimeSeriesSales> data = <TimeSeriesSales>[
      TimeSeriesSales(DateTime(2019, 1, 7), 5),
      TimeSeriesSales(DateTime(2019, 1, 8), 25),
      TimeSeriesSales(DateTime(2019, 1, 9), 100),
      TimeSeriesSales(DateTime(2019, 1, 10), 75),
    ];

    return <charts.Series<TimeSeriesSales, DateTime>>[
      charts.Series<TimeSeriesSales, DateTime>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (TimeSeriesSales sales, _) => sales.time,
        measureFn: (TimeSeriesSales sales, _) => sales.sales,
        data: data,
      )
    ];
  }
}

class TimeSeriesSales {
  TimeSeriesSales(this.time, this.sales);

  final DateTime time;
  final int sales;
}