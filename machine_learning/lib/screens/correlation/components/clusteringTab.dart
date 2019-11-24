import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:machine_learning/providers/appState.dart';
import 'package:machine_learning/screens/correlation/components/plotPainter.dart';
import 'package:machine_learning/screens/correlation/components/textPainter.dart';
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
  List<dynamic> points = [];

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      Provider.of<AppState>(context)
          .getCorrelationMatrix(type: tableType.kaggle)
          .then((values) {
        points = values;
        setState(() {});
      });
    });
  }

  Widget _buildBody(context) {
    return SafeArea(
        child: points.isEmpty
            ? Container(
                color: Colors.black.withOpacity(0.5),
                child: Center(
                  child: SpinKitRing(
                    size: 80,
                    color: Colors.white,
                  ),
                ))
            : Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: ScreenUtil.getInstance().setHeight(20)),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: ScreenUtil.getInstance().setHeight(80),
                        ),
                        _buildGradient(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(
                                      left: ScreenUtil.getInstance()
                                          .setHeight(20)),
                                  width: ScreenUtil.getInstance().setHeight(60),
                                  height:
                                      ScreenUtil.getInstance().setHeight(950),
                                  child: ListView.builder(
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount: sqrt(points.length).toInt(),
                                      itemBuilder: (context, index) {
                                        return Container(
                                          height: ScreenUtil.getInstance()
                                              .setHeight(80),
                                          child: Center(
                                              child: Text(
                                            '${sqrt(points.length).toInt() - index}',
                                            style: TextStyle(
                                                fontFamily:
                                                    AppStrings.fontRegular,
                                                color: Colors.white),
                                          )),
                                        );
                                      }),
                                ),
                                Container(
                                  width:
                                      ScreenUtil.getInstance().setHeight(950),
                                  height:
                                      ScreenUtil.getInstance().setHeight(950),
                                  margin: EdgeInsets.symmetric(
                                      horizontal: ScreenUtil.getInstance()
                                          .setHeight(20)),
                                  child: CustomPaint(
                                    painter: PlotPainter(
                                        List<double>.from(points),
                                        divisions: sqrt(points.length).toInt()),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              width: ScreenUtil.getInstance().setHeight(950),
                              height: ScreenUtil.getInstance().setHeight(60),
                              margin: EdgeInsets.only(
                                  top: ScreenUtil.getInstance().setHeight(5),
                                  right:
                                      ScreenUtil.getInstance().setHeight(55)),
                              child: ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: sqrt(points.length).toInt(),
                                  itemBuilder: (context, index) {
                                    return Container(
                                      width: ScreenUtil.getInstance()
                                          .setHeight(80),
                                      child: Center(
                                          child: Text(
                                        '${index + 1}',
                                        style: TextStyle(
                                            fontFamily: AppStrings.fontRegular,
                                            color: Colors.white),
                                      )),
                                    );
                                  }),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: ScreenUtil.getInstance().setWidth(2000),
                    height: ScreenUtil.getInstance().setWidth(200),
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: Provider.of<AppState>(context)
                            .kaggleColumnNames
                            .length,
                        itemBuilder: (context, index) {
                          return Container(
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                    ScreenUtil.getInstance().setHeight(40)),
                            child: CustomPaint(
                                painter: StringPainter(
                                    angle: 1.9,
                                    text: Provider.of<AppState>(context)
                                        .steamColumnNames[index]
                                        .replaceAll(RegExp('_'), ' '))),
                          );
                        }),
                  ),
                ],
              ));
  }

  Widget _buildGradient() {
    return Column(
      children: <Widget>[
        Container(
            margin:
                EdgeInsets.only(bottom: ScreenUtil.getInstance().setHeight(10)),
            width: ScreenUtil.getInstance().setWidth(600),
            height: ScreenUtil.getInstance().setWidth(60),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white.withOpacity(0.2)),
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  stops: [
                    0.0,
                    0.3,
                    0.5,
                    0.7,
                    1.0,
                  ],
                  colors: <Color>[
                    Colors.white,
                    Colors.white.withOpacity(0.5),
                    AppColors.defaultColor,
                    Colors.white.withOpacity(0.5),
                    Colors.white
                  ]),
            )),
        Container(
            margin: EdgeInsets.symmetric(
                horizontal: ScreenUtil.getInstance().setHeight(20)),
            width: ScreenUtil.getInstance().setWidth(580),
            height: ScreenUtil.getInstance().setWidth(50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('1',
                    style: TextStyle(
                        fontFamily: AppStrings.fontRegular,
                        color: Colors.white)),
                Text('0',
                    style: TextStyle(
                        fontFamily: AppStrings.fontRegular,
                        color: Colors.white)),
                Text('-1',
                    style: TextStyle(
                        fontFamily: AppStrings.fontRegular,
                        color: Colors.white))
              ],
            )),
        SizedBox(
          height: ScreenUtil.getInstance().setHeight(35),
        ),
      ],
    );
  }

  Widget _buildLegend() {
    return Container(
      margin: EdgeInsets.symmetric(
          vertical: ScreenUtil.getInstance().setHeight(50),
          horizontal: ScreenUtil.getInstance().setHeight(50)),
      width: double.infinity,
      height: ScreenUtil.getInstance().setHeight(500),
      child: GridView.builder(
          primary: false,
          scrollDirection: Axis.vertical,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: ScreenUtil.getInstance().setWidth(660) /
                (MediaQuery.of(context).size.height / 22),
          ),
          itemCount: Provider.of<AppState>(context).kaggleColumnNames.length,
          itemBuilder: (context, index) {
            return GridTile(
                child: Padding(
              padding: EdgeInsets.only(
                  left: ScreenUtil.getInstance().setHeight(65),
                  top: ScreenUtil.getInstance().setHeight(20)),
              child: Text(
                '${index + 1}: ${Provider.of<AppState>(context).steamColumnNames[index].replaceAll(RegExp('_'), ' ')}',
                style: TextStyle(
                    color: Colors.white, fontFamily: AppStrings.fontMedium),
              ),
            ));
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildBody(context);
  }
}
