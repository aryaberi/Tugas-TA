import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_2/Belajar_Page/Hukuman.dart';
import 'package:flutter_application_2/Belajar_Page/WajibZakat.dart';
import 'package:flutter_application_2/Belajar_Page/ZakatOnline.dart';
import 'package:flutter_application_2/Belajar_Page/pengertianZakat.dart';
import 'package:flutter_application_2/Widget/CardList.dart';
import 'package:flutter_application_2/Kalkulator_Page/K_zakatEmas.dart';
import 'package:flutter_application_2/Kalkulator_Page/K_zakatFidyah.dart';
import 'package:flutter_application_2/Kalkulator_Page/K_zakatHadiah.dart';
import 'package:flutter_application_2/Kalkulator_Page/K_zakatPenghasilan.dart';
import 'package:flutter_application_2/Kalkulator_Page/K_zakatPerak.dart';
import 'package:flutter_application_2/Kalkulator_Page/K_zakatPerniagaan.dart';
import 'package:flutter_application_2/Kalkulator_Page/K_zakatTabungan.dart';

class BelajarScreen extends StatelessWidget {
  const BelajarScreen({Key? key}) : super(key: key);
  static const route = "/Belajar";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Belajar Zakat",
            style: TextStyle(fontSize: 14),
          ),
          centerTitle: true,
          backgroundColor: Colors.lightGreen,
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              );
            },
          ),
        ),
        body: ListView(shrinkWrap: true, children: [
          CardList(name: "Pengertian Zakat", route: pengertianScreen.route),
          CardList(name: "Mengapa Wajib Zakat", route: WajibScreen.route),
          CardList(name: "Jenis Zakat", route: pengertianScreen.route),
          CardList(
            name: "Hukuman Bagi Orang yang Tidak Mau Berzakat",
            route: HukumanScreen.route,
          ),
          CardList(
            name: "Hukum Membayar Zakat Online",
            route: zakatOnlineScreen.route,
          ),
        ]));
  }
}
