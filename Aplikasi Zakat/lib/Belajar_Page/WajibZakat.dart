import 'package:flutter/material.dart';
import 'package:flutter_application_2/LandingPage.dart';
import 'package:flutter_application_2/Provider/itemLogin.dart';
import 'package:provider/provider.dart';

class WajibScreen extends StatelessWidget {
  const WajibScreen({Key? key}) : super(key: key);

  static const route = "/Wajib";

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
              child: Column(children: [
                Text(
                  "Mengapa Wajib Membayar Zakat ?",
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                    "1. Salah satu makna dari zakat adalah At-Thohuru yang memiliki arti menyucikan atau membersihkan. Menunaikan zakat seharusnya dilakukan dengan niatan suci dan semata-mata karena Allah SWT. Untuknya Allah akan membersihkan dirimu serta harta benda yang kamu miliki dari dosa-dosa selama setahun ini. Setelah diri dan apa yang kamu miliki suci, maka ketentraman hati akan kamu terima.",
                    style: TextStyle(fontSize: 14)),
                SizedBox(
                  height: 10,
                ),
                Text(
                    "2. Makna zakat yang kedua adalah Al-Barakatu yang berarti berkah. Maksudnya setiap umat muslim yang membayar zakat, Allah tidak akan ragu untuk memberikan keberkahan baginya, salah satu caranya adalah dengan melipatgandakan apa yang kamu miliki sekarang.",
                    style: TextStyle(fontSize: 14)),
                SizedBox(
                  height: 10,
                ),
                Text(
                    "3. Makna ketiga dari zakat adalah an-numuwwu, artinya bahwa dengan berzakat, harta kita akan terus berkembang dan bertambah. Dalam sebuah hadits Rasulullah SAW bersabda: sebuah harta tidak akan berkurang dengan hanya disedekahkan (zakat).",
                    style: TextStyle(fontSize: 14)),
              ]))
        ],
      ),
    );
  }
}
