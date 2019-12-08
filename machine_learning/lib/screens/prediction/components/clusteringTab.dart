import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:machine_learning/models/kaggleColumns.dart';
import 'package:machine_learning/models/steamColumns.dart';
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
  SteamColumns steamColumns;
  var textEditingControllers = <TextEditingController>[];
  Map kaggleColumnNames = new Map();
  bool hasPressed = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      kaggleColumnNames
          .addAll(Provider.of<AppState>(context).kaggleColumnNames);
      setState(() {});
      ;
      kaggleColumnNames.keys.forEach((_) {
        var textEditingController = new TextEditingController(text: "");
        textEditingControllers.add(textEditingController);
        setState(() {});
      });
    });
  }

  Widget _buildBody(context) {
    return SafeArea(
      child: Stack(
        children: <Widget>[
          kaggleColumnNames.isEmpty
              ? Center(
                  child: SpinKitRing(
                    size: 80,
                    color: Colors.white,
                  ),
                )
              : Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: ScreenUtil.getInstance().setHeight(190)),
                  child: Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: ScreenUtil.getInstance().setHeight(100),
                        ),
                        Expanded(
                          child: Container(
                            constraints: BoxConstraints(
                                maxHeight:
                                    ScreenUtil.getInstance().setHeight(1000)),
                            child: ListView.builder(
                                scrollDirection: Axis.vertical,
                                itemCount: kaggleColumnNames.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    child: listItem(
                                        index: index,
                                        hintText: kaggleColumnNames.keys
                                            .elementAt(index),
                                        defaultValue: kaggleColumnNames.values
                                            .elementAt(index)),
                                  );
                                }),
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.symmetric(
                              vertical: ScreenUtil.getInstance().setHeight(50),
                            ),
                            width: double.infinity,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Tooltip(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: ScreenUtil.getInstance()
                                          .setHeight(250)),
                                  padding: EdgeInsets.all(
                                      ScreenUtil.getInstance().setHeight(20)),
                                  showDuration: Duration(seconds: 5),
                                  message:
                                      'Për fushat të cilat nuk plotësohen, do të merren vlerat e paracaktuar më lart',
                                  textStyle: TextStyle(color: Colors.white),
                                  child: Icon(
                                    Icons.info_outline,
                                    color: Colors.white,
                                    size:
                                        ScreenUtil.getInstance().setHeight(100),
                                  ),
                                ),
                                Spacer(),
                                SizedBox(
                                  width: ScreenUtil.getInstance().setWidth(500),
                                  child: FlatButton(
                                    onPressed: () async {
                                      setState(() {
                                        hasPressed = true;
                                      });
                                      await Provider.of<AppState>(context)
                                          .postCluster(KaggleColumns(
                                        kills: textEditingControllers[0]
                                                .text
                                                .isNotEmpty
                                            ? double.parse(
                                                textEditingControllers[0].text)
                                            : kaggleColumnNames.values
                                                .elementAt(0),
                                        gold: textEditingControllers[1]
                                                .text
                                                .isNotEmpty
                                            ? double.parse(
                                                textEditingControllers[1].text)
                                            : kaggleColumnNames.values
                                                .elementAt(1),
                                        deaths: textEditingControllers[2]
                                                .text
                                                .isNotEmpty
                                            ? double.parse(
                                                textEditingControllers[2].text)
                                            : kaggleColumnNames.values
                                                .elementAt(2),
                                        goldPerMin: textEditingControllers[3]
                                                .text
                                                .isNotEmpty
                                            ? double.parse(
                                                textEditingControllers[3].text)
                                            : kaggleColumnNames.values
                                                .elementAt(3),
                                        xpPerMin: textEditingControllers[4]
                                                .text
                                                .isNotEmpty
                                            ? double.parse(
                                                textEditingControllers[4].text)
                                            : kaggleColumnNames.values
                                                .elementAt(4),
                                        assists: textEditingControllers[5]
                                                .text
                                                .isNotEmpty
                                            ? double.parse(
                                                textEditingControllers[5].text)
                                            : kaggleColumnNames.values
                                                .elementAt(5),
                                        denies: textEditingControllers[6]
                                                .text
                                                .isNotEmpty
                                            ? double.parse(
                                                textEditingControllers[6].text)
                                            : kaggleColumnNames.values
                                                .elementAt(6),
                                        towerDamage: textEditingControllers[7]
                                                .text
                                                .isNotEmpty
                                            ? double.parse(
                                                textEditingControllers[7].text)
                                            : kaggleColumnNames.values
                                                .elementAt(7),
                                        heroHealing: textEditingControllers[8]
                                                .text
                                                .isNotEmpty
                                            ? double.parse(
                                                textEditingControllers[8].text)
                                            : kaggleColumnNames.values
                                                .elementAt(8),
                                        heroDamage: textEditingControllers[9]
                                                .text
                                                .isNotEmpty
                                            ? double.parse(
                                                textEditingControllers[9].text)
                                            : kaggleColumnNames.values
                                                .elementAt(9),
                                        lastHits: textEditingControllers[10]
                                                .text
                                                .isNotEmpty
                                            ? double.parse(
                                                textEditingControllers[10].text)
                                            : kaggleColumnNames.values
                                                .elementAt(10),
                                        level: textEditingControllers[11]
                                                .text
                                                .isNotEmpty
                                            ? double.parse(
                                                textEditingControllers[11].text)
                                            : kaggleColumnNames.values
                                                .elementAt(11),
                                      ))
                                          .then((value) async {
                                        setState(() {
                                          hasPressed = false;
                                        });
                                        await showDialog(
                                            context: context,
                                            builder: (context) {
                                              return SimpleDialog(
                                                backgroundColor: Colors.white,
                                                title: Text(
                                                  'Bazuar në të dhënat e ofruara ju do i takoni kllasterit $value',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      color: AppColors
                                                          .secondaryColor,
                                                      fontFamily: AppStrings
                                                          .fontMedium),
                                                ),
                                                children: <Widget>[
                                                  SimpleDialogOption(
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: Padding(
                                                      padding: EdgeInsets.all(
                                                          ScreenUtil
                                                                  .getInstance()
                                                              .setHeight(10)),
                                                      child: Align(
                                                        alignment: Alignment
                                                            .centerRight,
                                                        child: Text(
                                                          'MBYLL',
                                                          style: TextStyle(
                                                              color: Color(
                                                                  0xFF2CE6D8),
                                                              fontFamily:
                                                                  AppStrings
                                                                      .fontMedium),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              );
                                            });
                                      });
                                    },
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            ScreenUtil.getInstance()
                                                .setHeight(30))),
                                    child: Text(
                                      'PREDICT',
                                      style: TextStyle(
                                          color: AppColors.defaultColor),
                                    ),
                                  ),
                                ),
                                Spacer(),
                                SizedBox(
                                  width: ScreenUtil.getInstance().setHeight(55),
                                )
                              ],
                            )),
                      ],
                    ),
                  ),
                ),
          hasPressed
              ? Center(
                  child: SpinKitRing(
                    size: 80,
                    color: Colors.white,
                  ),
                )
              : Container(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildBody(context);
  }

  Widget listItem({index, hintText, defaultValue}) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: ScreenUtil.getInstance().setHeight(10),
      ),
      child: TextFormField(
        controller: textEditingControllers[index],
        keyboardType: TextInputType.numberWithOptions(signed: false),
        style: TextStyle(
            color: Colors.white, fontSize: ScreenUtil.getInstance().setSp(42)),
        decoration: InputDecoration(
            hintText:
                '${hintText.toUpperCase().replaceAll(RegExp('_'), ' ')} - $defaultValue',
            contentPadding:
                EdgeInsets.all(ScreenUtil.getInstance().setHeight(45)),
            hintStyle: TextStyle(
                color: Colors.white.withOpacity(0.5),
                fontSize: ScreenUtil.getInstance().setSp(28)),
            labelStyle: TextStyle(color: Colors.white),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.white)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.white))),
      ),
    );
  }
}
