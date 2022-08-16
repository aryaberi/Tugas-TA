import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_2/zakatFitrah_1Screen.dart';
import 'package:flutter_application_2/zakatMall_1Screen.dart';
import 'package:pattern_formatter/pattern_formatter.dart';
import 'package:intl/intl.dart';

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
  String Bonus = "0";
  final formatter = NumberFormat.simpleCurrency(locale: 'id_ID');

  Widget build(BuildContext context) {
    final userName = ModalRoute.of(context)!.settings.arguments as String;
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
                          labelText: "1.Masukan pendapatan bulanan anda(Rp):",
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
                            labelText: "2.Masukan Bonus tahunan anda(Rp) :"),
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
                          Bonus = value;
                          if (value.isNotEmpty) {
                            var jumlah =
                                12 * int.parse(bulanan.replaceAll(",", "")) +
                                    int.parse(value.replaceAll(",", ""));
                            var Total = ((jumlah * 25) / 1000).toInt();
                            var rupiah = formatter.format(Total);
                            setState(() {
                              Hasil = jumlah.toString();
                              Zakat = Total.toString();
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
                                      "Pendapatan  total anda selama setahun adalah " +
                                          "(12 " +
                                          "X " +
                                          bulanan +
                                          " ) " +
                                          "+ " +
                                          Bonus +
                                          " = " +
                                          formatter
                                              .format(int.parse(Hasil))
                                              .toString(),
                                      style: TextStyle(fontSize: 14),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    int.parse(Hasil) < 73100000
                                        ? Text(
                                            "Pendapatan anda kurang dari hisab yang ditentukan, hisab saat ini adalah sebesar Rp 73.100.000, anda tidak dikenai wajib zakat saat ini",
                                            style: TextStyle(fontSize: 14))
                                        : Text(
                                            "Jumlah Zakat yang harus anda keluarkan adalah " +
                                                formatter
                                                    .format(int.parse(Zakat))
                                                    .toString(),
                                            style: TextStyle(fontSize: 14))
                                  ],
                                ),
                              ),
                            )
                          : SizedBox(width: 0, height: 0),

//jumlah yang dibayar============================================================================================================

//Button bayar============================================================================================================

                      SizedBox(height: 20),
                      isHitung && int.parse(Hasil) >= 73100000
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
                                              "Jenis": "Zakat Pendapatan",
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
                              onPressed: isButtonActive & isHitung == false
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
