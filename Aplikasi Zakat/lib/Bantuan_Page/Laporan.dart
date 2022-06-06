import 'package:flutter/material.dart';

class bantuanLaporanScreen extends StatelessWidget {
  const bantuanLaporanScreen({Key? key}) : super(key: key);

  static const route = "/bantuanLaporan";

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
            "Cara Melihat Laporan zakat",
            style: TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20,
          ),
          Text("1. Pilih menu Laporan pada dashboard seperti gambar berikut."),
          SizedBox(
            height: 10,
          ),
          Text(
              "2. Anda akan diperlihatkan tabel yang berisikan laporan pembayaran zakat anda selama ini"),
          SizedBox(
            height: 10,
          ),
          Text(
              "3. Tekan tulisan rincian untuk mengetahui lebih lanjut detai laporan dan juga apabila ingin mengunduh laporan."),
        ],
      ),
    );
  }
}
