import 'package:flutter/material.dart';
import 'package:flutter_application_2/Provider/itemLogin.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_2/LandingPage.dart';



class jenisZakatScreen extends StatelessWidget {
  const jenisZakatScreen({Key? key}) : super(key: key);

  static const route = "/jenisZakat";

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
        children: [ Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
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
              "Zakat terbagi menjadi dua, yakni zakat mal atau zakat harta dan kemudian zakat fitrah (macam macam zakat).",style: TextStyle(fontSize: 14)),
          SizedBox(
            height: 10,
          ),
          Text(
              "Zakat mal atau mal zakat adalah zakat yang dikenakan atas segala jenis harta, yang secara zat maupun substansi perolehannya, tidak bertentangan dengan ketentuan agama. Sebagai contoh, zakat mal terdiri atas uang, emas, surat berharga, penghasilan profesi, dan sebagainya.",style: TextStyle(fontSize: 14)),
        ]))],
      ),
    );
  }
}
