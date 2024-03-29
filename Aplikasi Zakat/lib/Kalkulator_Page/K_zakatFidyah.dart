import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_2/zakatFitrah_1Screen.dart';
import 'package:flutter_application_2/zakatMall_1Screen.dart';
import 'package:intl/intl.dart';
import 'package:pattern_formatter/pattern_formatter.dart';
import 'package:flutter_application_2/LandingPage.dart';
import 'package:flutter_application_2/Provider/itemLogin.dart';
import 'package:provider/provider.dart';

class kalkulatorZFidyahScreen extends StatefulWidget {
  const kalkulatorZFidyahScreen({Key? key}) : super(key: key);
  static const route = "/KalkulatorZFidyah";

  @override
  _kalkulatorZFidyahState createState() => _kalkulatorZFidyahState();
}

class _kalkulatorZFidyahState extends State<kalkulatorZFidyahScreen> {
  @override
  final formKey = GlobalKey<FormState>();

  bool isButtonActive = false;
  bool isHitung = false;
  late TextEditingController controller;
  String Hasil = "0";
  String _Jumlah = "0";
  String _Harga = "0";
  String Zakat = "0";
  final formatter = NumberFormat.simpleCurrency(locale: 'id_ID');

  Widget build(BuildContext context) {
    final userName = ModalRoute.of(context)!.settings.arguments as String;
    final login = Provider.of<itemLogin>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Kalkulator Zakat Fidyah",
            style: TextStyle(fontSize: 14),
          ),
          centerTitle: true,
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
            TextButton(
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
                child: Text("Keluar",
                    style: TextStyle(fontSize: 20, color: Color(0xffffffff)))),
          ],
        ),
        body: ListView(children: [
          Padding(
              padding: const EdgeInsets.all(20),
              child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Text(
                        "Silahkan isi data-data berikut",
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(
                        height: 20,
                      ),

//Form  Jumlah Fidyah ============================================================================================================
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "1.Total hari tidak puasa:",
                        ),
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        validator: (value) {
                          if (value!.isEmpty ||
                              !RegExp('^[0-9]').hasMatch(value)) {
                            return "Isi dengan angka";
                          } else {
                            return null;
                          }
                        },
                        style: TextStyle(fontSize: 20),
                        onChanged: (value) {
                          if (value.isNotEmpty) {
                            _Jumlah = value;
                          } else {
                            _Jumlah = "0";
                          }
                          if (formKey.currentState!.validate()) {
                            setState(() {
                              isButtonActive = true;
                            });
                            print("validate");
                          } else {
                            setState(() {
                              isButtonActive = false;
                            });

                            print(isButtonActive);
                          }
                        },
                      ),
//Form Fidyah _Jumlah ============================================================================================================

//Form Harga Makanan ============================================================================================================

                      TextFormField(
                        decoration: InputDecoration(
                            labelText: "2.Biaya satu kali makan(Rp):"),
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly,
                          ThousandsFormatter()
                        ],
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Isi dengan angka";
                          } else {
                            return null;
                          }
                        },
                        style: TextStyle(fontSize: 20),
                        onChanged: (value) {
                          if (value.isNotEmpty) {
                            setState(() {
                              _Harga = value;
                            });
                          } else {
                            _Harga = "0";
                          }
                          if (formKey.currentState!.validate()) {
                            setState(() {
                              isButtonActive = true;
                            });
                            print("validate");
                          } else {
                            setState(() {
                              isButtonActive = false;
                            });

                            print(isButtonActive);
                          }
                        },
                      ),
//Form bonus tahunan============================================================================================================
                      SizedBox(
                        height: 20,
                      ),
//jumlah yang dibayar============================================================================================================
                      isHitung
                          ? Card(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  color: Colors.black,
                                ),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                  children: [
                                    Text(
                                      "Total Fidyah anda  adalah " +
                                          _Jumlah +
                                          " X " +
                                          _Harga +
                                          " = " +
                                          formatter
                                              .format(int.parse(Zakat))
                                              .toString(),
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ))
                          : SizedBox(width: 0, height: 0),

//jumlah yang dibayar============================================================================================================

//Button bayar============================================================================================================

                      SizedBox(height: 20),
                      isHitung
                          ? ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  onSurface: Colors.lightGreen,
                                  primary: Colors.lightGreen,
                                  minimumSize: const Size(400, 50)),
                              onPressed: int.parse(Zakat) > 0
                                  ? () {
                                      setState(() {
                                        Navigator.pushReplacementNamed(
                                            context, zakatMall_1Screen.route,
                                            arguments: {
                                              "Zakat": Zakat,
                                              "Jenis": "Zakat Fidyah",
                                              "usernama": userName
                                            });
                                      });
                                      ;
                                    }
                                  : null,
                              child: Text("Bayar"))
                          : ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  onSurface: Colors.lightGreen,
                                  primary: Colors.lightGreen,
                                  minimumSize: const Size(200, 50)),
                              onPressed: isButtonActive
                                  ? () {
                                      setState(() {
                                        int Total = int.parse(_Jumlah) *
                                            int.parse(
                                                _Harga.replaceAll(",", ""));

                                        Zakat = Total.toString();
                                        isHitung = true;
                                      });
                                      ;
                                    }
                                  : null,
                              child: Text("Hitung")),
                    ],
                  ))),
//Button bayar============================================================================================================
        ]));
  }
}
