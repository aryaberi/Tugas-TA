import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_2/zakatFitrah_1Screen.dart';
import 'package:flutter_application_2/zakatMall_1Screen.dart';
import 'package:intl/intl.dart';
import 'package:pattern_formatter/pattern_formatter.dart';
import 'package:flutter_application_2/LandingPage.dart';
import 'package:flutter_application_2/Provider/itemLogin.dart';
import 'package:provider/provider.dart';

class kalkulatorZTabunganScreen extends StatefulWidget {
  const kalkulatorZTabunganScreen({Key? key}) : super(key: key);
  static const route = "/KalkulatorZTabungan";

  @override
  _kalkulatorZTabunganState createState() => _kalkulatorZTabunganState();
}

class _kalkulatorZTabunganState extends State<kalkulatorZTabunganScreen> {
  @override
  final formKey = GlobalKey<FormState>();

  bool isButtonActive = false;
  bool isHitung = false;
  late TextEditingController controller;
  String Hasil = "0";
  String _Tabungan = "0";
  String _Bunga = "0";
  String _Deposito = "0";
  String Zakat = "0";
  String HasilRp = "0";
  String ZakatRp = "0";

  final formatter = NumberFormat.simpleCurrency(locale: 'id_ID');

  Widget build(BuildContext context) {
    final userName = ModalRoute.of(context)!.settings.arguments as String;
    final login = Provider.of<itemLogin>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Kalkulator Zakat Tabungan",
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

//Form Total Tabungan============================================================================================================
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "1.Masukan Total Tabungan anda(Rp):",
                        ),
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
                            _Tabungan = value;
                          } else {
                            _Tabungan = "0";
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
//Form Total Tabungan ============================================================================================================

//Form Bunga konvesional ============================================================================================================

                      TextFormField(
                        decoration: InputDecoration(
                            labelText:
                                "2.Masukan Bunga dari Tabungan Anda(Rp):"),
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
                              _Bunga = value;
                            });
                          } else {
                            setState(() {
                              _Bunga = "0";
                            });
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
//Form Bunga konvesional ============================================================================================================

//Form Deposito============================================================================================================

                      TextFormField(
                        decoration: InputDecoration(
                            labelText:
                                "3.Masukan Jumlah Deposito yang Dimiliki(Rp):"),
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
                              _Deposito = value;
                            });
                          } else {
                            setState(() {
                              _Deposito = "0";
                            });
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
//Form Deposito============================================================================================================
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
                                        "Tabungan total anda selama setahun adalah " +
                                            _Tabungan +
                                            " + " +
                                            _Deposito +
                                            " - " +
                                            _Bunga +
                                            " = " +
                                            HasilRp,
                                        style: TextStyle(fontSize: 14),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      int.parse(Hasil) < 73100000
                                          ? Text(
                                              "Tabungan anda kurang dari nisab yang ditentukan, nisab saat ini adalah sebesar Rp 73.100.000, anda tidak dikenai wajib zakat saat ini",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold))
                                          : Text(
                                              "Jumlah Zakat yang harus anda keluarkan adalah " +
                                                  ZakatRp +
                                                  " Merupakan hasil dari 2,5% Total tabungan anda.",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold))
                                    ],
                                  )))
                          : SizedBox(width: 0, height: 0),

//jumlah yang dibayar============================================================================================================

//Button bayar============================================================================================================

                      SizedBox(height: 20),
                      isHitung && int.parse(Hasil) >= 73100000
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
                                              "Jenis": "Zakat Tabungan",
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
                                  minimumSize: const Size(400, 50)),
                              onPressed: isButtonActive & isHitung == false
                                  ? () {
                                      setState(() {
                                        isHitung = true;
                                        int Total = int.parse(
                                                _Tabungan.replaceAll(",", "")) +
                                            int.parse(
                                                _Deposito.replaceAll(",", "")) -
                                            int.parse(
                                                _Bunga.replaceAll(",", ""));
                                        Hasil = Total.toString();

                                        Zakat = (((Total * 25) / 1000).toInt())
                                            .toString();
                                        var rupiah1 =
                                            formatter.format(int.parse(Hasil));
                                        var rupiah2 =
                                            formatter.format(int.parse(Zakat));
                                        HasilRp = rupiah1.toString();
                                        ZakatRp = rupiah2.toString();
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
