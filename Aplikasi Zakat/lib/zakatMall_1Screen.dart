import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_2/zakatMall_2Screen%20copy.dart';

class zakatMall_1Screen extends StatefulWidget {
  const zakatMall_1Screen({Key? key}) : super(key: key);
  static const route = "/zakatMall_1";

  @override
  _zakatMall_1State createState() => _zakatMall_1State();
}

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
  }
  return idx;
}

class _zakatMall_1State extends State<zakatMall_1Screen> {
  @override
  List<Map> LAZ = [
    {"id": '1', "image": "images/Logo_LAZ/Logo_Ry.png", "name": "Rumah Yatim"},
    {"id": '2', "image": "images/Logo_LAZ/Logo_RZ.png", "name": "Rumah Zakat"},
    {
      "id": '3',
      "image": "images/Logo_LAZ/Logo-dd.png",
      "name": "Dompet Dhuafa"
    },
    {
      "id": '4',
      "image": "images/Logo_LAZ/logo-laz.png",
      "name": "LAZ Al-Azhar"
    },
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
    // {"id": 'E', "image": "images/Logo_Pembayaran/Logo-lazismu.png", "name": "Lazismu"},
    // {"id": 'F', "image": "images/Logo_Pembayaran/Logo_Baznas.png", "name": "BAZNAS"},
    // {"id": 'G', "image": "images/Logo_Pembayaran/Logo_NU_CARE-LAZISNU.png", "name": "NU_CARE_LAZISNU"},
  ];

  List<Map> zakatMall = [
    {"name": "Zakat Pendapatan"},
    {"name": "Zakat Tabungan"},
    {"name": "Zakat Perniagaan"},
    {"name": "Zakat Emas"},
    {"name": "Zakat Perak"},
    {"name": "Zakat Hadiah"},
    {"name": "Zakat Fidyah"}
  ];
  final formKey = GlobalKey<FormState>();

  final formatter = NumberFormat.simpleCurrency(locale: 'id_ID');
  bool isButtonActive = false;
  String _nama = "";
  String Hasil = "0";
  String _jumlah = "0";
  String _Selected = "Zakat Pendapatan";
  String _Selected2 = "1";
  String _Selected3 = "A";
  String _Laz = "Rumah Yatim";
  String _methodPayment = "Ovo";
  String _jenis = "Zakat Harta";
  late TextEditingController controller;

  Widget build(BuildContext context) {
    final data =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    // int.parse(data) > 0 ? Hasil = data : null;

    data.isNotEmpty && int.parse(data["Zakat"]!) > 0
        ? Hasil = data["Zakat"]!
        : null;
    data.isNotEmpty && data["jenis"] != "belum"
        ? _jenis = data["Jenis"]!
        : null;

    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Pembayaran Zakat Mall",
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
//Dropdown Jenis Zakat=========================================================================================================
                      data.isNotEmpty && data["Jenis"] != "belum"
                          ? Text("Pembayara " + data["Jenis"]!)
                          : DecoratedBox(
                              decoration: BoxDecoration(
                                border: Border.all(),
                              ),
                              child: DropdownButton<String>(
                                isExpanded: true,
                                isDense: true,
                                hint: new Text("Pilih Jenis Zakat"),
                                value: _Selected,
                                onChanged: (Value) {
                                  if (Value!.isNotEmpty) {
                                    _jenis = Value;
                                  }
                                  setState(() {
                                    _Selected = Value.toString();
                                  });

                                  // print(_selected3);
                                },
                                items: zakatMall.map((Map map) {
                                  return new DropdownMenuItem<String>(
                                    value: map["name"].toString(),
                                    // value: _mySelection,
                                    child: Row(
                                      children: <Widget>[
                                        Container(
                                            margin: EdgeInsets.only(left: 10),
                                            child: Text(map["name"])),
                                      ],
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                      SizedBox(
                        height: 20,
                      ),
//Dropdown Jenis Zakat=========================================================================================================

//Dropdown LAZ menu============================================================================================================
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
                                    value: _Selected2,
                                    onChanged: (Value) {
                                      if (Value!.isNotEmpty) {
                                        setState(() {
                                          var idx = Value;
                                          _Laz =
                                              LAZ[int.parse(idx) - 1]["name"];
                                        });
                                      }

                                      setState(() {
                                        _Selected2 = Value.toString();
                                      });

                                      // print(_selected);
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
                                    value: _Selected3,
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
                                      ;
                                      setState(() {
                                        _Selected3 = Value.toString();
                                      });
                                      print(_methodPayment);
                                      print(Value);

                                      // print(_selected2);
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
                      data.isNotEmpty && int.parse(data["Zakat"]!) > 0
                          ? Text("Jumlah Zakat yang akan dibayarkan " +
                              formatter
                                  .format(int.parse(data["Zakat"]!))
                                  .toString())
                          : TextFormField(
                              decoration: InputDecoration(
                                  labelText:
                                      "2.Masukan Jumlah yang ingin dibayarkan :"),
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
                                  Hasil = value;
                                  print(Hasil);
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
//Form jumlah orang============================================================================================================

//jumlah yang dibayar============================================================================================================

                      // SizedBox(
                      //   height: 20,
                      // ),
                      // Text(
                      //   "Jumlah yang harus dibayarkan adalah:  Rp." + Hasil,
                      //   style: TextStyle(fontSize: 18),
                      // ),
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
                                  print(_jenis);

                                  Navigator.pushNamed(
                                      context, ZakatMall_2Screen.route,
                                      arguments: {
                                        "methodPayment": _methodPayment,
                                        "Laz": _Laz,
                                        "nama": _nama,
                                        "jenis": _jenis,
                                        "jumlah": Hasil
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
