import 'package:flutter/material.dart';

class bantuanZMScreen extends StatelessWidget {
  const bantuanZMScreen({Key? key}) : super(key: key);

  static const route = "/bantuanZM";

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
            "Cara Membayar Zakat Mall",
            style: TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
              "1. Pilih menu bayar zakat fitrah pada dashboard seperti gambar berikut."),
          SizedBox(
            height: 10,
          ),
          Text(
              "2. Pada tampilan berikutt .... Pilih jenis zakat mall, LAZ dan juga metode pembayaran"),
          SizedBox(
            height: 10,
          ),
          Text(
              "3. Pada tampilan berikutt .... Masukan Nama dan juga jumlah orang yang akan dibayarkan zakatnya."),
          SizedBox(
            height: 10,
          ),
          Text(
              "4. Tekan Tombol bayar, setelah itu anda akan dibawa kehalaman konfiramsi, pastikan data yang telah dimasukan telah sesuai"),
          SizedBox(
            height: 10,
          ),
          Text(
              "5. Baca niat membayar zakat apabila sudah merasa ok, dan tekan tombol lanjutkan ."),
          SizedBox(
            height: 10,
          ),
          Text(
              "6. Apabila anda memilih metode pemabyaran dengan metode e-money seperti Ovo atau Gopay, silahkan memasukan no hp yang terhubung pada akun e-money tersebut, dan menekan tombol bayar"),
          SizedBox(
            height: 10,
          ),
          Text(
              "7. Apabila anda memilih metode pembayaran secara tranfer atm maupun Mbking, silahkan tranferkan uang anda pada rekening yang diberikan dan menekan tombol konfirmasi."),
          Text(
              "8. Selamat anda telah berhasil melakukan pembayaran zakat mall."),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
