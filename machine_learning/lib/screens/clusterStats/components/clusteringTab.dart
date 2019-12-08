import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:machine_learning/models/groupType.dart';
import 'package:machine_learning/providers/appState.dart';
import 'package:machine_learning/utils/strings.dart';
import 'package:provider/provider.dart';

class ClusteringTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ClusteringTabState();
  }
}

class _ClusteringTabState extends State<ClusteringTab> {
  List<charts.Series<GroupType, String>> _kaggleSeriesData = [];
  List<List<GroupType>> kaggleColumns = [];
  List colors = [
    charts.Color.fromHex(code: '#19BDCD'),
    charts.Color.fromHex(code: '#EF476F'),
    charts.Color.fromHex(code: '#FFD166'),
    charts.Color.fromHex(code: '#06D6A0'),
    charts.Color.fromHex(code: '#FFFFFF')
  ];

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      Provider.of<AppState>(context).getClusterStats().then((value) {
        kaggleColumns = value;
        _generateData(kaggleColumns);
        setState(() {});
      });
    });
  }

  _generateData(list) {
    for (int i = 0; i < list.length; i++) {
      _kaggleSeriesData.add(
        charts.Series(
          id: '$i',
          domainFn: (GroupType groupType, _) => groupType.text,
          measureFn: (GroupType groupType, _) => groupType.value,
          seriesColor: colors[i],
          data: list[i],
        ),
      );
    }
  }

  Widget _buildChart(BuildContext context) {
    return Center(
        child: charts.BarChart(
      _kaggleSeriesData,
      animate: true,
      vertical: false,
      barGroupingType: charts.BarGroupingType.grouped,
      animationDuration: Duration(milliseconds: 500),
      domainAxis: charts.OrdinalAxisSpec(
          renderSpec: charts.SmallTickRendererSpec(
              labelStyle: charts.TextStyleSpec(
                  fontSize: ScreenUtil.getInstance().setSp(24).toInt(),
                  fontFamily: AppStrings.fontLight,
                  color: charts.MaterialPalette.white),
              lineStyle:
                  charts.LineStyleSpec(color: charts.MaterialPalette.white))),
      primaryMeasureAxis: charts.NumericAxisSpec(
          renderSpec: charts.GridlineRendererSpec(
              labelStyle: charts.TextStyleSpec(
                  fontSize: ScreenUtil.getInstance().setSp(24).toInt(),
                  fontFamily: AppStrings.fontLight,
                  color: charts.MaterialPalette.white),
              lineStyle:
                  charts.LineStyleSpec(color: charts.MaterialPalette.white))),
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
