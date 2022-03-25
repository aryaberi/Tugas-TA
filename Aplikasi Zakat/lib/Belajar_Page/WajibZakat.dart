import 'package:flutter/material.dart';

class WajibScreen extends StatelessWidget {
  const WajibScreen({Key? key}) : super(key: key);

  static const route = "/Wajib";

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
            "Mengapa Wajib Membayar Zakat ?",
            style: TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
              "1. Salah satu makna dari zakat adalah At-Thohuru yang memiliki arti menyucikan atau membersihkan. Menunaikan zakat seharusnya dilakukan dengan niatan suci dan semata-mata karena Allah SWT. Untuknya Allah akan membersihkan dirimu serta harta benda yang kamu miliki dari dosa-dosa selama setahun ini. Setelah diri dan apa yang kamu miliki suci, maka ketentraman hati akan kamu terima."),
          SizedBox(
            height: 10,
          ),
          Text(
              "2. Makna zakat yang kedua adalah Al-Barakatu yang berarti berkah. Maksudnya setiap umat muslim yang membayar zakat, Allah tidak akan ragu untuk memberikan keberkahan baginya, salah satu caranya adalah dengan melipatgandakan apa yang kamu miliki sekarang."),
          SizedBox(
            height: 10,
          ),
          Text(
              "3. Makna ketiga dari zakat adalah an-numuwwu, artinya bahwa dengan berzakat, harta kita akan terus berkembang dan bertambah. Dalam sebuah hadits Rasulullah SAW bersabda: sebuah harta tidak akan berkurang dengan hanya disedekahkan (zakat)."),
        ],
      ),
    );
  }
}
