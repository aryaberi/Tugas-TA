import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_2/zakatFitrah_2Screen.dart';

class zakatFitrah_1Screen extends StatefulWidget {
  const zakatFitrah_1Screen({Key? key}) : super(key: key);
  static const route = "zakatFitrah_1";

  @override
  _zakatFitrah_1State createState() => _zakatFitrah_1State();
}

List<Map> LAZ = [
  {"id": '1', "image": "images/Logo_LAZ/Logo_Ry.png", "name": "Rumah Yatim"},
  {"id": '2', "image": "images/Logo_LAZ/Logo_RZ.png", "name": "Rumah Zakat"},
  {"id": '3', "image": "images/Logo_LAZ/Logo-dd.png", "name": "Dompet Dhuafa"},
  {"id": '4', "image": "images/Logo_LAZ/logo-laz.png", "name": "LAZ Al-Azhar"},
  {"id": '5', "image": "images/Logo_LAZ/Logo-lazismu.png", "name": "Lazismu"},
  {"id": '6', "image": "images/Logo_LAZ/Logo_Baznas.png", "name": "BAZNAS"},
  {
    "id": '7',
    "image": "images/Logo_LAZ/Logo_NU_CARE-LAZISNU.png",
    "name": "NU_CARE_LAZISNU"
  },
];

List<Map> PaymentMetode = [
  {"id": 'A', "image": "images/Logo_Pembayaran/logo-ovo.png", "name": "Ovo"},
  {
    "id": 'B',
    "image": "images/Logo_Pembayaran/Gopay-Logo.png",
    "name": "Gopay"
  },
  {
    "id": 'C',
    "image": "images/Logo_Pembayaran/dana-meta-logo.png",
    "name": "Dana"
  },
  {
    "id": 'D',
    "image": "images/Logo_Pembayaran/logo_linkAja.png",
    "name": "Link Aja"
  },
  {"id": 'E', "image": "images/Logo_Pembayaran/BRI.png", "name": "BRI"},
  {"id": 'F', "image": "images/Logo_Pembayaran/BNI.png", "name": "BNI"},
];

int convertAlphabet(value) {
  int idx = 0;
  if (value == "A") {
    idx = 0;
  } else if (value == "B") {
    idx = 1;
  } else if (value == "C") {
    idx = 2;
  } else if (value == "D") {
    idx = 3;
  } else if (value == "E") {
    idx = 4;
  } else if (value == "F") {
    idx = 5;
  }
  return idx;
}

class _zakatFitrah_1State extends State<zakatFitrah_1Screen> {
  @override
  final formKey = GlobalKey<FormState>();
  final formatter = NumberFormat.simpleCurrency(locale: 'id_ID');

  bool isButtonActive = false;
  String _Laz = "Rumah Yatim";
  String _methodPayment = "Ovo";
  String _kindPayment = "emoney";
  String _jumlah = "0";
  String initLaz = "1";
  String initmethodPayment = "A";
  String _nama = "";
  late TextEditingController controller;

