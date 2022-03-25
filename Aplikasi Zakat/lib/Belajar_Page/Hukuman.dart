import 'package:flutter/material.dart';

class HukumanScreen extends StatelessWidget {
  const HukumanScreen({Key? key}) : super(key: key);
  static const route = "/Hukum";

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
            "Hukuman Bagi Orang yang Tidak Mau Berzakat",
            style: TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
              "“Dan orang-orang yang menyimpan emas dan perak dan tidak menafkahkannya pada jalan Allah, maka beritahukanlah kepada mereka, (bahwa mereka akan mendapat) siksa yang pedih, pada hari dipanaskan emas perak itu dalam neraka jahannam, lalu dibakar dengannya dahi mereka, lambung dan punggung mereka (lalu dikatakan) kepada mereka: “Inilah harta bendamu yang kamu simpan untuk dirimu sendiri, maka rasakanlah sekarang (akibat dari) apa yang kamu simpan itu”. (QS. at-Taubah: 34-35)"),
          SizedBox(
            height: 10,
          ),
          Text(
              "“Barangsiapa yang diberikan harta oleh Allah, namun tidak mengeluarkan zakatnya, niscaya pada hari kiamat harta itu akan berubah wujud menjadi seekor ular jantan yang bertanduk dan memiliki dua taring lalu melilit orang itu pada hari kiamat. Lalu ular itu memakannya dengan kedua rahangnya, yaitu dengan mulutnya seraya berkata, ‘Aku inilah hartamu, akulah harta simpananmu”. Kemudian Beliau membaca firman Allah Ta’ala di surat Ali ‘Imran ayat 180 yang artinya,  ” Sekali-kali janganlah orang-orang yang bakhil dengan harta yang Allah berikan kepada mereka dari karunia-Nya menyangka, bahwa kebakhilan itu baik bagi mereka. Sebenarnya kebakhilan itu adalah buruk bagi mereka. Harta yang mereka bakhilkan itu akan dikalungkan kelak di lehernya di hari kiamat. Dan kepunyaan Allah-lah segala warisan (yang ada) di langit dan di bumi. Dan Allah mengetahui apa yang kamu kerjakan.” (HR. al-Bukhari: 1405)"),
          SizedBox(
            height: 10,
          ),
          Text(
              "“Siapa yang memiliki emas dan perak, tetapi dia tidak membayar zakatnya, niscaya di hari kiamat akan dibuatkan setrika api untuknya yang dinyalakan di dalam neraka, lalu disetrikakan ke perut, dahi dan punggungnya. Setiap setrika itu dingin, maka akan dipanaskan kembali lalu disetrikakan kembali kepadanya setiap hari –di mana sehari setara lima puluh tahun di dunia – hingga perkaranya diputuskan. Setelah itu, barulah ia melihat jalannya keluar, adakalanya ke surga dan adakalanya ke neraka.” (HR. Muslim: 987)"),
        ],
      ),
    );
  }
}
