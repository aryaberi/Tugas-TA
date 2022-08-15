import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class listBayar with ChangeNotifier {
  List<Map> dataRow = [
    {"nama": "pilih nama"},
    // {"nama": "Rizki"},
    // {"nama": "Budi"},
  ];

  List<Map> get allItems {
    return [...dataRow];
  }

  bool check(name) {
    bool value = false;
    int i = 0;
    while (i < dataRow.length && value == false) {
      print("perbandingan");
      print(name["nama"]);
      print(dataRow[i]["nama"]);
      // print(pass);
      if (dataRow[i]["nama"] == name["nama"]) {
        value = true;
      } // print(value);
      else {
        i = i + 1;
      }
    }
    return value;
  }

  void addData(value) {
    bool isEmpty = check(value);
    print(isEmpty);
    if (!isEmpty) {
      dataRow.add(value);
      notifyListeners();
    }
  }
}
