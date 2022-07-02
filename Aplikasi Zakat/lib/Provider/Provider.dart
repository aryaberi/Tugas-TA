import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class itemLaporan with ChangeNotifier {
  List<Map> dataRow = [
    {
      "Id": "1",
      "Count": "1",
      "Nama": "Budi",
      "UserName": "Budi",
      "Tanggal": "12/02/2022",
      "Jenis": "Zakat Fitrah",
      "Jumlah": "27500",
      "Status": "Telah dibayarkan",
      "Laz": "Baznas",
      "Penangung": "09999777766",
      "Distribusi": "20/02/2022",
      "Tempat": "Kampung Miskin",
      "NoTlp": "088877766651",
      "AtasNama": "Lurah Kampung Miskin"
    },
    {
      "Id": "2",
      "Count": "1",
      "Nama": "Maman",
      "UserName": "Maman",
      "Tanggal": "12/02/2022",
      "Jenis": "Zakat Fitrah",
      "Jumlah": "27500",
      "Status": "Telah dibayarkan",
      "Laz": "Dhompet Dhuafa",
      "Penangung": "011122223333",
      "Distribusi": "18/02/2022",
      "Tempat": "Kampung Melarat",
      "NoTlp": "089898977012",
      "AtasNama": "Lurah Kampung Melarat"
    },
    {
      "Id": "3",
      "Count": "2",
      "Nama": "Maman",
      "UserName": "Maman",
      "Tanggal": "12/02/2022",
      "Jenis": "Zakat Fitrah",
      "Jumlah": "27500",
      "Status": "Telah dibayarkan",
      "Laz": "Baznas",
      "Penangung": "09999777766",
      "Distribusi": "20/02/2022",
      "Tempat": "Kampung Miskin",
      "NoTlp": "088877766651",
      "AtasNama": "Lurah Kampung Miskin"
    },
    {
      "Id": "4",
      "Count": "3",
      "Nama": "Maman",
      "UserName": "Maman",
      "Tanggal": "12/02/2022",
      "Jenis": "Zakat Fitrah",
      "Jumlah": "27500",
      "Status": "Telah dibayarkan",
      "Laz": "Dhompet Dhuafa",
      "Penangung": "011122223333",
      "Distribusi": "18/02/2022",
      "Tempat": "Kampung Melarat",
      "NoTlp": "089898977012",
      "AtasNama": "Lurah Kampung Melarat"
    }
  ];

  List<Map> get allItems {
    return [...dataRow];
  }

  void addData(value) {
    dataRow.add(value);
    notifyListeners();
  }

  List<Map> getByName(String userName) {
    int i = 0;
    List<Map> _data = [];
    for (i; i < [...dataRow].length; i++) {
      if ([...dataRow][i]["UserName"] == userName) {
        _data.add(dataRow[i]);
      }
    }
    return [..._data];
  }

  int getCountName(String userName) {
    int value = 0;
    int i = 0;
    print("Masuk Count");
    for (i; i < dataRow.length; i++) {
      print(dataRow[i]["UserName"]);
      print(userName);
      if (dataRow[i]["UserName"] == userName) {
        print("Nambah nih");
        value = value + 1;
      }
    }
    print("ini hasil akhir nya");
    print(value);
    return value;
  }

  void updateLastList() {
    int i = dataRow.length - 2;
    String now = DateFormat("dd/MM/yyyy").format(DateTime.now());
    dataRow[i]["Status"] = "Telah dibayarkan";
    dataRow[i]["Distribusi"] = now;
    dataRow[i]["Tempat"] = "Kampung Melarat";
    dataRow[i]["NoTlp"] = "089898977012";
    dataRow[i]["AtasNama"] = "Lurah Kampung Melarat";
  }
}
