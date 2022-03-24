import 'package:flutter/material.dart';
import 'package:flutter_application_2/zakatFitrah_1Screen.dart';
import 'package:flutter_application_2/zakatMall_1Screen.dart';

class kalkulatorZEmasScreen extends StatefulWidget {
  const kalkulatorZEmasScreen({Key? key}) : super(key: key);
  static const route = "/KalkulatorZEmas";

  @override
  _kalkulatorZEmasState createState() => _kalkulatorZEmasState();
}

class _kalkulatorZEmasState extends State<kalkulatorZEmasScreen> {
  @override
  final formKey = GlobalKey<FormState>();
  bool isButtonActive = false;
  bool isHitung = false;
  late TextEditingController controller;
  String Hasil = "0";
  String _dimiliki = "0";
  String _digunakan = "0";
  String Zakat = "0";

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Kalkulator Zakat Emas",
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

//FormEmasDimiliki============================================================================================================
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "1.Masukan Emas yang dimiliki:",
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
//FormEmasDimiliki============================================================================================================

//FormEmasDigunakan============================================================================================================

                      TextFormField(
                        decoration: InputDecoration(
                            labelText:
                                "2.Masukan Jumlah emas yang digunakan :"),
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

//jumlah yang dibayar============================================================================================================
                      isHitung
                          ? Column(
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "Total simpanan emas anda selama setahun adalah " +
                                      (Hasil),
                                  style: TextStyle(fontSize: 18),
                                ),
                                int.parse(Hasil) < 95000000
                                    ? Text(
                                        "Simpanan anda kurang dari hisab yang ditentukan, anda tidak dikenai wajib zakat saat ini")
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
                                              "Jenis": "Zakat Emas"
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
                                        int Jumlah = int.parse(_dimiliki) +
                                            int.parse(_digunakan);
                                        Hasil = (Jumlah * 850000).toString();
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
