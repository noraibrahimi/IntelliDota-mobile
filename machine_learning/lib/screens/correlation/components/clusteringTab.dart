import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:machine_learning/providers/appState.dart';
import 'package:machine_learning/screens/correlation/components/plotGradient.dart';
import 'package:machine_learning/screens/correlation/components/plotPainter.dart';
import 'package:machine_learning/screens/correlation/components/textPainter.dart';
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
                        BuildGradient(),
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
                            child: Transform(
                                transform: Matrix4.identity()
                                  ..rotateX(0)
                                  ..rotateY(0)
                                  ..rotateZ(-2),
                                alignment: FractionalOffset.center,
                                child: CustomPaint(
                                  painter: StringPainter(
                                      position: Offset(-20, -100.0),
                                      angle: -3.1,
                                      text: Provider.of<AppState>(context)
                                          .steamColumnNames
                                          .keys
                                          .elementAt(index)
                                          .toUpperCase()
                                          .replaceAll(RegExp('_'), ' ')),
                                )),
                          );
                        }),
                  ),
                ],
              ));
  }

  @override
  Widget build(BuildContext context) {
    return _buildBody(context);
  }
}
