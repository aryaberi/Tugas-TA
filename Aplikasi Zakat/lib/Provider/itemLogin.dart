import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class itemLogin with ChangeNotifier {
  List<Map> dataRow = [];

  List<Map> get allItems {
    return [...dataRow];
  }

  void addData(value) {
    dataRow.add(value);
    notifyListeners();
  }

  void delete() {
    dataRow.removeLast();
    notifyListeners();
  }
}
