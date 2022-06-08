import 'package:flutter/material.dart';
import 'package:flutter_application_2/Widget/image_font_2.dart';

import '../Widget/Image_font_1.dart';

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
          image_font_1(
              imageurl: "images/Bantuan_Zakat_Fitrah/bayar_zakat_mall_1.jpg"),
          SizedBox(
            height: 10,
          ),
          Text(
              "2. Pada tampilan berikutt  Pilih jenis zakat mall, LAZ dan juga metode pembayaran"),
          image_font_1(
              imageurl: "images/Bantuan_Zakat_Fitrah/bayar_zakat_mall_2.jpg"),
          SizedBox(
            height: 10,
          ),
          Text(
              "3. Pada tampilan berikutt  Masukan Nama dan juga jumlah uang yang akan dibayarkan zakatnya."),
          image_font_1(
              imageurl: "images/Bantuan_Zakat_Fitrah/bayar_zakat_mall_3.jpg"),
          SizedBox(
            height: 10,
          ),
          Text(
              "4. Tekan Tombol lanjutkan, setelah itu anda akan dibawa kehalaman konfiramsi, pastikan data yang telah dimasukan telah sesuai"),
          image_font_1(
              imageurl: "images/Bantuan_Zakat_Fitrah/bayar_zakat_mall_4.jpg"),
          SizedBox(
            height: 10,
          ),
          Text(
              "5. Baca niat membayar zakat apabila sudah merasa ok, dan tekan tombol lanjutkan ."),
          image_font_1(
              imageurl: "images/Bantuan_Zakat_Fitrah/bayar_zakat_mall_5.jpg"),
          SizedBox(
            height: 10,
          ),
          Text(
              "6. Apabila anda memilih metode pemabyaran dengan metode e-money seperti Ovo atau Gopay, silahkan memasukan no hp yang terhubung pada akun e-money tersebut, dan menekan tombol bayar"),
          image_font_2(
              imageurl: "images/Bantuan_Zakat_Fitrah/bayar_zakat_mall_6.jpg"),
          SizedBox(
            height: 10,
          ),
          Text(
              "7. Apabila anda memilih metode pembayaran secara tranfer atm maupun Mbking, silahkan tranferkan uang anda pada rekening yang diberikan dan menekan tombol konfirmasi."),
          // image_font_1(imageurl: "images/Bantuan_Zakat_Fitrah/bayar_zakat_mall_7.jpg"),
          Text(
              "8. Selamat anda telah berhasil melakukan pembayaran zakat mall."),
          image_font_1(
              imageurl: "images/Bantuan_Zakat_Fitrah/bayar_zakat_mall_8.jpg"),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
