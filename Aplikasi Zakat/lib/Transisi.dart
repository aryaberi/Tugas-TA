import 'package:flutter/material.dart';
import 'package:flutter_application_2/Dashboard.dart';

class TransisiScreen extends StatelessWidget {
  const TransisiScreen({Key? key}) : super(key: key);
  static const route = "/Transisi";

  @override
  Widget build(BuildContext context) {
    final userName = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.lightGreen,
      //   leading: Builder(
      //     builder: (BuildContext context) {
      //       return IconButton(
      //         icon: const Icon(Icons.arrow_back),
      //         onPressed: () {
      //           Navigator.pop(context);
      //         },
      //       );
      //     },
      //   ),
      // ),
      body: ListView(
        children: [
          CircleAvatar(
              radius: 90, backgroundImage: AssetImage("images/bayarZakat.jpg")),
          SizedBox(height: 20),
          Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Column(
                children: [
                  Text(
                    "Zakat merupakan rukun islam yang ketiga, sebagai salah satu rukun islam maka orang yang mampu namun tidak melaksanakan nya tetunya akan mendapatkan dosa serta terancam masuk ke dalam neraka.",
                    style: TextStyle(fontSize: 14),
                    textAlign: TextAlign.justify,
                  ),
                  Text(
                    "Zakat sendiri terdiri atas dua jenis, yaitu zakat fitrah yaitu zakat yang wajib dikeluarkan semua orang beragama islam yang hidup pada bulan ramdhan, serta zakat mall zakat bagi orang-orang yang telah memenuhi nizab dan haul.",
                    style: TextStyle(fontSize: 14),
                    textAlign: TextAlign.justify,
                  ),
                  Text(
                    "Membayar zakat secara online tentunya diperbolehkan selama rukun-rukun zakat lainya terpenuhi, karena pembayaran secara online hanyalah sebuah metode, untuk belajar lebih mengenai zakat anda bisa menggunakan fitur belajar pada aplikasi ini.",
                    style: TextStyle(fontSize: 14),
                    textAlign: TextAlign.justify,
                  ),
                ],
              )),
          SizedBox(height: 20),
          SizedBox(
            width: 10,
            height: 50,
            child: Card(
                color: Colors.lightGreen,
                child: Container(
                    child: InkWell(
                  splashColor: Colors.white,
                  onTap: () {
                    Navigator.pushNamed(context, DashboardScreen.route,
                        arguments: userName);
                  },
                  child: Center(
                    child: Text(
                      "Lanjutkan",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ))),
          )
        ],
      ),
    );
  }
}
