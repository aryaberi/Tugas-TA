import 'package:flutter/material.dart';
import 'package:flutter_application_2/zakatFitrah_3Screen.dart';
import 'package:intl/intl.dart';

class ZakatFitrah_2Screen extends StatefulWidget {
  static const route = "/Zakatfitrah2";

  @override
  _ZakatFitrah_2ScreenState createState() => _ZakatFitrah_2ScreenState();
}

class _ZakatFitrah_2ScreenState extends State<ZakatFitrah_2Screen> {
  @override
  // Map data = [] as Map;
  Widget build(BuildContext context) {
    final formatter = NumberFormat.simpleCurrency(locale: 'id_ID');

    final data =
        ModalRoute.of(context)!.settings.arguments as Map<dynamic, dynamic>;
    var _jumlah = formatter.format(int.parse(data["jumlah"]));
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Pembayaran Zakat Fitrah",
          style: TextStyle(fontSize: 20),
        ),
        centerTitle: true,
        backgroundColor: Colors.lightGreen,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
        children: [
          Center(
              child: Text("Anda akan melakukan pembayaran zakat fitrah",
                  style: TextStyle(fontSize: 20), textAlign: TextAlign.center)),
          SizedBox(height: 20),
          Text("Kepada LAZ                 :   " + data["Laz"],
              style: TextStyle(fontSize: 16)),
          Text("Metode Pembayaran :  " + data["methodPayment"],
              style: TextStyle(fontSize: 16)),
          Text("Atas Nama                   :   " + data["nama"],
              style: TextStyle(fontSize: 16)),
          Text("Dengan Jumlah           :   " + _jumlah.toString(),
              style: TextStyle(fontSize: 16)),
          SizedBox(height: 20),
          Text(
              "Jika sudah yakin dengan data-data tersebut, silahkan baca niat di bawah ini, dan menekan tombol lanjut",
              style: TextStyle(fontSize: 16)),
          SizedBox(height: 20),
          // Container(
          //   child: Image.asset("images/Niat_Zakat_Fitrah.png"),
          // ),
          Text(
            "Nawaytu an ukhrija zakaata al-fitri `an " +
                data["nama"] +
                " fardhan lillahi ta`ala",
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10),
          Text(
            "Aku niat mengeluarkan zakat fitrah untuk, " +
                data["nama"] +
                " fardu karena Allah Ta‘âlâ.",
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),

          SizedBox(height: 70),
          Padding(
            padding: const EdgeInsets.all(20),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    onSurface: Colors.lightGreen,
                    primary: Colors.lightGreen,
                    minimumSize: const Size(200, 50)),
                onPressed: () {
                  Navigator.pushNamed(context, zakatFitrah_3Screen.route,
                      arguments: data);
                },
                child: Text("Lanjutkan")),
          ),
        ],
      ),
    );
  }
}

class dataPayment {
  final String methodPayment;
  final String Laz;
  final String nama;
  final String jumlah;

  const dataPayment(
      {required this.methodPayment,
      required this.Laz,
      required this.nama,
      required this.jumlah});
}
