import 'package:flutter/material.dart';

class zakatOnlineScreen extends StatelessWidget {
  const zakatOnlineScreen({Key? key}) : super(key: key);

  static const route = "/ZakatOnline";
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
            "Bagaimana Hukum Membayar Zakat Secara Online ?",
            style: TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
              "Bagaimana hukumnya pembayaran zakat menggunakan metode online ini? Apakah sah?"),
          SizedBox(
            height: 10,
          ),
          Text(
              "Menanggapi hal tersebut Pengamat Ekonomi Syariah IPB, Irfan Syauqi Beik mengungkapkan pembayaran zakat baik maal dan fitrah dengan metode online itu sah. Hal ini karena pada dasarnya ijab qabul dalam zakat mengalami perubahan dan perkembangan metode pembayaran."),
          SizedBox(
            height: 10,
          ),
          Text(
              "Intinya sama, ada proses yang memastikan bahwa antara pihak yang satu dan yang lain memiliki kesepahaman dalam proses tersebut, kata dia kepada detikcom, Sabtu (1/5/2021)."),
        ],
      ),
    );
  }
}
