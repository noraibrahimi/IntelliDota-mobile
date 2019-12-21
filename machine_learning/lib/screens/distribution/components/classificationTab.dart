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

class ClassificationTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ClassificationTabState();
  }
}

class _ClassificationTabState extends State<ClassificationTab> {
  double rating = 5.0;
  int _currentButton = -1;
  bool _loading = false;
  bool sliderValueChanged = false;

  List<String> upperLowerBounds = [];
  CustomCircleSymbolRenderer render = new CustomCircleSymbolRenderer();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      Provider.of<AppState>(context).steamSeriesData = [];
      Provider.of<AppState>(context).steamGroupAndCount = [];
      setState(() {});
    });
  }

  _generateData(myData) {
    Provider.of<AppState>(context).steamSeriesData.add(charts.Series(
        domainFn: (GroupAndCount groupAndCount, _) => groupAndCount.bucket,
        measureFn: (GroupAndCount groupAndCount, _) => groupAndCount.count,
        data: myData,
        seriesColor: charts.Color.white,
        id: "GroupAndCount"));
  }

  Widget _buildChart(BuildContext context) {
    _generateData(Provider.of<AppState>(context).steamGroupAndCount);
    return Container(
      margin: EdgeInsets.symmetric(
          vertical: ScreenUtil.getInstance().setHeight(70)),
      child: Center(
        child: charts.LineChart(
          Provider.of<AppState>(context).steamSeriesData,
          animate: true,
          animationDuration: Duration(milliseconds: 500),
          behaviors: [charts.LinePointHighlighter(symbolRenderer: render)],
          selectionModels: [
            charts.SelectionModelConfig(
                changedListener: (charts.SelectionModel model) {
              if (model.hasDatumSelection) {
                setState(() {
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
      ),
    );
  }

  Widget _buildBody(context) {
    return SafeArea(
      child: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(
                horizontal: ScreenUtil.getInstance().setHeight(70)),
            child: Column(
              children: <Widget>[
                Expanded(child: _buildChart(context)),
                Slider(
                  min: 5.0,
                  max: 20.0,
                  value: rating,
                  onChanged: (newRating) async {
                    setState(() {
                      if (_currentButton != -1) sliderValueChanged = true;
                      rating = newRating;
                    });
                    if (_currentButton != -1) {
                      await Future.delayed(Duration(milliseconds: 300));
                      setState(() {
                        upperLowerBounds = [];
                      });

                      Provider.of<AppState>(context)
                          .getGroupAndCount(
                              type: tableType.steam,
                              attribute: Provider.of<AppState>(context)
                                  .steamColumnNames
                                  .keys
                                  .elementAt(_currentButton),
                              partitions: rating.toInt())
                          .then((_) {
                        if (_currentButton != -1)
                          Provider.of<AppState>(context).steamSeriesData = [];

                        setState(() {
                          if (_currentButton != -1) sliderValueChanged = false;

                          Provider.of<AppState>(context)
                              .steamGroupAndCount
                              .forEach((item) {
                            upperLowerBounds.add(
                                'U: ${item.upperBound}\nL: ${item.lowerBound}');
                          });
                        });
                      });
                    }
                    setState(() {});
                  },
                  inactiveColor: Colors.white,
                  activeColor: AppColors.secondaryColor,
                  divisions: 3,
                  label: "$rating",
                ),
                Divider(
                  color: Color(0xff57616f),
                ),
                Expanded(
                  child: Container(
                    constraints: BoxConstraints(
                        maxHeight: ScreenUtil.getInstance().setHeight(1000)),
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
                            .steamColumnNames
                            .length,
                        itemBuilder: (context, index) {
                          return GridTile(
                            child: listItem(
                                index: index,
                                title:
                                    "${Provider.of<AppState>(context).steamColumnNames.keys.elementAt(index)}",
                                isSelected: false),
                          );
                        }),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: ScreenUtil.getInstance().setHeight(300),
            left: ScreenUtil.getInstance().setWidth(460),
            child: Container(
                child: Center(
              child: sliderValueChanged
                  ? SpinKitRing(
                      size: 80,
                      color: Colors.white,
                    )
                  : SizedBox(),
            )),
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
      onTap: () {
        setState(() {
          _loading = true;
          upperLowerBounds = [];
        });
        _currentButton = index;
        Provider.of<AppState>(context)
            .getGroupAndCount(
                type: tableType.steam,
                attribute: Provider.of<AppState>(context)
                    .steamColumnNames
                    .keys
                    .elementAt(_currentButton),
                partitions: rating.toInt())
            .then((_) {
          if (_currentButton != -1)
            Provider.of<AppState>(context).steamSeriesData = [];

          setState(() {
            Provider.of<AppState>(context).steamGroupAndCount.forEach((item) {
              upperLowerBounds
                  .add('U: ${item.upperBound}\nL: ${item.lowerBound}');
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
