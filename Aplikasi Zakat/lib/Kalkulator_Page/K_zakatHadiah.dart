import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:flutter_application_2/zakatFitrah_1Screen.dart';
import 'package:flutter_application_2/zakatMall_1Screen.dart';

class kalkulatorZHadiahScreen extends StatefulWidget {
  const kalkulatorZHadiahScreen({Key? key}) : super(key: key);
  static const route = "/KalkulatorZHadiah";

  @override
  _kalkulatorZHadiahState createState() => _kalkulatorZHadiahState();
}

class _kalkulatorZHadiahState extends State<kalkulatorZHadiahScreen> {
  @override
  final formKey = GlobalKey<FormState>();
  bool isButtonActive = false;
  bool isHitung = false;
  late TextEditingController controller;
  String _Total = "0";
  String _Selected = "1";
  String Zakat = "0";
  final formatter = NumberFormat.simpleCurrency(locale: 'id_ID');

  Widget build(BuildContext context) {
    final userName = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Kalkulator Zakat Hadiah",
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

//Form Hadiah Total============================================================================================================
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "1.Masukan Total Hadiah:",
                        ),
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
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
                            _Total = value;
                          } else {
                            _Total = "0";
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
//Form Hadiah Total ============================================================================================================

//Form Jenis Hadiah ============================================================================================================
                      Row(children: [
                        Radio(
                            value: "1",
                            groupValue: _Selected,
                            onChanged: (Value) {
                              setState(() {
                                _Selected = Value.toString();
                              });
                            }),
                        Text("Tanpa jerih payah")
                      ]),
                      Row(children: [
                        Radio(
                            value: "2",
                            groupValue: _Selected,
                            onChanged: (Value) {
                              setState(() {
                                _Selected = Value.toString();
                              });
                            }),
                        Text("Sedikit jerih payah")
                      ]),
                      Row(children: [
                        Radio(
                            value: "3",
                            groupValue: _Selected,
                            onChanged: (Value) {
                              setState(() {
                                _Selected = Value.toString();
                              });
                            }),
                        Text("Banyak jerih payah")
                      ]),
//Form jenis Hadiah ============================================================================================================

//jumlah yang dibayar============================================================================================================
                      isHitung
                          ? Column(
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                    "Zakat yang perlu anda keluarkan adalah " +
                                        formatter
                                            .format(int.parse(Zakat))
                                            .toString(),
                                    style: TextStyle(fontSize: 18)),
                              ],
                            )
                          : SizedBox(width: 0, height: 0),

//jumlah yang dibayar============================================================================================================

//Button bayar============================================================================================================

                      SizedBox(height: 20),
                      isHitung
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
                                              "Jenis": "Zakat Hadiah",
                                              "userName": userName
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
                                      if (_Selected == "1") {
                                        var jumlah =
                                            ((int.parse(_Total) * 20) / 100)
                                                .toInt();

                                        setState(() {
                                          Zakat = jumlah.toString();
                                        });
                                        print(_Selected);
                                      } else if (_Selected == "2") {
                                        var jumlah =
                                            ((int.parse(_Total) * 10) / 100)
                                                .toInt();
                                        setState(() {
                                          Zakat = jumlah.toString();
                                        });
                                        print(_Selected);
                                      } else if (_Selected == "3") {
                                        var jumlah =
                                            ((int.parse(_Total) * 25) / 1000)
                                                .toInt();
                                        setState(() {
                                          Zakat = jumlah.toString();
                                        });
                                        print(_Selected);
                                      }
                                      setState(() {
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
