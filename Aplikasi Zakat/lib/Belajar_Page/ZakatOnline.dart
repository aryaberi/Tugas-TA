import 'package:flutter_application_2/LandingPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/Provider/itemLogin.dart';
import 'package:provider/provider.dart';

class zakatOnlineScreen extends StatelessWidget {
  const zakatOnlineScreen({Key? key}) : super(key: key);

  static const route = "/ZakatOnline";
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
                  "Bagaimana Hukum Membayar Zakat Secara Online ?",
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                    "Bagaimana hukumnya pembayaran zakat menggunakan metode online ini? Apakah sah?",
                    style: TextStyle(fontSize: 14)),
                SizedBox(
                  height: 10,
                ),
                Text(
                    "Menanggapi hal tersebut Pengamat Ekonomi Syariah IPB, Irfan Syauqi Beik mengungkapkan pembayaran zakat baik maal dan fitrah dengan metode online itu sah. Hal ini karena pada dasarnya ijab qabul dalam zakat mengalami perubahan dan perkembangan metode pembayaran.",
                    style: TextStyle(fontSize: 14)),
                SizedBox(
                  height: 10,
                ),
                Text(
                    "Intinya sama, ada proses yang memastikan bahwa antara pihak yang satu dan yang lain memiliki kesepahaman dalam proses tersebut, kata dia kepada detikcom, Sabtu (1/5/2021).",
                    style: TextStyle(fontSize: 14)),
              ]))
        ],
      ),
    );
  }
}
