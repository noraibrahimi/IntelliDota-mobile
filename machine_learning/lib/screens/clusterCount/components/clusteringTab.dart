import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:machine_learning/models/clusterCount.dart';
import 'package:machine_learning/providers/appState.dart';
import 'package:machine_learning/utils/colors.dart';
import 'package:machine_learning/utils/strings.dart';
import 'package:provider/provider.dart';

class ClusteringTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ClusteringTabState();
  }
}

class _ClusteringTabState extends State<ClusteringTab> {
  List<charts.Series<ClusterCount, String>> _kaggleSeriesData = [];
  List<ClusterCount> kaggleColumns = [];
  List colors = [
    charts.Color.fromHex(code: '#19BDCD').darker,
    charts.Color.fromHex(code: '#EF476F').darker,
    charts.Color.fromHex(code: '#FFD166').darker,
    charts.Color.fromHex(code: '#06D6A0').darker,
    charts.Color.fromHex(code: '#FFFFFF').darker
  ];

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      Provider.of<AppState>(context).getClusterCount().then((value) {
        kaggleColumns = value;
        _generateData(kaggleColumns);
        setState(() {});
      });
    });
  }

  _generateData(data) {
    _kaggleSeriesData.add(
      charts.Series(
        id: 'test',
        domainFn: (ClusterCount clusterCount, _) =>
            clusterCount.prediction.toString(),
        measureFn: (ClusterCount clusterCount, _) => clusterCount.count,
        colorFn: (_, __) => charts.Color.transparent,
        fillColorFn: (ClusterCount clusterCount, __) =>
            colors[clusterCount.prediction],
        data: data,
      ),
    );
  }

  Widget _buildChart(BuildContext context) {
    return Center(
        child: charts.BarChart(
      _kaggleSeriesData,
      animate: true,
      animationDuration: Duration(milliseconds: 500),
      defaultRenderer: charts.BarRendererConfig(
          strokeWidthPx: ScreenUtil.getInstance().setHeight(10)),
      domainAxis: charts.OrdinalAxisSpec(
          renderSpec: charts.SmallTickRendererSpec(
              labelStyle: charts.TextStyleSpec(
                  fontSize: ScreenUtil.getInstance().setSp(24).toInt(),
                  fontFamily: AppStrings.fontLight,
                  color: charts.MaterialPalette.white),
              lineStyle: charts.LineStyleSpec(
                  color: charts.Color.fromHex(
                      code: AppColors.chartSecondaryColor)))),
      primaryMeasureAxis: charts.NumericAxisSpec(
          renderSpec: charts.GridlineRendererSpec(
              labelStyle: charts.TextStyleSpec(
                  fontSize: ScreenUtil.getInstance().setSp(24).toInt(),
                  fontFamily: AppStrings.fontLight,
                  color: charts.MaterialPalette.white),
              lineStyle: charts.LineStyleSpec(
                  color: charts.Color.fromHex(
                      code: AppColors.chartSecondaryColor)))),
    ));
  }

  Widget _buildBody(context) {
    return SafeArea(
      child: kaggleColumns.isEmpty
          ? Center(
              child: SpinKitRing(
                size: 80,
                color: Colors.white,
              ),
            )
          : Container(
              margin: EdgeInsets.symmetric(
                  vertical: ScreenUtil.getInstance().setHeight(100),
                  horizontal: ScreenUtil.getInstance().setHeight(20)),
              child: _buildChart(context),
            ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildBody(context);
  }
}
