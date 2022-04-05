import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_2/Bantuan_Page/Alarm.dart';
import 'package:flutter_application_2/Bantuan_Page/Belajar.dart';
import 'package:flutter_application_2/Bantuan_Page/Kalkulator.dart';
import 'package:flutter_application_2/Bantuan_Page/Laporan.dart';
import 'package:flutter_application_2/Bantuan_Page/bayarZakatFitrah.dart';
import 'package:flutter_application_2/Bantuan_Page/bayarZakatMal.dart';
import 'package:flutter_application_2/Widget/CardList.dart';
import 'package:flutter_application_2/Kalkulator_Page/K_zakatEmas.dart';
import 'package:flutter_application_2/Kalkulator_Page/K_zakatFidyah.dart';
import 'package:flutter_application_2/Kalkulator_Page/K_zakatHadiah.dart';
import 'package:flutter_application_2/Kalkulator_Page/K_zakatPenghasilan.dart';
import 'package:flutter_application_2/Kalkulator_Page/K_zakatPerak.dart';
import 'package:flutter_application_2/Kalkulator_Page/K_zakatPerniagaan.dart';
import 'package:flutter_application_2/Kalkulator_Page/K_zakatTabungan.dart';

class BantuanScreen extends StatelessWidget {
  const BantuanScreen({Key? key}) : super(key: key);
  static const route = "/Bantuan";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Bantuan Penggunaan",
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
          actions: [Icon(Icons.home)],
        ),
        body: ListView(shrinkWrap: true, children: [
          CardList(
              name: "Cara Membayar Zakat Fitrah", route: bantuanZFScreen.route),
          CardList(
              name: "Cara Membayar Zakat Mall", route: bantuanZMScreen.route),
          CardList(
              name: "Cara Menghitung Zakat",
              route: bantuanKalulatorScreen.route),
          CardList(
              name: "Cara Melihat Laporan", route: bantuanLaporanScreen.route),
          CardList(
            name: "Cara Memasang Alarm",
            route: bantuanAlarmScreen.route,
          ),
          CardList(
            name: "Cara Belajar Zakat",
            route: bantuanBelajarScreen.route,
          ),
        ]));
  }
}
