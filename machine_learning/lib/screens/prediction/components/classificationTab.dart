import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:machine_learning/models/steamColumns.dart';
import 'package:machine_learning/providers/appState.dart';
import 'package:machine_learning/utils/colors.dart';
import 'package:machine_learning/utils/strings.dart';
import 'package:provider/provider.dart';

class ClassificationTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ClassificationTabState();
  }
}

class _ClassificationTabState extends State<ClassificationTab> {
  SteamColumns steamColumns;
  var textEditingControllers = <TextEditingController>[];
  Map steamColumnNames = new Map();
  bool hasPressed = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      steamColumnNames.addAll(Provider.of<AppState>(context).steamColumnNames);
      setState(() {});
      steamColumnNames.remove('radiant_win');
      steamColumnNames.keys.forEach((_) {
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
          steamColumnNames.isEmpty
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
                                itemCount: steamColumnNames.length,
                                itemBuilder: (context, index) {
                                  return steamColumnNames.keys
                                              .elementAt(index) !=
                                          'radiant_win'
                                      ? Container(
                                          child: listItem(
                                              index: index,
                                              hintText: steamColumnNames.keys
                                                  .elementAt(index),
                                              defaultValue: steamColumnNames
                                                  .values
                                                  .elementAt(index)),
                                        )
                                      : Container();
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
                                          .postPredict(SteamColumns(
                                        duration: textEditingControllers[0]
                                                .text
                                                .isNotEmpty
                                            ? int.parse(
                                                textEditingControllers[0].text)
                                            : steamColumnNames.values
                                                .elementAt(0),
                                        goldSpent: textEditingControllers[1]
                                                .text
                                                .isNotEmpty
                                            ? int.parse(
                                                textEditingControllers[1].text)
                                            : steamColumnNames.values
                                                .elementAt(1),
                                        deaths: textEditingControllers[2]
                                                .text
                                                .isNotEmpty
                                            ? int.parse(
                                                textEditingControllers[2].text)
                                            : steamColumnNames.values
                                                .elementAt(2),
                                        radiantScore: textEditingControllers[3]
                                                .text
                                                .isNotEmpty
                                            ? int.parse(
                                                textEditingControllers[3].text)
                                            : steamColumnNames.values
                                                .elementAt(3),
                                        goldPerMin: textEditingControllers[4]
                                                .text
                                                .isNotEmpty
                                            ? int.parse(
                                                textEditingControllers[4].text)
                                            : steamColumnNames.values
                                                .elementAt(4),
                                        xpPerMin: textEditingControllers[5]
                                                .text
                                                .isNotEmpty
                                            ? int.parse(
                                                textEditingControllers[5].text)
                                            : steamColumnNames.values
                                                .elementAt(5),
                                        denies: textEditingControllers[6]
                                                .text
                                                .isNotEmpty
                                            ? int.parse(
                                                textEditingControllers[6].text)
                                            : steamColumnNames.values
                                                .elementAt(6),
                                        towerDamage: textEditingControllers[7]
                                                .text
                                                .isNotEmpty
                                            ? int.parse(
                                                textEditingControllers[7].text)
                                            : steamColumnNames.values
                                                .elementAt(7),
                                        leaverStatus: textEditingControllers[8]
                                                .text
                                                .isNotEmpty
                                            ? int.parse(
                                                textEditingControllers[8].text)
                                            : steamColumnNames.values
                                                .elementAt(8),
                                        heroHealing: textEditingControllers[9]
                                                .text
                                                .isNotEmpty
                                            ? int.parse(
                                                textEditingControllers[9].text)
                                            : steamColumnNames.values
                                                .elementAt(9),
                                        heroDamage: textEditingControllers[10]
                                                .text
                                                .isNotEmpty
                                            ? int.parse(
                                                textEditingControllers[10].text)
                                            : steamColumnNames.values
                                                .elementAt(10),
                                        lastHits: textEditingControllers[11]
                                                .text
                                                .isNotEmpty
                                            ? int.parse(
                                                textEditingControllers[11].text)
                                            : steamColumnNames.values
                                                .elementAt(11),
                                        level: textEditingControllers[12]
                                                .text
                                                .isNotEmpty
                                            ? int.parse(
                                                textEditingControllers[12].text)
                                            : steamColumnNames.values
                                                .elementAt(12),
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
                                                  'Given your input you are most likely to ${value.toInt() == 0 ? 'loose' : 'win'}',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      color: AppColors
                                                          .secondaryColor,
                                                      fontFamily:
                                                          AppStrings.fontMedium),
                                                ),
                                                children: <Widget>[
                                                  SimpleDialogOption(
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: Padding(
                                                      padding: EdgeInsets.all(
                                                          ScreenUtil.getInstance()
                                                              .setHeight(10)),
                                                      child: Align(
                                                        alignment:
                                                            Alignment.centerRight,
                                                        child: Text(
                                                          'close'.toUpperCase(),
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
