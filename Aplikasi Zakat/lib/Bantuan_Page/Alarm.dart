import 'package:flutter/material.dart';
import '../Widget/Image_font_1.dart';
import 'package:flutter_application_2/Provider/itemLogin.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_2/LandingPage.dart';

class bantuanAlarmScreen extends StatelessWidget {
  const bantuanAlarmScreen({Key? key}) : super(key: key);

  static const route = "/bantuanAlarm";

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
              child: Column(children: [
                Text(
                  "Cara Memasang Alarm Zakat",
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "1. Pilih menu Alarm pada dashboard seperti gambar berikut.",
                  style: TextStyle(fontSize: 14),
                ),
                image_font_1(
                    imageurl: "images/Bantuan_Zakat_Fitrah/Alarm_1.jpg"),
                SizedBox(
                  height: 10,
                ),
                Text("2. Anda akan ditampilkan list alarm yang telah anda buat",
                    style: TextStyle(fontSize: 14)),
                SizedBox(
                  height: 10,
                ),
                Text(
                    "3. Apabila akan membuat laporan baru, tekan tombol + pada pojok kanan bawah layar seperti berikut....",
                    style: TextStyle(fontSize: 14)),
                image_font_1(
                    imageurl: "images/Bantuan_Zakat_Fitrah/Alarm_3.jpg"),
                SizedBox(
                  height: 10,
                ),
                Text(
                    "4. Pilih jenis zakat, serta masukan tanggal dan bulan pemyetelan alarm",
                    style: TextStyle(fontSize: 14)),
                image_font_1(
                    imageurl: "images/Bantuan_Zakat_Fitrah/Alarm_4.jpg"),
                SizedBox(
                  height: 10,
                ),
                Text("5. Tekan tombol setel untuk memasang alarm",
                    style: TextStyle(fontSize: 14)),
                image_font_1(
                    imageurl: "images/Bantuan_Zakat_Fitrah/Alarm_5.jpg"),
                SizedBox(
                  height: 10,
                ),
                Text(
                    "6. Apa bila anda ingin menghapus alarm tersebut, tekan icon delete pada pojok kanan alarm yang akan dihapus",
                    style: TextStyle(fontSize: 14)),
              ]))
        ],
      ),
    );
  }
}
