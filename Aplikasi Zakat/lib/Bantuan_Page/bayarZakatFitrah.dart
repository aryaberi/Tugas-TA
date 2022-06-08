import 'package:flutter/material.dart';

import '../Widget/Image_font_1.dart';
import '../Widget/image_font_2.dart';

class bantuanZFScreen extends StatelessWidget {
  const bantuanZFScreen({Key? key}) : super(key: key);

  static const route = "/bantuanZF";

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
            "Cara Membayar Zakat Fitrah",
            style: TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
              "1. Pilih menu bayar zakat fitrah pada dashboard seperti gambar berikut."),
          SizedBox(height: 30),
          image_font_1(
              imageurl: "images/Bantuan_Zakat_Fitrah/bayarzakatfitrah_1.jpg"),
          SizedBox(
            height: 30,
          ),
          Text(
              "2. Pada tampilan berikutt ini Pilih LAZ dan juga metode pembayaran"),
          image_font_2(
              imageurl: "images/Bantuan_Zakat_Fitrah/bayarzakatfitrah_2.jpg"),
          SizedBox(
            height: 10,
          ),
          Text(
              "3. Pada tampilan berikutt ini Masukan Nama dan juga jumlah orang yang akan dibayarkan zakatnya."),
          image_font_2(
              imageurl: "images/Bantuan_Zakat_Fitrah/bayarzakatfitrah_3.jpg"),
          SizedBox(
            height: 10,
          ),
          Text(
              "4. Tekan Tombol bayar, setelah itu anda akan dibawa kehalaman konfiramsi, pastikan data yang telah dimasukan telah sesuai"),
          image_font_1(
              imageurl: "images/Bantuan_Zakat_Fitrah/bayarzakatfitrah_4.jpg"),
          SizedBox(
            height: 10,
          ),
          Text(
              "5. Baca niat membayar zakat apabila sudah merasa ok, dan tekan tombol lanjutkan ."),
          image_font_1(
              imageurl: "images/Bantuan_Zakat_Fitrah/bayarzakatfitrah_5.jpg"),
          SizedBox(
            height: 10,
          ),
          Text(
              "6. Apabila anda memilih metode pemabyaran dengan metode e-money seperti Ovo atau Gopay, silahkan memasukan no hp yang terhubung pada akun e-money tersebut, dan menekan tombol bayar"),
          image_font_1(
              imageurl: "images/Bantuan_Zakat_Fitrah/bayarzakatfitrah_7.jpg"),
          SizedBox(
            height: 10,
          ),
          Text(
              "7. Apabila anda memilih metode pembayaran secara tranfer atm maupun Mbking, silahkan tranferkan uang anda pada rekening yang diberikan dan menekan tombol konfirmasi."),
          SizedBox(
            height: 10,
          ),
          Text(
              "8. Selamat anda telah berhasil melakukan pembayaran zakat fitrah."),
        ],
      ),
    );
  }
}
