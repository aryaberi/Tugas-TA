import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class itemLaporan with ChangeNotifier {
  List<Map> dataRow = [
    {
      "Id": "1",
      "Nama": "Budi",
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
      "Nama": "Maman",
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
}