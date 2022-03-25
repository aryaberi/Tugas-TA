import 'package:flutter/material.dart';

class jenisZakatScreen extends StatelessWidget {
  const jenisZakatScreen({Key? key}) : super(key: key);

  static const route = "/jenisZakat";

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
            "Jenis Zakat",
            style: TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
              "Zakat terbagi menjadi dua, yakni zakat mal atau zakat harta dan kemudian zakat fitrah (macam macam zakat)."),
          SizedBox(
            height: 10,
          ),
          Text(
              "Zakat mal atau mal zakat adalah zakat yang dikenakan atas segala jenis harta, yang secara zat maupun substansi perolehannya, tidak bertentangan dengan ketentuan agama. Sebagai contoh, zakat mal terdiri atas uang, emas, surat berharga, penghasilan profesi, dan sebagainya."),
        ],
      ),
    );
  }
}
