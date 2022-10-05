import 'package:flutter/material.dart';
import 'package:flutter_application_2/Widget/image_font_2.dart';
import '../Widget/Image_font_1.dart';
import 'package:flutter_application_2/Provider/itemLogin.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_2/LandingPage.dart';


class bantuanZMScreen extends StatelessWidget {
  const bantuanZMScreen({Key? key}) : super(key: key);

  static const route = "/bantuanZM";

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
            child: Column(
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
              "1. Pilih menu bayar zakat fitrah pada dashboard seperti gambar berikut.",
              style: TextStyle(fontSize: 14)),
          image_font_1(
              imageurl: "images/Bantuan_Zakat_Fitrah/bayar_zakat_mall_1.jpg"),
          SizedBox(
            height: 10,
          ),
          Text(
              "2. Pada tampilan berikutt  Pilih jenis zakat mall, LAZ dan juga metode pembayaran",
              style: TextStyle(fontSize: 14)),
          image_font_1(
              imageurl: "images/Bantuan_Zakat_Fitrah/bayar_zakat_mall_2.jpg"),
          SizedBox(
            height: 10,
          ),
          Text(
              "3. Pada tampilan berikutt  Masukan Nama dan juga jumlah uang yang akan dibayarkan zakatnya.",
              style: TextStyle(fontSize: 14)),
          image_font_1(
              imageurl: "images/Bantuan_Zakat_Fitrah/bayar_zakat_mall_3.jpg"),
          SizedBox(
            height: 10,
          ),
          Text(
              "4. Tekan Tombol lanjutkan, setelah itu anda akan dibawa kehalaman konfiramsi, pastikan data yang telah dimasukan telah sesuai",
              style: TextStyle(fontSize: 14)),
          image_font_1(
              imageurl: "images/Bantuan_Zakat_Fitrah/bayar_zakat_mall_4.jpg"),
          SizedBox(
            height: 10,
          ),
          Text(
              "5. Baca niat membayar zakat apabila sudah merasa ok, dan tekan tombol lanjutkan .",
              style: TextStyle(fontSize: 14)),
          image_font_1(
              imageurl: "images/Bantuan_Zakat_Fitrah/bayar_zakat_mall_5.jpg"),
          SizedBox(
            height: 10,
          ),
          Text(
              "6. Apabila anda memilih metode pemabyaran dengan metode e-money seperti Ovo atau Gopay, silahkan memasukan no hp yang terhubung pada akun e-money tersebut, dan menekan tombol bayar",
              style: TextStyle(fontSize: 14)),
          image_font_2(
              imageurl: "images/Bantuan_Zakat_Fitrah/bayar_zakat_mall_6.jpg"),
          SizedBox(
            height: 10,
          ),
          Text("7. Setelah itu masukan PIN dari akun e-money anda.",
              style: TextStyle(fontSize: 14)),
          image_font_1(
              imageurl: "images/Bantuan_Zakat_Fitrah/bayar_zakat_mall_9.jpg"),
          SizedBox(
            height: 10,
          ),
          Text(
              "8. Apabila anda memilih metode pembayaran secara tranfer atm maupun Mbking, silahkan tranferkan uang anda pada rekening yang diberikan dan menekan tombol konfirmasi.",
              style: TextStyle(fontSize: 14)),
          image_font_1(
              imageurl: "images/Bantuan_Zakat_Fitrah/bayar_zakat_mall_10.jpg"),
          SizedBox(
            height: 10,
          ),
          Text(
              "9. Selamat anda telah berhasil melakukan pembayaran zakat mall.",
              style: TextStyle(fontSize: 14)),
          image_font_1(
              imageurl: "images/Bantuan_Zakat_Fitrah/bayar_zakat_mall_8.jpg"),
          SizedBox(
            height: 10,
          ),
        ]))],
      ),
    );
  }
}
