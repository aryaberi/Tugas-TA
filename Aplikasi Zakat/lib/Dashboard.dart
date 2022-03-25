import 'package:flutter/material.dart';
import 'package:flutter_application_2/AlarmScreen.dart';
import 'package:flutter_application_2/belajarZakat.dart';
import 'package:flutter_application_2/Bantuan.dart';
import 'package:flutter_application_2/DataTableSample.dart';
import 'package:flutter_application_2/KalkulatorZakat.dart';
import 'package:flutter_application_2/LaporanScreen.dart';
import 'package:flutter_application_2/zakatFitrah_1Screen.dart';
import 'package:flutter_application_2/zakatMall_1Screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);
  static const route = "Dashboard";
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("ZOI"),
          backgroundColor: Colors.lightGreen,
          actions: [CircleAvatar(child: Icon(Icons.person))],
        ),
        body: ListView(children: [
          const CardListDashboard(
            imageurl: "images/zakatFitrah.jpg",
            title: "Bayar Zakat Fitrah",
            nav: zakatFitrah_1Screen.route,
          ),
          Card(
              child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, zakatMall_1Screen.route,
                        arguments: "0");
                  },
                  child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(children: <Widget>[
                        Container(
                          height: 50,
                          width: 50,
                          color: Colors.white,
                          // decoration: BoxDecoration(border: Border.all()),
                          child: Image(
                            fit: BoxFit.cover,
                            image: AssetImage("images/zakatMall.png"),
                          ),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Center(
                          child: Text(
                            "Bayar Zakat Mall",
                            style: TextStyle(fontSize: 20),
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ])))),
          const CardListDashboard(
            imageurl: "images/kalkulator.png",
            title: "Hitung Zakat Mall",
            nav: KalkulatorScreen.route,
          ),
          const CardListDashboard(
            imageurl: "images/laporan.png",
            title: "Laporan Zakat",
            nav: DataTableSample.route,
          ),
          const CardListDashboard(
            imageurl: "images/alarm.png",
            title: "Pasang Alarm",
            nav: AlarmScrenn.route,
          ),
          const CardListDashboard(
            imageurl: "images/belajar.png",
            title: "Belajar Zakat",
            nav: BelajarScreen.route,
          ),
          const CardListDashboard(
            imageurl: "images/bantuan.png",
            title: "Bantuan",
            nav: BantuanScreen.route,
          ),
        ]));
  }
}

class CardListDashboard extends StatelessWidget {
  final String imageurl;
  final String title;
  final String nav;

  const CardListDashboard({
    Key? key,
    required this.imageurl,
    required this.title,
    required this.nav,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: InkWell(
            onTap: () {
              Navigator.pushNamed(context, nav);
            },
            child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(children: <Widget>[
                  Container(
                    height: 50,
                    width: 50,
                    color: Colors.white,
                    // decoration: BoxDecoration(border: Border.all()),
                    child: Image(
                      fit: BoxFit.cover,
                      image: AssetImage(imageurl),
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Center(
                    child: Text(
                      title,
                      style: TextStyle(fontSize: 20),
                      textAlign: TextAlign.right,
                    ),
                  ),
                ]))));
  }
}
