import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_2/zakatFitrah_1Screen.dart';
import 'package:flutter_application_2/zakatMall_1Screen.dart';
import 'package:intl/intl.dart';

class kalkulatorZPerakScreen extends StatefulWidget {
  const kalkulatorZPerakScreen({Key? key}) : super(key: key);
  static const route = "/KalkulatorZPerak";

  @override
  _kalkulatorZPerakState createState() => _kalkulatorZPerakState();
}

class _kalkulatorZPerakState extends State<kalkulatorZPerakScreen> {
  @override
  final formKey = GlobalKey<FormState>();
  bool isButtonActive = false;
  bool isHitung = false;
  late TextEditingController controller;
  String Hasil = "0";
  String _dimiliki = "0";
  String _digunakan = "0";
  String Zakat = "0";
  final formatter = NumberFormat.simpleCurrency(locale: 'id_ID');

  Widget build(BuildContext context) {
    final userName = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Kalkulator Zakat Perak",
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

//FormPerakDimiliki============================================================================================================
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "1.Masukan Perak yang dimiliki:",
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
                            _dimiliki = value;
                          } else {
                            _dimiliki = "0";
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
//FormPerakDimiliki============================================================================================================

//FormPerakDigunakan============================================================================================================

                      TextFormField(
                        decoration: InputDecoration(
                            labelText:
                                "2.Masukan Jumlah Perak yang digunakan :"),
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
                            setState(() {
                              _digunakan = value;
                            });
                          } else {
                            setState(() {
                              _digunakan = "0";
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
                                        "Simpanan Perak total anda dalam rupiah selama setahun adalah " +
                                            _dimiliki +
                                            " - " +
                                            _digunakan +
                                            " X " +
                                            "Rp.650000" +
                                            " = " +
                                            formatter
                                                .format(int.parse(Hasil))
                                                .toString(),
                                        style: TextStyle(fontSize: 14),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      int.parse(Hasil) < 95000000
                                          ? Text(
                                              "Simpanan anda kurang dari hisab yang ditentukan, anda tidak dikenai wajib zakat saat ini",
                                              style: TextStyle(fontSize: 14))
                                          : Text(
                                              "Jumlah Zakat yang harus anda keluarkan adalah " +
                                                  formatter
                                                      .format(int.parse(Zakat))
                                                      .toString(),
                                              style: TextStyle(fontSize: 14))
                                    ],
                                  )))
                          : SizedBox(width: 0, height: 0),

//jumlah yang dibayar============================================================================================================

//Button bayar============================================================================================================

                      SizedBox(height: 20),
                      isHitung && int.parse(Hasil) > 95000000
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
                                              "Jenis": "Zakat Perak",
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
                                        int Jumlah = int.parse(_dimiliki) -
                                            int.parse(_digunakan);
                                        Hasil = (Jumlah * 650000).toString();
                                        Zakat =
                                            (((int.parse(Hasil) * 25) / 1000)
                                                    .toInt())
                                                .toString();
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
