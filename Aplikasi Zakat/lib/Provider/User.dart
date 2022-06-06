import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class dataUser with ChangeNotifier {
  List<Map> UserRow = [
    {
      "Id": "1",
      "Nama": "Budi",
      "Email": "Budi123@gmail.com",
      "Password": "Budi123",
    },
    {
      "Id": "2",
      "Nama": "Maman",
      "Email": "Maman@gmail.com",
      "Password": "Maman123",
    }
  ];

  List<Map> get allItems {
    return [...UserRow];
  }

  void addData(value) {
    UserRow.add(value);
    notifyListeners();
  }

  bool check(name, pass) {
    bool value = false;
    int i = 0;
    while (i < UserRow.length && value == false) {
      if (UserRow[i]["Email"] == name) {
        if (UserRow[i]["Password"] == pass) {
          value = true;
          print(value);
        } else {
          i = i + 1;
        }
      } else {
        i = i + 1;
      }
    }
    return value;
  }

  String getUserName(name, pass) {
    String value = "";
    int i = 0;
    while (i < UserRow.length) {
      if (UserRow[i]["Email"] == name) {
        if (UserRow[i]["Password"] == pass) {
          value = UserRow[i]["Nama"];
          i = i + UserRow.length;
        } else {
          i = i + 1;
        }
      } else {
        i = i + 1;
      }
    }
    return value;
  }
}
