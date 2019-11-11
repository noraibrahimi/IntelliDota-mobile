import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:machine_learning/models/groupAndCount.dart';
import 'package:machine_learning/providers/appState.dart';
import 'package:machine_learning/utils/colors.dart';
import 'package:machine_learning/utils/strings.dart';
import 'package:provider/provider.dart';

import 'customCircleSymbolRenderer.dart';

class ClusteringTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ClusteringTabState();
  }
}

class _ClusteringTabState extends State<ClusteringTab> {
  double rating = 0;
  int _currentButton = -1;
  bool _loading = false;
  String textSelected = "";
  List<String> text = [];
  List<String> upperLowerBounds = [];

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      Provider.of<AppState>(context).kaggleSeriesData = [];
      setState(() {});
    });
  }

  CustomCircleSymbolRenderer render = new CustomCircleSymbolRenderer();

  _generateData(myData) {
    Provider.of<AppState>(context).kaggleSeriesData.add(charts.Series(
          id: 'tets',
          domainFn: (GroupAndCount groupAndCount, _) => groupAndCount.bucket,
          measureFn: (GroupAndCount groupAndCount, _) => groupAndCount.count,
          seriesColor: charts.Color.white,
          data: myData,
        ));
  }

  Widget _buildChart(BuildContext context) {
    _generateData(Provider.of<AppState>(context).kaggleGroupAndCount);
    return Container(
        margin: EdgeInsets.symmetric(
            vertical: ScreenUtil.getInstance().setHeight(70),
            horizontal: ScreenUtil.getInstance().setHeight(50)),
        child: Center(
          child: charts.LineChart(
            Provider.of<AppState>(context).kaggleSeriesData,
            animate: true,
            animationDuration: Duration(milliseconds: 500),
            behaviors: [charts.LinePointHighlighter(symbolRenderer: render)],
            selectionModels: [
              charts.SelectionModelConfig(
                  changedListener: (charts.SelectionModel model) {
                if (model.hasDatumSelection) {
                  setState(() {
                    print(model.selectedDatum[0].index);
                    render.text = upperLowerBounds[model.selectedDatum[0].index];
                  });
                }
              })
            ],
            domainAxis: new charts.NumericAxisSpec(
                renderSpec: charts.GridlineRendererSpec(
                    labelStyle: new charts.TextStyleSpec(
                        color: charts.Color.fromHex(
                            code: AppColors.chartSecondaryColor)),
                    lineStyle: charts.LineStyleSpec(
                      color: charts.Color.fromHex(
                          code: AppColors.chartSecondaryColor),
                    ))),
            primaryMeasureAxis: charts.NumericAxisSpec(
                renderSpec: charts.GridlineRendererSpec(
                    labelStyle: new charts.TextStyleSpec(
                        color: charts.Color.fromHex(
                            code: AppColors.chartSecondaryColor)),
                    lineStyle: charts.LineStyleSpec(
                        color: charts.Color.fromHex(
                            code: AppColors.chartSecondaryColor)))),
          ),
        ));
  }

  Widget _buildBody(context) {
    return SafeArea(
      child: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(
                horizontal: ScreenUtil.getInstance().setHeight(20)),
            child: Column(
              children: <Widget>[
                Expanded(child: _buildChart(context)),
                Divider(
                  color: Color(0xff57616f),
                ),
                Expanded(
                  child: Container(
                    constraints: BoxConstraints(
                        maxHeight: ScreenUtil.getInstance().setHeight(1000)),
                    margin: EdgeInsets.symmetric(
                        horizontal: ScreenUtil.getInstance().setHeight(50),
                        vertical: ScreenUtil.getInstance().setHeight(20)),
                    child: GridView.builder(
                        primary: false,
                        scrollDirection: Axis.vertical,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          childAspectRatio:
                              ScreenUtil.getInstance().setWidth(650) /
                                  (MediaQuery.of(context).size.height / 4),
                        ),
                        itemCount: Provider.of<AppState>(context)
                            .kaggleColumnNames
                            .length,
                        itemBuilder: (context, index) {
                          return GridTile(
                            child: listItem(
                                index: index,
                                title:
                                    "${Provider.of<AppState>(context).kaggleColumnNames[index]}",
                                color: AppColors()
                                    .makeColor(
                                        index,
                                        Provider.of<AppState>(context)
                                            .kaggleColumnNames
                                            .length
                                            .toDouble(),
                                        0.5,
                                        0.5)
                                    .toColor()
                                    .withOpacity(0.3),
                                isSelected: false),
                          );
                        }),
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.5),
            child: _loading
                ? Center(
                    child: SpinKitRing(
                      size: 80,
                      color: Colors.white,
                    ),
                  )
                : SizedBox(),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildBody(context);
  }

  Widget listItem({index, title, color, isSelected}) {
    return GestureDetector(
      onTap: () async {
        setState(() {
          _loading = true;
          upperLowerBounds =[];
        });
        _currentButton = index;
        Provider.of<AppState>(context)
            .getGroupAndCount(
                type: tableType.kaggle,
                attribute: Provider.of<AppState>(context)
                    .kaggleColumnNames[_currentButton])
            .then((_) {
          if (_currentButton != -1)
            Provider.of<AppState>(context).kaggleSeriesData = [];

          setState(() {
            Provider.of<AppState>(context).kaggleGroupAndCount.forEach((item) {
              upperLowerBounds.add('U: ${item.upperBound.toInt()}\nL: ${item.lowerBound.toInt()}');
            });
            _loading = false;
          });
        });
        setState(() {});
      },
      child: Container(
        width: double.infinity,
        height: ScreenUtil.getInstance().setHeight(100),
        margin: EdgeInsets.all(
          ScreenUtil.getInstance().setHeight(30),
        ),
        padding: EdgeInsets.only(
          top: title.toString().split('_').length > 1
              ? ScreenUtil.getInstance().setHeight(55)
              : ScreenUtil.getInstance().setHeight(80),
        ),
        child: Column(
          children: <Widget>[
            Text(
              "${title.toString().split('_').first.toUpperCase()}",
              maxLines: 2,
              style: TextStyle(
                  color: _currentButton == index
                      ? AppColors.defaultColor
                      : Colors.white,
                  fontFamily: AppStrings.fontBold,
                  fontSize: ScreenUtil.getInstance().setSp(38)),
            ),
            Text(
              "${title.toString().split('_').length > 1 ? title.toString().split('_').removeAt(1) : ""} ${title.toString().split('_').length > 2 ? title.toString().split('_').removeAt(2) : ""}",
              maxLines: 2,
              style: TextStyle(
                  color: Color(0xff57616f),
                  fontFamily: AppStrings.fontMedium,
                  fontSize: ScreenUtil.getInstance().setSp(36)),
            ),
          ],
        ),
        decoration: BoxDecoration(
          color: _currentButton == index ? Colors.white : null,
          borderRadius:
              BorderRadius.circular(ScreenUtil.getInstance().setHeight(12)),
          border: Border.all(
            color: Colors.grey.withOpacity(0.3),
          ),
        ),
      ),
    );
  }
}
