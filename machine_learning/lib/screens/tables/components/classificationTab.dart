import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:machine_learning/models/sampleColumns.dart';
import 'package:machine_learning/providers/appState.dart';
import 'package:machine_learning/screens/tables/components/tileItem.dart';
import 'package:provider/provider.dart';

class ClassificationTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ClassificationTabState();
  }
}

class _ClassificationTabState extends State<ClassificationTab> {
  List<Map<String,dynamic>> sampleColumns;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      Provider.of<AppState>(context)
          .getSample(type: tableType.steam, percentage: 10)
          .then((tableValue) {
        sampleColumns = tableValue;
        print(sampleColumns);
        setState(() {});
      });
    });
  }

  List<int> valueOfIndex({int index}) {
    List<int> value = new List<int>();
  }

  Widget _buildBody(context) {
    return SafeArea(
      child: sampleColumns == null
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
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          //  String key = classificationColumns[index].classificationElements.keys;
                          return TileItem(
                            num: index,
                          );
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildBody(context);
  }
}
