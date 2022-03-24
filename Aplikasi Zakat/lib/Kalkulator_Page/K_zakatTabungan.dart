import 'package:flutter/material.dart';
import 'package:flutter_application_2/zakatFitrah_1Screen.dart';
import 'package:flutter_application_2/zakatMall_1Screen.dart';

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

  Widget build(BuildContext context) {
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
          actions: [Icon(Icons.home)],
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
                          labelText: "1.Masukan Total Tabungan anda:",
                        ),
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
                            labelText: "2.Masukan Bunga dari Tabungan Anda :"),
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
                                "3.Masukan Jumlah Deposito yang Dimiliki :"),
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

//jumlah yang dibayar============================================================================================================
                      isHitung
                          ? Column(
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "Tabungan total anda selama setahun adalah " +
                                      Hasil,
                                  style: TextStyle(fontSize: 18),
                                ),
                                int.parse(Hasil) < 95000000
                                    ? Text(
                                        "Tabungan anda kurang dari hisab yang ditentukan, anda tidak dikenai wajib zakat saat ini")
                                    : Text(
                                        "Jumlah Zakat yang harus anda keluarkan adalah" +
                                            Zakat)
                              ],
                            )
                          : SizedBox(width: 0, height: 0),

//jumlah yang dibayar============================================================================================================

//Button bayar============================================================================================================

                      SizedBox(height: 20),
                      isHitung && int.parse(Hasil) < 95000000
                          ? ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  onSurface: Colors.lightGreen,
                                  primary: Colors.lightGreen,
                                  minimumSize: const Size(200, 50)),
                              onPressed: int.parse(Zakat) > 0
                                  ? () {
                                      setState(() {
                                        Navigator.pushReplacementNamed(
                                            context, zakatMall_1Screen.route,
                                            arguments: {
                                              "Zakat": Zakat,
                                              "Jenis": "Zakat Tabungan"
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
                                        isHitung = true;
                                        int Total = int.parse(_Tabungan) +
                                            int.parse(_Deposito) -
                                            int.parse(_Bunga);
                                        Hasil = Total.toString();
                                        Zakat = (((Total * 25) / 1000).toInt())
                                            .toString();
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
