import 'package:flutter/material.dart';

class pengertianScreen extends StatelessWidget {
  const pengertianScreen({Key? key}) : super(key: key);

  static const route = "/pengertian";

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
            "Pengertian Zakat",
            style: TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
              "Pengertian Zakat sendiri berasal dari Bahasa Arab yakni zaka yang artinya bersih, suci, subur, berkembang.",style: TextStyle(fontSize: 14)),
          SizedBox(
            height: 10,
          ),
          Text(
              "Dikutip dari laman Badan Amil Zakat Nasional (Baznas), zakat artinya bagian tertentu dari harta yang wajib dikeluarkan oleh setiap muslim apabila telah mencapai syarat yang ditetapkan.",style: TextStyle(fontSize: 14)),
          SizedBox(
            height: 10,
          ),
          Text(
              "Sebagai salah satu rukun Islam, zakat ditunaikan untuk diberikan kepada golongan yang berhak menerimanya (asnaf).",style: TextStyle(fontSize: 14)),
        ],
      ),
    );
  }
}
