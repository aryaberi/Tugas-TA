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
          Center(
              child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Wrap(
              spacing: 20,
              runSpacing: 20,
              children: [
                const CardListDashboard(
                  imageurl: "images/zakatFitrah.jpg",
                  title: "Bayar Zakat Fitrah",
                  nav: zakatFitrah_1Screen.route,
                ),
                SizedBox(
                  height: 160,
                  width: 160,
                  child: Card(
                      child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                                context, zakatMall_1Screen.route,
                                arguments: {
                                  "Zakat": "0",
                                  "Jenis": "belum",
                                });
                          },
                          child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 20, bottom: 20, left: 10, right: 10),
                              child: Column(children: <Widget>[
                                Container(
                                  height: 65,
                                  width: 65,
                                  color: Colors.white,
                                  // decoration: BoxDecoration(border: Border.all()),
                                  child: Image(
                                    fit: BoxFit.cover,
                                    image: AssetImage("images/zakatMall.png"),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Center(
                                  child: Text(
                                    "Bayar Zakat Mall",
                                    style: TextStyle(fontSize: 16),
                                    textAlign: TextAlign.right,
                                  ),
                                ),
                              ])))),
                ),
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
                )
              ],
            ),
          )),
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
    return SizedBox(
        height: 160,
        width: 160,
        child: Card(
            child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, nav);
                },
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 20, bottom: 20, left: 10, right: 10),
                  //     child: Center(
                  child: Column(children: <Widget>[
                    Container(
                      height: 65,
                      width: 65,
                      color: Colors.white,
                      // decoration: BoxDecoration(border: Border.all()),
                      child: Image(
                        fit: BoxFit.cover,
                        image: AssetImage(imageurl),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Text(
                        title,
                        style: TextStyle(fontSize: 16),
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ]),
                )))
        // )),
        );
  }
}
