import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:machine_learning/screens/tables/components/pageItem.dart';
import 'package:machine_learning/utils/colors.dart';
import 'package:machine_learning/utils/scaleTransition.dart';
import 'package:machine_learning/utils/strings.dart';

class TileItem extends StatelessWidget {
  final int num;
  final List<dynamic> keys;
  final List<Map<dynamic, dynamic>> data;

  const TileItem({Key key, this.num, this.keys, this.data}) : super(key: key);

  List getColumnValues(dynamic inputKey) {
    List values = [];
    for (Map<dynamic, dynamic> item in data) {
      item.forEach((key, value) {
        if (key == inputKey) {
          values.add(value);
        }
      });
    }
    return values;
  }

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "card$num",
      transitionOnUserGestures: true,
      child: Card(
        elevation: 5,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(ScreenUtil.getInstance().setHeight(50)),
        ),
        margin: EdgeInsets.all(ScreenUtil.getInstance().setHeight(30)),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                ScaleRoute(
                    page: PageItem(
                        num: num,
                        keyValue: keys[num]
                            .toString()
                            .toUpperCase()
                            .replaceAll(RegExp('_'), ' '),
                        values: getColumnValues(keys[num]))));
          },
          child: Container(
              color: Colors.transparent,
              width: double.infinity,
              height: ScreenUtil.getInstance().setHeight(200),
              child: Center(
                  child: Text(
                "${keys[num].toString().toUpperCase().replaceAll(RegExp('_'), ' ')}",
                style: TextStyle(
                    color: AppColors.defaultColor,
                    fontFamily: AppStrings.fontBold,
                    fontSize: ScreenUtil.getInstance().setHeight(48)),
              ))),
        ),
      ),
    );
  }
}
