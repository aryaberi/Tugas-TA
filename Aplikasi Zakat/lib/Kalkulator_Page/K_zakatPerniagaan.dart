import 'package:flutter/material.dart';
import 'package:flutter_application_2/zakatFitrah_1Screen.dart';
import 'package:flutter_application_2/zakatMall_1Screen.dart';

class kalkulatorZPerniagaanScreen extends StatefulWidget {
  const kalkulatorZPerniagaanScreen({Key? key}) : super(key: key);
  static const route = "/KalkulatorZPerniagaan";

  @override
  _kalkulatorZPerniagaanState createState() => _kalkulatorZPerniagaanState();
}

class _kalkulatorZPerniagaanState extends State<kalkulatorZPerniagaanScreen> {
  @override
  final formKey = GlobalKey<FormState>();
  bool isButtonActive = false;
  bool isHitung = false;
  late TextEditingController controller;
  String Hasil = "0";
  String _Aset = "0";
  String _Pendapatan = "0";
  String _Piutang = "0";
  String _Hutang = "0";
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

//Form Total Aset atau Modal ============================================================================================================
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "1.Masukan Aset atau Modal yang dimiliki:",
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
                            _Aset = value;
                          } else {
                            _Aset = "0";
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
//Form Total Aset atau Modal ============================================================================================================

//Form Total pendapatan 1 tahun ============================================================================================================

                      TextFormField(
                        decoration: InputDecoration(
                            labelText: "2.Pendapatan selama satu tahun :"),
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
                              _Pendapatan = value;
                            });
                          } else {
                            setState(() {
                              _Pendapatan = "0";
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
//Form Pendapatan 1 tahun ============================================================================================================

//Form Yang dihutangkan============================================================================================================

                      TextFormField(
                        decoration: InputDecoration(
                            labelText: "3.Masukan Jumlah yang Dihutangkan :"),
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
                              _Piutang = value;
                            });
                          } else {
                            setState(() {
                              _Piutang = "0";
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
//Form Yang dihutangkan ============================================================================================================
//Form Jumlah Hutang ============================================================================================================

                      TextFormField(
                        decoration: InputDecoration(
                            labelText:
                                "3.Masukan Jumlah Hutang yang harus dibayar :"),
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
                              _Hutang = value;
                            });
                          } else {
                            setState(() {
                              _Hutang = "0";
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
//Form Yang dihutangkan ============================================================================================================

//jumlah yang dibayar============================================================================================================
                      isHitung
                          ? Column(
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "Pendapatan  perniagaan total anda selama setahun adalah " +
                                      Hasil,
                                  style: TextStyle(fontSize: 18),
                                ),
                                int.parse(Hasil) < 95000000
                                    ? Text(
                                        "Pendapatan anda kurang dari hisab yang ditentukan, anda tidak dikenai wajib zakat saat ini")
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
                                              "Jenis": "Zakat Perniagaan"
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
                                        int Total = int.parse(_Aset) +
                                            int.parse(_Pendapatan) +
                                            int.parse(_Piutang) -
                                            int.parse(_Hutang);
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
