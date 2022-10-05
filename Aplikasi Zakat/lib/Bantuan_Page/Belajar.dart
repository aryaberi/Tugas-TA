import 'package:flutter/material.dart';
import '../Widget/Image_font_1.dart';
import 'package:flutter_application_2/Provider/itemLogin.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_2/LandingPage.dart';


class bantuanBelajarScreen extends StatelessWidget {
  const bantuanBelajarScreen({Key? key}) : super(key: key);

  static const route = "/bantuanBelajar";

  @override
  Widget build(BuildContext context) {
    final login = Provider.of<itemLogin>(context);
    final _login = login.allItems;
    return Scaffold(
      appBar: AppBar(
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
        actions: [
          _login.isEmpty
              ? SizedBox()
              : TextButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                                // title: const Text('Hapus Alarm'),
                                content:
                                    Text("Yakin ingin keluar dari aplikasi ?"),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(context, 'Cancel'),
                                    child: const Text('Tidak'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      login.delete();
                                      Navigator.pushNamed(
                                          context, LandingPageScreen.route);
                                    },
                                    child: Text("Ya"),
                                  )
                                ]));
                  },
                  child: Text(
                    "Keluar",
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xffffffff),
                    ),
                  )),
        ],
      ),
      body: ListView(
        children: [
          Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                "Cara Belajar Zakat",
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              )),
          Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                        "1. Pilih menu belajar pada dashboard seperti gambar berikut.",
                        style: TextStyle(fontSize: 14)),
                    image_font_1(
                        imageurl: "images/Bantuan_Zakat_Fitrah/belajar_1.jpg"),
                    SizedBox(
                      height: 10,
                    ),
                    Text("2. Pilih topik yang ingin dipelajari",
                        style: TextStyle(fontSize: 14)),
                    image_font_1(
                      imageurl: "images/Bantuan_Zakat_Fitrah/belajar_2.jpg",
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("3. Selamat belajar.", style: TextStyle(fontSize: 14)),
                    image_font_1(
                      imageurl: "images/Bantuan_Zakat_Fitrah/belajar_3.jpg",
                    ),
                  ]))
        ],
      ),
    );
  }
}
