import 'package:flutter/material.dart';
import 'package:flutter_application_2/AlarmScreen.dart';
import 'package:flutter_application_2/LoginScreen.dart';
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
    final userName = ModalRoute.of(context)!.settings.arguments as String;
    String Nama = userName;
    return Scaffold(
        appBar: AppBar(
          title: Text("ZOI"),
          centerTitle: true,
          backgroundColor: Colors.lightGreen,
          leadingWidth: 200,
          leading: Builder(
            builder: (BuildContext context) {
              return Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(children: [
                  CircleAvatar(child: Icon(Icons.person)),
                  TextButton(
                    style: TextButton.styleFrom(primary: Colors.white),
                    child: Text(userName),
                    onPressed: () {
                      Navigator.pushNamed(context, LoginScreen.route);
                    },
                  )
                ]),
              );
            },
          ),
          actions: [
            IconButton(
              icon: CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage("images/bantuan.png")),
              iconSize: 50,
              onPressed: () {
                Navigator.pushNamed(context, BantuanScreen.route);
              },
            )
          ],
        ),
        body: ListView(children: [
          Center(
              child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Wrap(
              spacing: 20,
              runSpacing: 20,
              children: [
                CardListDashboard2(
                  imageurl: "images/zakatFitrah.jpg",
                  title: "Bayar Zakat Fitrah",
                  nav: zakatFitrah_1Screen.route,
                  argumen: Nama,
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
                                  "usernama": Nama,
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
                CardListDashboard2(
                  imageurl: "images/kalkulator.png",
                  title: "Hitung Zakat Mall",
                  nav: KalkulatorScreen.route,
                  argumen: Nama,
                ),
                CardListDashboard2(
                  imageurl: "images/laporan.png",
                  title: "Laporan Zakat",
                  nav: DataTableSample.route,
                  argumen: Nama,
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
                        style: TextStyle(fontSize: 14),
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ]),
                )))
        // )),
        );
  }
}

class CardListDashboard2 extends StatelessWidget {
  final String imageurl;
  final String title;
  final String nav;
  dynamic argumen;

  CardListDashboard2({
    Key? key,
    required this.imageurl,
    required this.title,
    required this.nav,
    this.argumen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 160,
        width: 160,
        child: Card(
            child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, nav, arguments: argumen);
                  // Navigator.pushNamed(context, DashboardScreen.route,
                  //           arguments: userName);
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
                        style: TextStyle(fontSize: 14),
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ]),
                )))
        // )),
        );
  }
}
