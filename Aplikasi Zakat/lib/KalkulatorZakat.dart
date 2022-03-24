import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_2/KalkulatorZHarta.dart';
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
            "Kalkulator Zakat",
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
          CardListKalkulator(
              name: "Zakat Pendapatan",
              route: kalkulatorZPendapatanScreen.route),
          CardListKalkulator(
              name: "Zakat Tabungan", route: kalkulatorZTabunganScreen.route),
          CardListKalkulator(
              name: "Zakat Perniagaan",
              route: kalkulatorZPerniagaanScreen.route),
          CardListKalkulator(
            name: "Zakat Emas",
            route: kalkulatorZEmasScreen.route,
          ),
          CardListKalkulator(
            name: "Zakat Perak",
            route: kalkulatorZPerakScreen.route,
          ),
          CardListKalkulator(
            name: "Zakat Hadiah",
            route: kalkulatorZHadiahScreen.route,
          ),
          CardListKalkulator(
            name: "Zakat Fidyah",
            route: kalkulatorZFidyahScreen.route,
          ),
        ]));
  }
}

class CardListKalkulator extends StatelessWidget {
  final String name;
  final String route;
  const CardListKalkulator({
    Key? key,
    required this.name,
    required this.route,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.5),
      child: Card(
          child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, route);
          print("klik");
        },
        child: ListTile(
          title: Text(name),
          trailing: Icon(Icons.arrow_right),
        ),
      )),
    );
  }
}
