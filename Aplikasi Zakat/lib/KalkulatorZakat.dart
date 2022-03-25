import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_2/Widget/CardList.dart';
import 'package:flutter_application_2/Kalkulator_Page/K_zakatEmas.dart';
import 'package:flutter_application_2/Kalkulator_Page/K_zakatFidyah.dart';
import 'package:flutter_application_2/Kalkulator_Page/K_zakatHadiah.dart';
import 'package:flutter_application_2/Kalkulator_Page/K_zakatPenghasilan.dart';
import 'package:flutter_application_2/Kalkulator_Page/K_zakatPerak.dart';
import 'package:flutter_application_2/Kalkulator_Page/K_zakatPerniagaan.dart';
import 'package:flutter_application_2/Kalkulator_Page/K_zakatTabungan.dart';

class KalkulatorScreen extends StatelessWidget {
  const KalkulatorScreen({Key? key}) : super(key: key);
  static const route = "/Kalkulator";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            " Zakat",
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
              name: "Zakat Pendapatan",
              route: kalkulatorZPendapatanScreen.route),
          CardList(
              name: "Zakat Tabungan", route: kalkulatorZTabunganScreen.route),
          CardList(
              name: "Zakat Perniagaan",
              route: kalkulatorZPerniagaanScreen.route),
          CardList(
            name: "Zakat Emas",
            route: kalkulatorZEmasScreen.route,
          ),
          CardList(
            name: "Zakat Perak",
            route: kalkulatorZPerakScreen.route,
          ),
          CardList(
            name: "Zakat Hadiah",
            route: kalkulatorZHadiahScreen.route,
          ),
          CardList(
            name: "Zakat Fidyah",
            route: kalkulatorZFidyahScreen.route,
          ),
        ]));
  }
}
