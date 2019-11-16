import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:machine_learning/models/stage.dart';
import 'package:machine_learning/models/stageElements.dart';
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
  Stage stage;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      Provider.of<AppState>(context)
          .getStages(type: tableType.kaggle)
          .then((stageValue) {
        stage = stageValue;
        setState(() {});
      });
    });
  }

  Widget _buildBody(context) {
    return SafeArea(
      child: stage == null
          ? Container(
          color: Colors.black.withOpacity(0.5),
          child: Center(
            child: SpinKitRing(
              size: 80,
              color: Colors.white,
            ),
          ))
          : Container(
        margin: EdgeInsets.symmetric(
            horizontal: ScreenUtil.getInstance().setHeight(20)),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: ScreenUtil.getInstance().setHeight(100),
            ),
            Expanded(
              child: Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: ScreenUtil.getInstance().setHeight(50)),
                  child: ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      String key = stage.stage.keys.elementAt(index);
                      return listItem(
                          title: key, content: stage.stage[key]);
                    },
                    itemCount: stage.stage.keys.length,
                  )),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildBody(context);
  }

  Widget listItem({index, title, List<StageElements> content, isSelected}) {
    return Stack(
      children: <Widget>[
        Padding(
          padding:
          EdgeInsets.only(left: ScreenUtil.getInstance().setHeight(130)),
          child: Card(
            color: AppColors.defaultColor,
            elevation: 0,
            margin: EdgeInsets.all(ScreenUtil.getInstance().setHeight(30)),
            child: Container(
              width: double.infinity,
              height: ScreenUtil.getInstance()
                  .setHeight(200 + content.length.toDouble() * 75),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(
                      ScreenUtil.getInstance().setHeight(100))),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                        top: ScreenUtil.getInstance().setHeight(20)),
                    child: Text(
                      "${title.split("_")[0]}",
                      style: TextStyle(
                          color: AppColors.defaultColor,
                          fontFamily: AppStrings.fontMedium),
                    ),
                  ),
                  SizedBox(
                    height: ScreenUtil.getInstance().setHeight(50),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: ScreenUtil.getInstance().setHeight(30)),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Text(
                                      "${content[index].name}:",
                                      style: TextStyle(
                                          color: AppColors.defaultColor,
                                          fontFamily: AppStrings.fontRegular),
                                    ),
                                    SizedBox(
                                      width: ScreenUtil.getInstance()
                                          .setHeight(10),
                                    ),
                                    Text(
                                      "${content[index].value.split("@")[0]}",
                                      style: TextStyle(
                                          color: AppColors.defaultColor,
                                          fontFamily: AppStrings.fontLight),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height:
                                  ScreenUtil.getInstance().setHeight(15),
                                ),
                              ],
                            );
                          },
                          itemCount: content.length,
                        )),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: 0.0,
          bottom: 0.0,
          left: ScreenUtil.getInstance().setHeight(50),
          child: Container(
            height: double.infinity,
            width: ScreenUtil.getInstance().setHeight(2.5),
            color: AppColors.secondaryColor,
          ),
        ),
        Positioned(
          top: ScreenUtil.getInstance()
              .setHeight(100 + content.length.toDouble() * 32.5),
          left: ScreenUtil.getInstance().setHeight(0),
          child: Container(
            height: ScreenUtil.getInstance().setHeight(100),
            width: ScreenUtil.getInstance().setHeight(100),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white)),
            child: Container(
              margin: EdgeInsets.all(ScreenUtil.getInstance().setHeight(15)),
              height: ScreenUtil.getInstance().setHeight(50),
              width: ScreenUtil.getInstance().setHeight(50),
              decoration:
              BoxDecoration(shape: BoxShape.circle, color: Colors.white),
            ),
          ),
        )
      ],
    );
  }
}
