import 'dart:convert';

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:machine_learning/models/stage.dart';
import 'package:machine_learning/utils/colors.dart';

class DistributionScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DistributionScreenState();
  }
}

class _DistributionScreenState extends State<DistributionScreen> {
  List<charts.Series<Stage, String>> _seriesData = [];
  List<Stage> myData = [];
  double rating = 0;

  _generateData(myData) {
    _seriesData.add(charts.Series(
        domainFn: (Stage stage, _) => stage.bucket.toString(),
        measureFn: (Stage stage, _) => stage.count,
        data: myData,
        id: "Stage"));
  }

  Future<List<Stage>> getData() async {
    String data =
        await DefaultAssetBundle.of(context).loadString("assets/stage.json");
    List mapData = await jsonDecode(data);
    mapData.forEach((data) {
      myData.add(Stage.fromMappedJson(data));
    });
    return myData;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: DefaultTabController(
            length: 2,
            child: Scaffold(
                backgroundColor: AppColors.defaultColor,
                appBar: AppBar(
                  backgroundColor: AppColors.defaultColor,
                  leading: IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: ScreenUtil.getInstance().setHeight(100),
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                  title: Text(
                    "IntelliDOTA",
                    style:
                        TextStyle(fontSize: ScreenUtil.getInstance().setSp(70)),
                  ),
                  bottom: TabBar(
                    tabs: [
                      Tab(
                        text: "Classification",
                      ),
                      Tab(
                        text: "Clustering",
                      ),
                    ],
                  ),
                  elevation: 0.0,
                ),
                body: TabBarView(
                  children: <Widget>[_buildBody(context), _buildBody(context)],
                ))));
  }

  Widget _buildBody(context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: FutureBuilder<List<Stage>>(
            future: getData(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: Text("No data yet!"),
                );
              } else {
                List<Stage> stageData = snapshot.data;
                return _buildChart(context, stageData);
              }
            },
          ),
        ),
        Container(
          child: Slider(
            inactiveColor: Colors.white,
            value: rating,
            onChanged: (newRating){
              setState(() {
                rating = newRating;
              });
            },
            divisions: 4,
          label: "$rating",),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                listItem(
                    title: "First Element",
                    color: Colors.yellow,
                    isSelected: false),
                listItem(
                    title: "First Element",
                    color: Colors.teal,
                    isSelected: true),
                listItem(
                    title: "First Element",
                    color: Colors.redAccent,
                    isSelected: false),
                listItem(
                    title: "First Element",
                    color: Colors.blue,
                    isSelected: false),
                listItem(
                    title: "First Element",
                    color: Colors.deepOrange,
                    isSelected: false),
                listItem(
                    title: "First Element",
                    color: Colors.teal,
                    isSelected: false),
                listItem(
                    title: "First Element",
                    color: Colors.yellowAccent,
                    isSelected: false),
                listItem(
                    title: "First Element",
                    color: Colors.brown,
                    isSelected: false),
                listItem(
                    title: "First Element",
                    color: Colors.cyanAccent,
                    isSelected: false),
                listItem(
                    title: "First Element",
                    color: Colors.deepPurpleAccent,
                    isSelected: false),
                listItem(
                    title: "First Element",
                    color: Colors.purpleAccent,
                    isSelected: false),
                listItem(
                    title: "First Element",
                    color: Colors.tealAccent,
                    isSelected: false),
                listItem(
                    title: "First Element",
                    color: Colors.teal,
                    isSelected: false),
                listItem(
                    title: "First Element",
                    color: Colors.yellow,
                    isSelected: false)
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _buildChart(BuildContext context, List<Stage> stageData) {
    myData = stageData;
    _generateData(myData);
    return Container(
      margin: EdgeInsets.all(ScreenUtil.getInstance().setHeight(200)),
      child: Center(
        child: charts.BarChart(
          _seriesData,
          animate: true,
          animationDuration: Duration(milliseconds: 500),
        ),
      ),
    );
  }

  Widget listItem({title, color, isSelected}) {
    return Container(
      width: double.infinity,
      height: ScreenUtil.getInstance().setHeight(150),
      margin: EdgeInsets.only(
        top: ScreenUtil.getInstance().setHeight(20),
      ),
      padding: EdgeInsets.only(
          bottom: ScreenUtil.getInstance().setHeight(40),
          top: ScreenUtil.getInstance().setHeight(40),
          left: ScreenUtil.getInstance().setHeight(20)),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          "$title",
          style: TextStyle(color: color),
        ),
      ),
      decoration: BoxDecoration(
          color: isSelected ? Colors.black.withOpacity(0.3) : null,
          border: isSelected
              ? Border(
                  left: BorderSide(
                      color: color,
                      width: ScreenUtil.getInstance().setHeight(10)))
              : null,
          boxShadow: [
            BoxShadow(
                color: AppColors.defaultColor.withOpacity(0.2),
                blurRadius: 0.5,
                spreadRadius: 0.5)
          ]),
    );
  }
}
