import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:machine_learning/providers/appState.dart';
import 'package:provider/provider.dart';

class ClassificationTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ClassificationTabState();
  }
}

class _ClassificationTabState extends State<ClassificationTab> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {});
  }

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
                      return GridTile(
                        child: listItem(
                          index: index,
                          hintText: Provider.of<AppState>(context)
                              .steamColumnNames[index],
                        ),
                      );
                    }),
              ),
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

  Widget listItem({index, hintText}) {
    return Container(
      width: double.infinity,
      height: ScreenUtil.getInstance().setHeight(100),
      margin: EdgeInsets.all(
        ScreenUtil.getInstance().setHeight(50),
      ),
      child: TextField(
        decoration: InputDecoration(
            hintText: '${hintText.toString()}',
            hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.white)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.white))
        ),
      ),
    );
  }
}
