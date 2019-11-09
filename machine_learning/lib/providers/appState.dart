import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:machine_learning/main.dart';
import 'package:machine_learning/utils/appConfig.dart';

enum tableType { steam, kaggle }

class AppState with ChangeNotifier {
  List _kaggleColumnNames = [];
  List _steamColumnNames = [];

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
}