  Widget build(BuildContext context) {
    final userName = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Pembayaran Zakat Fitrah",
            style: TextStyle(fontSize: 14),
          ),
          centerTitle: true,
          backgroundColor: Colors.lightGreen,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
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
//Dropdown LAZ menu============================================================================================================
                      Text(
                        "Pilih LAZ tujuan",
                        style: TextStyle(fontSize: 20),
                      ),
                      Container(
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            border: Border.all(width: 1, color: Colors.grey),
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Expanded(
                              child: DropdownButtonHideUnderline(
                                child: ButtonTheme(
                                  alignedDropdown: true,
                                  child: DropdownButton<String>(
                                    isExpanded: true,
                                    isDense: true,
                                    hint: new Text("Pilih LAZ"),
                                    value: initLaz,
                                    onChanged: (Value) {
                                      if (Value!.isNotEmpty) {
                                        setState(() {
                                          var idx = Value;
                                          _Laz =
                                              LAZ[int.parse(idx) - 1]["name"];
                                        });
                                      }
                                      setState(() {
                                        initLaz = Value.toString();
                                      });

                                      print(_Laz);
                                    },
                                    items: LAZ.map((Map map) {
                                      return new DropdownMenuItem<String>(
                                        value: map["id"].toString(),
                                        // value: _mySelection,
                                        child: Row(
                                          children: <Widget>[
                                            Image.asset(
                                              map["image"],
                                              width: 50,
                                              height: 50,
                                            ),
                                            Container(
                                                margin:
                                                    EdgeInsets.only(left: 10),
                                                child: Text(map["name"])),
                                          ],
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
//Dropdown LAZ menu============================================================================================================

//Dropdown Metode pembayara menu============================================================================================================
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Pilih Metode pembayaran",
                        style: TextStyle(fontSize: 20),
                      ),
                      Container(
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            border: Border.all(width: 1, color: Colors.grey),
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Expanded(
                              child: DropdownButtonHideUnderline(
                                child: ButtonTheme(
                                  alignedDropdown: true,
                                  child: DropdownButton<String>(
                                    isExpanded: true,
                                    isDense: true,
                                    hint: new Text("Pilih Metode Pembayaran"),
                                    value: initmethodPayment,
                                    onChanged: (Value) {
                                      if (Value!.isNotEmpty) {
                                        int Idx =
                                            convertAlphabet(Value.toString());

                                        setState(() {
                                          var idx = Value;
                                          _methodPayment =
                                              PaymentMetode[Idx]["name"];
                                        });
                                      }
                                      setState(() {
                                        initmethodPayment = Value.toString();
                                      });
                                      if (_methodPayment == "BNI" ||
                                          _methodPayment == "BRI") {
                                        _kindPayment = "tranfer";
                                      }

                                      print(_methodPayment);
                                    },
                                    items: PaymentMetode.map((Map map) {
                                      return new DropdownMenuItem<String>(
                                        value: map["id"].toString(),
                                        // value: _mySelection,
                                        child: Row(
                                          children: <Widget>[
                                            Image.asset(
                                              map["image"],
                                              width: 30,
                                              height: 30,
                                            ),
                                            Container(
                                                margin:
                                                    EdgeInsets.only(left: 10),
                                                child: Text(map["name"])),
                                          ],
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
//Dropdown Metode pembayara menu============================================================================================================

//Form nama============================================================================================================
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "1.Masukan Nama anda:",
                          hintText: "nama anda",
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Perlu isi";
                          } else {
                            return null;
                          }
                        },
                        style: TextStyle(fontSize: 20),
                        onChanged: (value) {
                          if (value.isNotEmpty) {
                            _nama = value;
                            print("isNotEmpty");
                          } else {
                            print("isEmpty");
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
                      //Form nama============================================================================================================

//Form jumlah orang============================================================================================================

                      TextFormField(
                        decoration: InputDecoration(
                            labelText: "2.Masukan Jumlah orang :",
                            hintText: "jumlah orang"),
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
                            var jumlah = 27500 * int.parse(value);
                            setState(() {
                              _jumlah = jumlah.toString();
                            });
                          } else {
                            _jumlah = "0";
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
//Form jumlah orang============================================================================================================

//jumlah yang dibayar============================================================================================================

                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Jumlah yang harus dibayarkan adalah: " +
                            formatter.format(int.parse(_jumlah)).toString(),
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
                                  Navigator.pushReplacementNamed(
                                      context, ZakatFitrah_2Screen.route,
                                      arguments: {
                                        "methodPayment": _methodPayment,
                                        "kindPayment": _kindPayment,
                                        "Laz": _Laz,
                                        "nama": _nama,
                                        "jumlah": _jumlah,
                                        "usernama": userName,
                                      });
                                }
                              : null,
                          child: Text("Lanjutkan")),
                    ],
                  ))),
//Button bayar============================================================================================================
        ]));
  }
}

class dataPayment {
  final String methodPayment;
  final String Laz;
  final String nama;
  final String jumlah;

  const dataPayment(
      {required this.methodPayment,
      required this.Laz,
      required this.nama,
      required this.jumlah});
}
