import 'package:flutter/material.dart';

class kalkulatorZHartaScreen extends StatefulWidget {
  const kalkulatorZHartaScreen({Key? key}) : super(key: key);
  static const route = "/KalkulatorZHarta";

  @override
  _kalkulatorZHartaState createState() => _kalkulatorZHartaState();
}

class _kalkulatorZHartaState extends State<kalkulatorZHartaScreen> {
  @override
  final formKey = GlobalKey<FormState>();
  bool isButtonActive = false;
  late TextEditingController controller;
  String Hasil = "0";
  String bulanan = "0";

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
                            setState(() {
                              Hasil = jumlah.toString();
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

                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Jumlah yang harus dibayarkan adalah:  Rp." + Hasil,
                        style: TextStyle(fontSize: 18),
                      ),
//jumlah yang dibayar============================================================================================================

//Button bayar============================================================================================================

                      SizedBox(height: 20),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              onSurface: Colors.lightGreen,
                              primary: Colors.lightGreen,
                              minimumSize: const Size(200, 50)),
                          onPressed: isButtonActive
                              ? () {
                                  print("Sukses");
                                }
                              : null,
                          child: Text("Hitung")),
                    ],
                  ))),
//Button bayar============================================================================================================
        ]));
  }
}
