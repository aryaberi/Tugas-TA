import 'package:flutter/material.dart';
import 'package:flutter_application_2/zakatMall_3Screen%20.dart';

class ZakatMall_2Screen extends StatefulWidget {
  static const route = "/ZakatMall2";

  @override
  _ZakatMall_2ScreenState createState() => _ZakatMall_2ScreenState();
}

class _ZakatMall_2ScreenState extends State<ZakatMall_2Screen> {
  @override
  // Map data = [] as Map;
  Widget build(BuildContext context) {
    final data =
        ModalRoute.of(context)!.settings.arguments as Map<dynamic, dynamic>;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Pembayaran Zakat Mall",
          style: TextStyle(fontSize: 14),
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
              child: Text("Anda akan melakukan pembayaran " + data["jenis"],
                  style: TextStyle(fontSize: 20), textAlign: TextAlign.center)),
          SizedBox(height: 20),
          Text("Kepada LAZ                :   " + data["Laz"],
              style: TextStyle(fontSize: 16)),
          Text("Metode Pembayaran :   " + data["methodPayment"],
              style: TextStyle(fontSize: 16)),
          Text("Atas Nama                  :   " + data["nama"],
              style: TextStyle(fontSize: 16)),
          Text("Dengan Jumlah          :   " + data["jumlah"],
              style: TextStyle(fontSize: 16)),
          SizedBox(height: 20),
          Text(
              "Jika sudah yakin dengan data-data tersebut, silahkan baca niat di bawah ini, dan menekan tombol lanjut",
              style: TextStyle(fontSize: 16)),
          SizedBox(height: 20),
          Container(
            child: Image.asset("images/Niat_Zakat_Fitrah.png"),
          ),
          Text(
            "Nawaitu 'an Ukhrija Zakatal Fithri 'an Nafsi Fardhon Lillahi Ta'ala",
            style: TextStyle(fontSize: 12),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 90),
          Padding(
            padding: const EdgeInsets.all(20),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    onSurface: Colors.lightGreen,
                    primary: Colors.lightGreen,
                    minimumSize: const Size(200, 50)),
                onPressed: () {
                  Navigator.pushReplacementNamed(
                      context, zakatMall_3Screen.route,
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
