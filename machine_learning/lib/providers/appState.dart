import 'dart:convert';

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:machine_learning/main.dart';
import 'package:machine_learning/models/clusterCount.dart';
import 'package:machine_learning/models/groupAndCount.dart';
import 'package:machine_learning/models/groupType.dart';
import 'package:machine_learning/models/kaggleColumns.dart';
import 'package:machine_learning/models/schema.dart';
import 'package:machine_learning/models/stage.dart';
import 'package:machine_learning/models/steamColumns.dart';
import 'package:machine_learning/utils/appConfig.dart';

enum tableType { steam, kaggle }

class AppState with ChangeNotifier {
  List<charts.Series<GroupAndCount, num>> _kaggleSeriesData = [];

  List<charts.Series<GroupAndCount, num>> get kaggleSeriesData =>
      _kaggleSeriesData;

  set kaggleSeriesData(List<charts.Series<GroupAndCount, num>> value) {
    _kaggleSeriesData = value;
    notifyListeners();
  }

  List<charts.Series<GroupAndCount, num>> _steamSeriesData = [];

  List<charts.Series<GroupAndCount, num>> get steamSeriesData =>
      _steamSeriesData;

  set steamSeriesData(List<charts.Series<GroupAndCount, num>> value) {
    _steamSeriesData = value;
    notifyListeners();
  }

  Map _kaggleColumnNames;

  Map get kaggleColumnNames => _kaggleColumnNames;

  set kaggleColumnNames(Map value) {
    _kaggleColumnNames = value;
  }

  Map _steamColumnNames;

  List<GroupAndCount> _kaggleGroupAndCount = [];
  List<GroupAndCount> _steamGroupAndCount = [];

  List<GroupAndCount> get steamGroupAndCount => _steamGroupAndCount;

  set steamGroupAndCount(List<GroupAndCount> value) {
    _steamGroupAndCount = value;
    notifyListeners();
  }

  List<GroupAndCount> get kaggleGroupAndCount => _kaggleGroupAndCount;

  set kaggleGroupAndCount(List<GroupAndCount> value) {
    _kaggleGroupAndCount = value;
    notifyListeners();
  }

  Map get steamColumnNames => _steamColumnNames;

  set steamColumnNames(Map value) {
    _steamColumnNames = value;
  }

  Future getColumns(tableType type) async {
    http.Response response = await http.get(
      AppConfig.of(navigatorKey.currentContext).apiBaseUrl +
          "/getColumns?kind=${type.toString().split('.').last}",
    );
    type == tableType.kaggle
        ? kaggleColumnNames = await jsonDecode(response.body)
        : steamColumnNames = await jsonDecode(response.body);
  }


  Future<List<GroupAndCount>> getGroupAndCount(
      {tableType type, String attribute, int partitions}) async {
    http.Response response = await http.get(
      AppConfig.of(navigatorKey.currentContext).apiBaseUrl +
          "/getGroupAndCount?kind=${type.toString().split('.').last}&attribute=$attribute&partitions=$partitions",
    );
    List info = jsonDecode(response.body);
    type == tableType.kaggle
        ? _kaggleGroupAndCount =
        info.map((item) => GroupAndCount.fromMappedJson(item)).toList()
        : _steamGroupAndCount =
        info.map((item) => GroupAndCount.fromMappedJson(item)).toList();
    return type == tableType.kaggle
        ? _kaggleGroupAndCount
        : _steamGroupAndCount;
  }

  Future<Stage> getStages({tableType type}) async {
    http.Response response = await http.get(
      AppConfig.of(navigatorKey.currentContext).apiBaseUrl +
          "/getStages?kind=${type.toString().split('.').last}",
    );
    Map info = jsonDecode(response.body);
    return Stage.fromMappedJson(info);
  }

  Future<List<Map<dynamic, dynamic>>> getSample(
      {tableType type, double percentage}) async {
    http.Response response = await http.get(
      AppConfig.of(navigatorKey.currentContext).apiBaseUrl +
          "/getSample?kind=${type.toString().split('.').last}&percentage=$percentage",
    );
    List info = jsonDecode(response.body);
    return info.map((item) => Map.castFrom(item)).toList();
  }

  Future<List<dynamic>> getCorrelationMatrix({tableType type}) async {
    http.Response response = await http.get(
      AppConfig.of(navigatorKey.currentContext).apiBaseUrl +
          "/getCorrelationMatrix?kind=${type.toString().split('.').last}",
    );
    List info = jsonDecode(response.body);
    return info
        .map((item) => Map.castFrom(item))
        .toList()
        .first['pearson(features)']['values'];
  }

  Future<List<Schema>> getSchema({tableType type}) async {
    http.Response response = await http.get(
      AppConfig.of(navigatorKey.currentContext).apiBaseUrl +
          "/getSchema?kind=${type.toString().split('.').last}",
    );
    List info = jsonDecode(response.body);
    return info.map((item) => Schema.fromMappedJson(item)).toList();
  }

  Future<Map<String, dynamic>> getStats({tableType type}) async {
    http.Response response = await http.get(
      AppConfig.of(navigatorKey.currentContext).apiBaseUrl +
          "/getStats?kind=${type.toString().split('.').last}",
    );
    Map info = jsonDecode(response.body);
    return info;
  }

  Future postPredict(SteamColumns steamColumns) async {
    try {
      http.Response response = await http.post(
          AppConfig.of(navigatorKey.currentContext).apiBaseUrl + "/postPredict",
          body: jsonEncode(steamColumns),
          headers: {'Content-Type': "application/json"});
      List info = jsonDecode(response.body);
      return info.first['prediction'];
    } catch (e, s) {
      print(s);
    }
  }

  Future<List<List<GroupType>>> getClusterStats() async {
    http.Response response = await http.get(
      AppConfig.of(navigatorKey.currentContext).apiBaseUrl + "/getClusterStats",
    );
    List info = jsonDecode(response.body);
    List<Map<dynamic, dynamic>> kaggleColumns =
        info.map((item) => Map.castFrom(item)).toList();

    List<List<GroupType>> chartData = [];

    kaggleColumns.forEach((element) {
      List<GroupType> groupType = [];
      for (int i = 0; i < element.keys.length; i++) {
        groupType.add(GroupType(
            text: element.keys
                .elementAt(i)
                .toUpperCase()
                .replaceAll(RegExp('_'), ' '),
            value: element.values.elementAt(i)));
      }
      chartData.add(groupType);
    });
    return chartData;
  }

  Future<List<ClusterCount>> getClusterCount() async {
    http.Response response = await http.get(
      AppConfig.of(navigatorKey.currentContext).apiBaseUrl + "/getClusterCount",
    );
    List info = jsonDecode(response.body);

    return info.map((item) => ClusterCount.fromMappedJson(item)).toList();
  }

  Future postCluster(KaggleColumns kaggleColumns) async {
    try {
      http.Response response = await http.post(
          AppConfig.of(navigatorKey.currentContext).apiBaseUrl + "/postCluster",
          body: jsonEncode(kaggleColumns),
          headers: {'Content-Type': "application/json"});
      List info = jsonDecode(response.body);
      return info.first['prediction'];
    } catch (e, s) {
      print(s);
    }
  }
}
