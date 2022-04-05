import 'package:flutter/material.dart';

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
        actions: [Icon(Icons.home)],
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
          SizedBox(
            height: 10,
          ),
          Text("2. Pilihlah jenis zakat yang mau dihitung"),
          SizedBox(
            height: 10,
          ),
          Text("3. Masukan data-data sesuai yang dinginkan apliaksi."),
          SizedBox(
            height: 10,
          ),
          Text(
              "4. Tekan tombol hitung, setelah itu anda akan diberitahu berapa besarnya jumlah zakat yang harus dikeluarkan"),
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
