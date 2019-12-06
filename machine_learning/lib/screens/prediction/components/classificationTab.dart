import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:machine_learning/providers/appState.dart';
import 'package:machine_learning/utils/colors.dart';
import 'package:provider/provider.dart';

class ClassificationTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ClassificationTabState();
  }
}

class _ClassificationTabState extends State<ClassificationTab> {
  Map<String, int> _steamColumns = new Map();

  Widget _buildBody(context) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.symmetric(
            horizontal: ScreenUtil.getInstance().setHeight(20)),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: ScreenUtil.getInstance().setHeight(100),
            ),
            Expanded(
              child: Container(
                constraints: BoxConstraints(
                    maxHeight: ScreenUtil.getInstance().setHeight(1000)),
                margin: EdgeInsets.symmetric(
                    horizontal: ScreenUtil.getInstance().setHeight(50)),
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount:
                        Provider.of<AppState>(context).steamColumnNames.length,
                    itemBuilder: (context, index) {
                      return Container(
                        child: listItem(
                            index: index,
                            hintText: Provider.of<AppState>(context)
                                .steamColumnNames
                                .keys
                                .elementAt(index),
                            defaultValue: Provider.of<AppState>(context)
                                .steamColumnNames
                                .values
                                .elementAt(index)),
                      );
                    }),
              ),
            ),
            Container(
                margin: EdgeInsets.symmetric(
                    vertical: ScreenUtil.getInstance().setHeight(50),
                    horizontal: ScreenUtil.getInstance().setHeight(170)),
                width: double.infinity,
                child: FlatButton(
                  onPressed: () async {
                    print(_steamColumns);
                    await Provider.of<AppState>(context)
                        .postPredict(_steamColumns);
//                    await showDialog(
//                        context: context,
//                        builder: (context) {
//                          return SimpleDialog(
//                            backgroundColor: Colors.white,
//                            title: Text(
//                              'Given your input you are most likely to win',
//                              textAlign: TextAlign.center,
//                              style: TextStyle(
//                                  color: AppColors.secondaryColor,
//                                  fontFamily: AppStrings.fontMedium),
//                            ),
//                            children: <Widget>[
//                              SimpleDialogOption(
//                                onPressed: () {
//                                  Navigator.pop(context);
//                                },
//                                child: Padding(
//                                  padding: EdgeInsets.all(
//                                      ScreenUtil.getInstance().setHeight(10)),
//                                  child: Align(
//                                    alignment: Alignment.centerRight,
//                                    child: Text(
//                                      'close'.toUpperCase(),
//                                      style: TextStyle(
//                                          color: Color(0xFF2CE6D8),
//                                          fontFamily: AppStrings.fontMedium),
//                                    ),
//                                  ),
//                                ),
//                              ),
//                            ],
//                          );
//                        });
                  },
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          ScreenUtil.getInstance().setHeight(30))),
                  child: Text(
                    'PREDICT',
                    style: TextStyle(color: AppColors.defaultColor),
                  ),
                )),
          ],
        ),
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
        horizontal: ScreenUtil.getInstance().setHeight(120),
        vertical: ScreenUtil.getInstance().setHeight(10),
      ),
      child: TextField(
        onSubmitted: (value) {
          print("||||||||||||||||||||| $value");
        },
        onChanged: (value) {
          _steamColumns.update('$hintText', (existingValue) => int.parse(value),
              ifAbsent: () => int.parse(value));
        },
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
