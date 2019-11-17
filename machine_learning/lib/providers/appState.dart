import 'dart:convert';

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:machine_learning/main.dart';
import 'package:machine_learning/models/clusteringColumns.dart';
import 'package:machine_learning/models/clusteringColumns.dart';
import 'package:machine_learning/models/groupAndCount.dart';
import 'package:machine_learning/models/stage.dart';
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

  List _kaggleColumnNames = [];
  List _steamColumnNames = [];
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

  List get steamColumnNames => _steamColumnNames;

  set steamColumnNames(List value) {
    _steamColumnNames = value;
    notifyListeners();
  }

  List get kaggleColumnNames => _kaggleColumnNames;

  set kaggleColumnNames(List value) {
    _kaggleColumnNames = value;
    notifyListeners();
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
      {tableType type, String attribute}) async {
    http.Response response = await http.get(
      AppConfig.of(navigatorKey.currentContext).apiBaseUrl +
          "/getGroupAndCount?kind=${type.toString().split('.').last}&attribute=$attribute&partitions=4",
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

  Future<List<>> getSample({tableType type, double percentage}) async {
    http.Response response = await http.get(
      AppConfig.of(navigatorKey.currentContext).apiBaseUrl +
          "/getSample?kind=${type.toString().split('.').last}&percentage=$percentage",
    );
    List info = jsonDecode(response.body);
    return type == tableType.kaggle
        ? info.map((item) => ClusteringColumns.fromMappedJson(item)).toList()
        : info
            .map((item) => ClassificationColumns.fromMappedJson(item))
            .toList();
  }
}
