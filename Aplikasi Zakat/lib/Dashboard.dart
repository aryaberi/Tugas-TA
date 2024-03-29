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
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_application_2/Belajar_Page/jenisZakat.dart';
import 'package:flutter_application_2/Belajar_Page/WajibZakat.dart';
import 'package:flutter_application_2/Belajar_Page/ZakatOnline.dart';

final List<Map> imgList = [
  {"id": "1", "image": "images/Bayar.jpg", "route": WajibScreen.route},
  {"id": "2", "image": "images/Hukum.png", "route": zakatOnlineScreen.route},
  {"id": "3", "image": "images/jenis.jpg", "route": jenisZakatScreen.route}
];

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);
  static const route = "Dashboard";
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    final userName = ModalRoute.of(context)!.settings.arguments as String;
    String Nama = userName;
    final List<Widget> imageSliders = imgList
        .map((item) => InkWell(
              splashColor: Colors.white,
              onTap: () {
                Navigator.pushNamed(
                  context,
                  item["route"],
                );
              },
              child: Container(
                margin: EdgeInsets.all(5.0),
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    child: Stack(
                      children: <Widget>[
                        Image.asset(item["image"],
                            fit: BoxFit.cover, width: 1000.0),
                        Positioned(
                          bottom: 0.0,
                          left: 0.0,
                          right: 0.0,
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color.fromARGB(200, 0, 0, 0),
                                  Color.fromARGB(0, 0, 0, 0)
                                ],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                              ),
                            ),
                            padding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 20.0),
                          ),
                        ),
                      ],
                    )),
              ),
            ))
        .toList();

    return Scaffold(
        appBar: AppBar(
          title: Text("ZOI", style: TextStyle(fontSize: 30)),
          centerTitle: true,
          backgroundColor: Colors.lightGreen,
          leadingWidth: 300,
          leading: Builder(
            builder: (BuildContext context) {
              return Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(children: [
                  CircleAvatar(child: Icon(Icons.person)),
                  TextButton(
                    style: TextButton.styleFrom(primary: Colors.white),
                    child: Text(userName,
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.bold)),
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
            child:Row(children: [
            Expanded(
              child: CarouselSlider(
                items: imageSliders,
                carouselController: _controller,
                options: CarouselOptions(
                    autoPlay: true,
                    enlargeCenterPage: true,
                    aspectRatio: 2.0,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _current = index;
                      });
                    }),
              ),
            )
          ]))),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: imgList.asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () => _controller.animateToPage(entry.key),
                child: Container(
                  width: 12.0,
                  height: 12.0,
                  margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: (Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : Colors.black)
                          .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                ),
              );
            }).toList(),
          ),
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
                  height: 100,
                  width: 100,
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
                                  top: 5, bottom: 5, left: 5, right: 5),
                              child: Column(children: <Widget>[
                                Container(
                                  height: 65,
                                  width: 65,
                                  color: Colors.white,
                                  // decoration: BoxDecoration(border: Border.all()),
                                  child: Image(
                                    fit: BoxFit.cover,
                                    image: AssetImage("images/zakatMall.png"),
                                    height: 20,
                                    width: 20,
                                  ),
                                ),
                                // SizedBox(
                                //   height: 20,
                                // ),
                                Center(
                                  child: Text(
                                    "Bayar Zakat Mall",
                                    style: TextStyle(fontSize: 9),
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
        height: 100,
        width: 100,
        child: Card(
            child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, nav);
                },
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 5, bottom: 5, left: 5, right: 5),
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
                          height: 20,
                          width: 20),
                    ),
                    // SizedBox(
                    //   height: 5,
                    // ),
                    Center(
                      child: Text(
                        title,
                        style: TextStyle(fontSize: 9),
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
        height: 100,
        width: 100,
        child: Card(
            child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, nav, arguments: argumen);
                  // Navigator.pushNamed(context, DashboardScreen.route,
                  //           arguments: userName);
                },
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 5, bottom: 5, left: 5, right: 5),
                  //     child: Center(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          height: 65,
                          width: 65,
                          color: Colors.white,
                          // decoration: BoxDecoration(border: Border.all()),
                          child: Image(
                              fit: BoxFit.cover,
                              image: AssetImage(imageurl),
                              height: 20,
                              width: 20),
                        ),
                        // SizedBox(
                        //   height: 20,
                        // ),
                        Center(
                          child: Text(
                            title,
                            style: TextStyle(fontSize: 9),
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ]),
                )))
        // )),
        );
  }
}
