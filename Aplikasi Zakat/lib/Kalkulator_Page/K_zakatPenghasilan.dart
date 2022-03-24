import 'package:flutter/material.dart';
import 'package:flutter_application_2/zakatFitrah_1Screen.dart';
import 'package:flutter_application_2/zakatMall_1Screen.dart';

class kalkulatorZPendapatanScreen extends StatefulWidget {
  const kalkulatorZPendapatanScreen({Key? key}) : super(key: key);
  static const route = "/KalkulatorZPendapatan";

  @override
  _kalkulatorZPendapatanState createState() => _kalkulatorZPendapatanState();
}

class _kalkulatorZPendapatanState extends State<kalkulatorZPendapatanScreen> {
  @override
  final formKey = GlobalKey<FormState>();
  bool isButtonActive = false;
  bool isHitung = false;
  late TextEditingController controller;
  String Hasil = "0";
  String bulanan = "0";
  String Zakat = "0";

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Kalkulator Zakat Harta",
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

//Form Pendapatan bulanan============================================================================================================
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "1.Masukan pendapatan bulanan anda:",
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
                            bulanan = value;
                          } else {
                            bulanan = "0";
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
//Form pendapatan bulanan ============================================================================================================

//Form bonus tahunan============================================================================================================

                      TextFormField(
                        decoration: InputDecoration(
                            labelText: "2.Masukan Bonus tahunan anda :"),
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
                            var jumlah =
                                12 * int.parse(bulanan) + int.parse(value);
                            var Total = ((jumlah * 25) / 1000).toInt();
                            setState(() {
                              Hasil = jumlah.toString();
                              Zakat = jumlah.toString();
                            });
                          } else {
                            Hasil = "0";
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
                                  "Pendapatan  total anda selama setahun adalah " +
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
                                              "Jenis": "Zakat Pendapatan"
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
