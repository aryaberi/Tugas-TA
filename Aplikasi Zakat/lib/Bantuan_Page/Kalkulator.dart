import 'package:flutter/material.dart';
import '../Widget/Image_font_1.dart';
import 'package:flutter_application_2/Provider/itemLogin.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_2/LandingPage.dart';

class bantuanKalulatorScreen extends StatelessWidget {
  const bantuanKalulatorScreen({Key? key}) : super(key: key);

  static const route = "/bantuanKalulator";

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
                  "Cara Menghitung Zakat Mall",
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                    "1. Pilih menu Kalkulator pada dashboard seperti gambar berikut.",
                    style: TextStyle(fontSize: 14)),
                image_font_1(
                    imageurl:
                        "images/Bantuan_Zakat_Fitrah/kalkulator_zakat_1.jpg"),
                SizedBox(
                  height: 10,
                ),
                Text("2. Pilihlah jenis zakat yang mau dihitung",
                    style: TextStyle(fontSize: 14)),
                image_font_1(
                    imageurl:
                        "images/Bantuan_Zakat_Fitrah/kalkulator_zakat_2.jpg"),
                SizedBox(
                  height: 10,
                ),
                Text("3. Masukan data-data sesuai yang dinginkan apliaksi.",
                    style: TextStyle(fontSize: 14)),
                image_font_1(
                    imageurl:
                        "images/Bantuan_Zakat_Fitrah/kalkulator_zakat_3.jpg"),
                SizedBox(
                  height: 10,
                ),
                Text(
                    "4. Tekan tombol hitung, setelah itu anda akan diberitahu berapa besarnya jumlah zakat yang harus dikeluarkan",
                    style: TextStyle(fontSize: 14)),
                image_font_1(
                    imageurl:
                        "images/Bantuan_Zakat_Fitrah/kalkulator_zakat_4.jpg"),
                SizedBox(
                  height: 10,
                ),
                Text(
                    "5. Tekan tombol bayar apabila anda ingin langsung membayarkan zakat sesuai hasil perhitungan.",
                    style: TextStyle(fontSize: 14)),
              ]))
        ],
      ),
    );
  }
}
