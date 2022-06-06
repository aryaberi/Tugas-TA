import 'package:flutter/material.dart';

class bantuanBelajarScreen extends StatelessWidget {
  const bantuanBelajarScreen({Key? key}) : super(key: key);

  static const route = "/bantuanBelajar";

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
            "Cara Belajar Zakat",
            style: TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20,
          ),
          Text("1. Pilih menu belajar pada dashboard seperti gambar berikut."),
          SizedBox(
            height: 10,
          ),
          Text("2. Pilih topik yang ingin dipelajari"),
          SizedBox(
            height: 10,
          ),
          Text("3. Selamat belajar."),
        ],
      ),
    );
  }
}
