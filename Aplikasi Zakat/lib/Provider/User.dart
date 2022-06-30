import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class dataUser with ChangeNotifier {
  List<Map> UserRow = [
    {
      "Id": "1",
      "Nama": "Budi",
      "Email": "Budi123@gmail.com",
      "Password": "Budi123",
      "NoIdentity": "1234567887654321",
      "Ovo": false,
      "SOvo": "1000000",
      "Gopay": false,
      "SGopay": "1000000",
      "Dana": false,
      "SDana": "1000000",
      "Link Aja": false,
      "SLink": "1000000",
    },
    {
      "Id": "2",
      "Nama": "Maman",
      "Email": "Maman@gmail.com",
      "Password": "Maman123",
      "NoIdentity": "8765432112345678",
      "Ovo": false,
      "SOvo": "1000000",
      "Gopay": false,
      "SGopay": "1000000",
      "Dana": false,
      "SDana": "1000000",
      "Link Aja": false,
      "SLink": "1000000",
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
      // print(name);
      // print(pass);
      if (UserRow[i]["Email"] == name) {
        if (UserRow[i]["Password"] == pass) {
          value = true;
          // print(value);
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

  bool getStatusEmoney(Nama, Jenis) {
    int i = 0;
    // print(UserRow[i][Jenis]);
    bool value = UserRow[i]["Ovo"];
    while (i < UserRow.length) {
      if (UserRow[i]["Nama"] == Nama) {
        // print("masuk sini");
        // print(Jenis);
        // print(UserRow[i][Jenis]);
        value = UserRow[i][Jenis];
        i = i + UserRow.length;
      } else {
        i = i + 1;
      }
    }
    // print("ini value akhir");
    // print(value);
    return value;
  }

  String getSaldo(Nama, Jenis) {
    int i = 0;
    String value = UserRow[i]["SOvo"];
    while (i < UserRow.length) {
      if (UserRow[i]["Nama"] == Nama) {
        if (Jenis == "Ovo") {
          value = UserRow[i]["SOvo"];
        } else if (Jenis == "Gopay") {
          value = UserRow[i]["SGopay"];
        } else if (Jenis == "Dana") {
          value = UserRow[i]["SDana"];
        } else if (Jenis == "Link Aja") {
          value = UserRow[i]["SLink"];
        }
        i = i + UserRow.length;
      } else {
        i = i + 1;
      }
    }
    return value;
  }

  void setStatusEmoney(Nama, Jenis) {
    int i = 0;
    // bool value = UserRow[i]["Ovo"];
    while (i < UserRow.length) {
      // print(UserRow[i]["Nama"]);
      // print(Nama);
      if (UserRow[i]["Nama"] == Nama) {
        // print("Masuk sini");
        UserRow[i][Jenis] = true;
        notifyListeners();
        i = i + UserRow.length;
      } else {
        // print("Gak masuk");
        i = i + 1;
      }
    }
    notifyListeners();
  }

  void setSaldo(Nama, Jenis, int Biaya) {
    int value = 0;
    int i = 0;
    while (i < UserRow.length) {
      print("Masuk set saldo");
      print(UserRow[i]["Nama"]);
      print(Nama);
      if (UserRow[i]["Nama"] == Nama) {
        // print("Masuk sini");
        if (Jenis == "Ovo") {
          value = int.parse(UserRow[i]["SOvo"]) - Biaya;
          UserRow[i]["SOvo"] = value.toString();
          print(UserRow[i]["SOvo"]);
          notifyListeners();
        } else if (Jenis == "Gopay") {
          value = int.parse(UserRow[i]["SGopay"]) - Biaya;
          UserRow[i]["SGopay"] = value.toString();
          notifyListeners();
        } else if (Jenis == "Dana") {
          value = int.parse(UserRow[i]["SDana"]) - Biaya;
          UserRow[i]["SDana"] = value.toString();
          notifyListeners();
        } else if (Jenis == "Link Aja") {
          value = int.parse(UserRow[i]["SLink"]) - Biaya;
          UserRow[i]["Link"] = value.toString();
          notifyListeners();
        }
        notifyListeners();
        i = i + UserRow.length;
      } else {
        // print("Gak masuk");
        i = i + 1;
      }
    }

    notifyListeners();
  }
}
