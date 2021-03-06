import 'package:flutter/material.dart';

import '../Widget/Image_font_1.dart';

class bantuanKalulatorScreen extends StatelessWidget {
  const bantuanKalulatorScreen({Key? key}) : super(key: key);

  static const route = "/bantuanKalulator";

  @override
  Widget build(BuildContext context) {
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
      ),
      body: ListView(
        children: [
          Text(
            "Cara Menghitung Zakat Mall",
            style: TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
              "1. Pilih menu Kalkulator pada dashboard seperti gambar berikut."),
          image_font_1(
              imageurl: "images/Bantuan_Zakat_Fitrah/kalkulator_zakat_1.jpg"),
          SizedBox(
            height: 10,
          ),
          Text("2. Pilihlah jenis zakat yang mau dihitung"),
          image_font_1(
              imageurl: "images/Bantuan_Zakat_Fitrah/kalkulator_zakat_2.jpg"),
          SizedBox(
            height: 10,
          ),
          Text("3. Masukan data-data sesuai yang dinginkan apliaksi."),
          image_font_1(
              imageurl: "images/Bantuan_Zakat_Fitrah/kalkulator_zakat_3.jpg"),
          SizedBox(
            height: 10,
          ),
          Text(
              "4. Tekan tombol hitung, setelah itu anda akan diberitahu berapa besarnya jumlah zakat yang harus dikeluarkan"),
          image_font_1(
              imageurl: "images/Bantuan_Zakat_Fitrah/kalkulator_zakat_4.jpg"),
          SizedBox(
            height: 10,
          ),
          Text(
              "5. Tekan tombol bayar apabila anda ingin langsung membayarkan zakat sesuai hasil perhitungan."),
        ],
      ),
    );
  }
}
