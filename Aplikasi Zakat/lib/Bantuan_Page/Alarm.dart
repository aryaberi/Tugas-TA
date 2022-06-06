import 'package:flutter/material.dart';

class bantuanAlarmScreen extends StatelessWidget {
  const bantuanAlarmScreen({Key? key}) : super(key: key);

  static const route = "/bantuanAlarm";

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
            "Cara Memasang Alarm Zakat",
            style: TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20,
          ),
          Text("1. Pilih menu Alarm pada dashboard seperti gambar berikut."),
          SizedBox(
            height: 10,
          ),
          Text("2. Anda akan ditampilkan list alarm yang telah anda buat"),
          SizedBox(
            height: 10,
          ),
          Text(
              "3. Apabila akan membuat laporan baru, tekan tombol + pada pojok kanan bawah layar seperti berikut...."),
          SizedBox(
            height: 10,
          ),
          Text(
              "4. Pilih jenis zakat, serta masukan tanggal dan bulan pemyetelan alarm"),
          SizedBox(
            height: 10,
          ),
          Text("5. Tekan tombol setel untuk memasang alarm ."),
          SizedBox(
            height: 10,
          ),
          Text(
              "6. Apa bila anda ingin menghapus alarm tersebut, tekan icon delete pada pojok kanan alarm yang akan dihapus"),
        ],
      ),
    );
  }
}
