import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/AlarmScreen.dart';
import 'package:flutter_application_2/Bantuan.dart';
import 'package:flutter_application_2/LoginScreen.dart';
import 'package:flutter_application_2/belajarZakat.dart';
import 'package:flutter_application_2/Belajar_Page/WajibZakat.dart';
import 'package:flutter_application_2/Belajar_Page/jenisZakat.dart';
import 'package:flutter_application_2/Belajar_Page/ZakatOnline.dart';

import 'package:provider/provider.dart';

import 'Provider/User.dart';

class LandingPageScreen extends StatefulWidget {
  const LandingPageScreen({Key? key}) : super(key: key);
  static const route = "/Landing";
  @override
  _LandingPageScreenState createState() => _LandingPageScreenState();
}

final List<Map> imgList = [
  {"id": "1", "image": "images/Bayar.jpg", "route": WajibScreen.route},
  {"id": "2", "image": "images/Hukum.png", "route": zakatOnlineScreen.route},
  {"id": "3", "image": "images/jenis.jpg", "route": jenisZakatScreen.route}
];

class _LandingPageScreenState extends State<LandingPageScreen> {
  @override
  bool isWrong = false;
  bool _passwordVisible = false;
  String Nama = "";
  String Pass = "";
  final CarouselController _controller = CarouselController();

  // changePass(String Nama) {
  //   // setState(() {
  //   //   _passwordVisible = !_passwordVisible;
  //   // });
  //   print(Nama);
  // }

  Widget build(BuildContext context) {
    final user = Provider.of<dataUser>(context);
    final _users = user.allItems;
    String userName = "";
    bool isTrue = false;
    int _current = 0;

    // void _toggle() {
    //   setState(() {
    //     print(_obscureText);
    //     _obscureText = !_obscureText;
    //     print(_obscureText);
    //   });
    // }
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
        // resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text("ZOI"),
          leading: Container(),
          centerTitle: true,
          backgroundColor: Colors.lightGreen,
        ),
        body:
            ListView(physics: const AlwaysScrollableScrollPhysics(), children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Text(
                  "Selamat datang di ZOI. Aplikasi pembayaran zakat online yang telah mendapat lisensi dari MUI",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.center,
                ),

                //   ],
                // )
              ],
            ),
          ),
          Center(
              child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(children: [
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
                Row(
                  children: [
                    Text("Silahkan"),
                    TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, LoginScreen.route);
                        },
                        child: Text("Login")),
                    Text("jika ingin mengakses full aplikasi"),
                  ],
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
