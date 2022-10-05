import 'package:flutter/material.dart';
import 'package:flutter_application_2/Provider/itemLogin.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_2/LandingPage.dart';

class HukumanScreen extends StatelessWidget {
  const HukumanScreen({Key? key}) : super(key: key);
  static const route = "/Hukum";

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
                                  content: Text(
                                      "Yakin ingin keluar dari aplikasi ?"),
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
        body: ListView(children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
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
                    "Imam Adz-Dzahabi kitabnya, al-Kabair (dosa-dosa besar), menyebutkan bahwa meninggalkan zakat adalah salah satu dari tujuh puluh dosa besar yang dapat menjerumuskan pelakunya ke dalam neraka jahanam jika ia tidak bertobat. Karena itulah, Allah swt dan Rasul-Nya secara tegas menyampaikan ancaman bagi orang yang meninggalkan zakat secara sengaja, terutama bagi mereka yang mampu melaksanakannya.",
                    style: TextStyle(fontSize: 14)),
                Text("Firman Allah swt:", style: TextStyle(fontSize: 14)),
                SizedBox(
                  height: 10,
                ),
                Image(
                  fit: BoxFit.cover,
                  image: AssetImage("images/At_Taubah.PNG"),
                  // height: 200,
                  // width: 200,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                    "“Dan orang-orang yang menyimpan emas dan perak dan tidak menafkahkannya pada jalan Allah, maka beritahukanlah kepada mereka, (bahwa mereka akan mendapat) siksa yang pedih, pada hari dipanaskan emas perak itu dalam neraka jahannam, lalu dibakar dengannya dahi mereka, lambung dan punggung mereka (lalu dikatakan) kepada mereka: “Inilah harta bendamu yang kamu simpan untuk dirimu sendiri, maka rasakanlah sekarang (akibat dari) apa yang kamu simpan itu”. (QS. at-Taubah: 34-35)",
                    style: TextStyle(fontSize: 14)),
                SizedBox(
                  height: 10,
                ),
                Text("Hadist Rasull:", style: TextStyle(fontSize: 14)),
                SizedBox(
                  height: 10,
                ),
                Text(
                    "“Barangsiapa yang diberikan harta oleh Allah, namun tidak mengeluarkan zakatnya, niscaya pada hari kiamat harta itu akan berubah wujud menjadi seekor ular jantan yang bertanduk dan memiliki dua taring lalu melilit orang itu pada hari kiamat. Lalu ular itu memakannya dengan kedua rahangnya, yaitu dengan mulutnya seraya berkata, ‘Aku inilah hartamu, akulah harta simpananmu”. Kemudian Beliau membaca firman Allah Ta’ala di surat Ali ‘Imran ayat 180 yang artinya,  ” Sekali-kali janganlah orang-orang yang bakhil dengan harta yang Allah berikan kepada mereka dari karunia-Nya menyangka, bahwa kebakhilan itu baik bagi mereka. Sebenarnya kebakhilan itu adalah buruk bagi mereka. Harta yang mereka bakhilkan itu akan dikalungkan kelak di lehernya di hari kiamat. Dan kepunyaan Allah-lah segala warisan (yang ada) di langit dan di bumi. Dan Allah mengetahui apa yang kamu kerjakan.” (HR. al-Bukhari: 1405)",
                    style: TextStyle(fontSize: 14)),
                SizedBox(
                  height: 10,
                ),
                Text(
                    "“Siapa yang memiliki emas dan perak, tetapi dia tidak membayar zakatnya, niscaya di hari kiamat akan dibuatkan setrika api untuknya yang dinyalakan di dalam neraka, lalu disetrikakan ke perut, dahi dan punggungnya. Setiap setrika itu dingin, maka akan dipanaskan kembali lalu disetrikakan kembali kepadanya setiap hari –di mana sehari setara lima puluh tahun di dunia – hingga perkaranya diputuskan. Setelah itu, barulah ia melihat jalannya keluar, adakalanya ke surga dan adakalanya ke neraka.” (HR. Muslim: 987)",
                    style: TextStyle(fontSize: 14)),
              ],
            ),
          )
        ]));
  }
}
