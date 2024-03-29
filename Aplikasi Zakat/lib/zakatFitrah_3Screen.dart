import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_2/Dashboard.dart';
import 'package:flutter_application_2/LandingPage.dart';
import 'package:flutter_application_2/Provider/User.dart';
import 'package:flutter_application_2/Provider/itemLogin.dart';
import 'package:intl/intl.dart';
import 'package:flutter_application_2/Provider/Provider.dart';
import 'package:provider/provider.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';

import 'Provider/listBayar.dart';


String convertLaz(value) {
  String No = "";
  if (value == "Rumah Yatim") {
    No = "099912345221";
  } else if (value == "Rumah Zakat") {
    No = "092213456789";
  } else if (value == "Dompet Dhuafa") {
    No = "011122223333";
  } else if (value == "LAZ Al-Azhar") {
    No = "0877776612345";
  } else if (value == "Lazismu") {
    No = "098976543210";
  } else if (value == "BAZNAS") {
    No = "09999777766";
  } else if (value == "NU_CARE_LAZISNU") {
    No = "078955532412";
  }
  return No;
}

class zakatFitrah_3Screen extends StatefulWidget {
  zakatFitrah_3Screen({Key? key}) : super(key: key);

  static const route = "/ZakatFitrah3";

  @override
  State<zakatFitrah_3Screen> createState() => _zakatFitrah_3State();
}

class _zakatFitrah_3State extends State<zakatFitrah_3Screen> {
  final formKey = GlobalKey<FormState>();
  bool isValidate = false;
  bool isGanti = false;
  String _No = "0";
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<dataUser>(context);
    final formatter = NumberFormat.simpleCurrency(locale: 'id_ID');
    final data =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    bool isButtonActive = data["kindPayment"] == "emoney" ? false : true;
    final items = Provider.of<itemLaporan>(context);
    final _items = items.allItems;
    // final items2 = Provider.of<itemLaporan2>(context);
    // final _items2 = items2.allItems;
    final bayar = Provider.of<listBayar>(context);
    final _bayars = bayar.allItems;
    final login = Provider.of<itemLogin>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Pembayaran Zakat Fitrah",
          style: TextStyle(fontSize: 20),
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
      body: ListView(
        children: [
          Padding(
              padding: const EdgeInsets.only(top: 50.0, left: 8.0, right: 8.0),
              child: data["kindPayment"] == "emoney"
                  ? user.getStatusEmoney(
                                  data["usernama"], data["methodPayment"]) ==
                              "0" ||
                          isGanti
                      ? Column(
                          children: [
                            Text(
                                "Untuk melakukan pembayaran menggunakan metode " +
                                    data["methodPayment"] +
                                    " silahkan masukan no hp yang terhubung dengan akun " +
                                    data["methodPayment"] +
                                    " Anda",
                                style: TextStyle(fontSize: 16)),

                            //     ?
                            Form(
                                key: formKey,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 20.0, left: 8.0, right: 8.0),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                        labelText: "Masukan no hp :"),
                                    keyboardType: TextInputType.number,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    validator: (value) {
                                      if (value!.isEmpty || value.length < 11) {
                                        return "Isi dengan angka";
                                      } else {
                                        return null;
                                      }
                                    },
                                    onChanged: (value) {
                                      if (formKey.currentState!.validate()) {
                                        setState(() {
                                          _No = value;
                                          isValidate = true;
                                        });
                                        print(isButtonActive);
                                        print("validate");
                                      } else {
                                        setState(() {
                                          isValidate = false;
                                        });
                                      }
                                    },
                                    style: TextStyle(fontSize: 20),
                                  ),
                                )),
                            // : Column(),
                          ],
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Card(
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    color: Colors.black,
                                  ),
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          // Row(
                                          //   children: [
                                          Center(
                                            child: TextButton(
                                                onPressed: () {
                                                  setState(() {
                                                    isGanti = !isGanti;
                                                  });
                                                },
                                                child: Text("Ganti nomor",
                                                    style: TextStyle(
                                                        fontSize: 16))),
                                          ),
                                          Text(
                                              "No " +
                                                  data["methodPayment"] +
                                                  "mu adalah : " +
                                                  user.getStatusEmoney(
                                                      data["usernama"],
                                                      data["methodPayment"]),
                                              style: TextStyle(fontSize: 16)),

                                          //   ],
                                          // ),
                                          Text(
                                              "Jumlah saldo anda adalah : " +
                                                  formatter.format(int.parse(
                                                      user.getSaldo(
                                                          data["usernama"],
                                                          data[
                                                              "methodPayment"]))),
                                              style: TextStyle(fontSize: 16)),
                                          Text(
                                              "Jumlah yang harus dibayar adalah : " +
                                                  formatter.format(int.parse(
                                                      data["jumlah"])),
                                              style: TextStyle(fontSize: 16)),
                                        ]))),
                            Text(
                                "Untuk melanjutkan pembayaran, silahkan masukan PIN e-money anda",
                                style: TextStyle(fontSize: 16)),

                            //     ?
                            Form(
                                key: formKey,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 20.0, left: 8.0, right: 8.0),
                                  child: PinInputTextField(
                                    // enabled: false,
                                    cursor: Cursor(
                                      width: 2,
                                      color: Colors.lightBlue,
                                      radius: Radius.circular(1),
                                      enabled: true,
                                    ),
                                    pinLength: 6,
                                    decoration: CirclePinDecoration(
                                        strokeColorBuilder:
                                            PinListenColorBuilder(
                                                Colors.blue, Colors.black),
                                        obscureStyle:
                                            ObscureStyle(isTextObscure: true)),
                                    keyboardType: TextInputType.number,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    onChanged: (value) {
                                      if (formKey.currentState!.validate()) {
                                        setState(() {
                                          isValidate = true;
                                        });
                                        print(isButtonActive);
                                        print("validate");
                                      } else {
                                        setState(() {
                                          isValidate = false;
                                        });
                                      }
                                    },
                                  ),
                                )),
                            // : Column(),
                          ],
                        )
                  : Column(children: [
                      Text(
                          "Untuk melakukan pembayaran menggunakan metode " +
                              data["kindPayment"] +
                              " silahkan tranfer ke no rek berikut" +
                              " 9998765432112345, jangan lupa tambahkan 123 dibelakang pembayaran anda sebagai kode unik, contoh 500.123",
                          style: TextStyle(fontSize: 16))
                    ])),
          SizedBox(height: 90),
          Padding(
            padding: const EdgeInsets.all(20),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    onSurface: Colors.lightGreen,
                    primary: Colors.lightGreen,
                    minimumSize: const Size(200, 50)),
                onPressed: isButtonActive || isValidate
                    ? data["kindPayment"] == "emoney" &&
                                user.getStatusEmoney(data["usernama"],
                                        data["methodPayment"]) ==
                                    "0" ||
                            isGanti
                        ? () {
                            user.setStatusEmoney(
                                data["usernama"], data["methodPayment"], _No);
                            print("ini hasi final nya");
                            print(user.getStatusEmoney(
                                data["usernama"], data["methodPayment"]));
                            setState(() {
                              isGanti = !isGanti;
                            });
                          }
                        : data["kindPayment"] == "emoney"
                            ? () {
                                print("udah di tahap ini");
                                if (int.parse(user.getSaldo(data["usernama"],
                                            data["methodPayment"])) -
                                        int.parse(data["jumlah"]) <
                                    0) {
                                  showDialog<String>(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          AlertDialog(
                                              title: const Text(
                                                  'Pembayaran Gagal'),
                                              content: Container(
                                                height: 200,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Image.asset(
                                                      "images/Wrong.png",
                                                      height: 60,
                                                      width: 60,
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Text(
                                                        'Maaf saldo anda tidak mencukupi untuk melakukan pemabayaran'),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Text(
                                                        'Silahkan Top-up terlebih dahulu')
                                                  ],
                                                ),
                                              ),
                                              actions: <Widget>[
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.pushNamed(context,
                                                        DashboardScreen.route,
                                                        arguments:
                                                            data["usernama"]);
                                                  },
                                                  child:
                                                      const Text('Lanjutkan'),
                                                ),
                                                TextButton(
                                                  onPressed: () {
                                                    login.delete();
                                                    Navigator.pushNamed(
                                                      context,
                                                      LandingPageScreen.route,
                                                    );
                                                  },
                                                  child: const Text('Keluar'),
                                                )
                                              ]));
                                } else {
                                  showDialog<String>(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          AlertDialog(
                                              title: const Text(
                                                  'Pembayaran berhasil'),
                                              content: Container(
                                                height: 200,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Image.asset(
                                                      "images/True.png",
                                                      height: 60,
                                                      width: 60,
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Text(
                                                        'Selamat pembayaran zakat Fitrah anda berhasil'),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Text(
                                                        'Semoga rezeki anda dan sekeluarga dilipat gandakan oleh Allah SWT')
                                                  ],
                                                ),
                                              ),
                                              actions: <Widget>[
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                    String Penangung =
                                                        convertLaz(data["Laz"]);
                                                    String now = DateFormat(
                                                            "dd/MM/yyyy")
                                                        .format(DateTime.now());
                                                    // var no = data["usernama"] ==
                                                    //         "Maman"
                                                    //     ?
                                                    var no = _items.length + 1;
                                                    // : _items2.length + 1;
                                                    // data["usernama"] == "Maman"?
                                                    var count =
                                                        items.getCountName(data[
                                                                "usernama"]) +
                                                            1;
                                                    user.setSaldo(
                                                        data["usernama"],
                                                        data["methodPayment"],
                                                        int.parse(
                                                            data["jumlah"]));
                                                    bayar.addData(
                                                        {"nama": data["nama"]});
                                                    items.addData({
                                                      "Id": no.toString(),
                                                      "Count": count,
                                                      "Nama": data["nama"],
                                                      "UserName":
                                                          data["usernama"],
                                                      "Tanggal": now,
                                                      "Jenis": "Zakat Fitrah",
                                                      "Jumlah": data["jumlah"],
                                                      "Status":
                                                          "Telah diterima oleh LAZ",
                                                      "Laz": data["Laz"],
                                                      "Penangung": Penangung,
                                                      "Distribusi": "Belum ada",
                                                      "Tempat": "Belum ada",
                                                      "NoTlp": "Belum ada",
                                                      "AtasNama": "Belum ada"
                                                    });
                                                    items.updateLastList();
                                                    Navigator.pushNamed(context,
                                                        DashboardScreen.route,
                                                        arguments:
                                                            data["usernama"]);
                                                  },
                                                  child:
                                                      const Text('Lanjutkan'),
                                                ),
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                    String Penangung =
                                                        convertLaz(data["Laz"]);
                                                    String now = DateFormat(
                                                            "dd/MM/yyyy")
                                                        .format(DateTime.now());
                                                    // var no = data["usernama"] ==
                                                    //         "Maman"
                                                    //     ?
                                                    var no = _items.length + 1;
                                                    // : _items2.length + 1;
                                                    var count =
                                                        items.getCountName(data[
                                                                "usernama"]) +
                                                            1;
                                                    // data["usernama"] == "Maman"?
                                                    bayar.addData(
                                                        {"nama": data["nama"]});
                                                    items.addData({
                                                      "Id": no.toString(),
                                                      "Count": count,
                                                      "Nama": data["nama"],
                                                      "UserName":
                                                          data["usernama"],
                                                      "Tanggal": now,
                                                      "Jenis": data["jenis"],
                                                      "Jumlah": data["jumlah"],
                                                      "Status":
                                                          "Telah diterima oleh LAZ",
                                                      "Laz": data["Laz"],
                                                      "Penangung": Penangung,
                                                      "Distribusi": "Belum ada",
                                                      "Tempat": "Belum ada",
                                                      "NoTlp": "Belum ada",
                                                      "AtasNama": "Belum ada"
                                                    });
                                                    items.updateLastList();
                                                    login.delete();
                                                    Navigator.pushNamed(
                                                      context,
                                                      LandingPageScreen.route,
                                                    );
                                                  },
                                                  child: const Text('Keluar'),
                                                )
                                              ]));
                                }
                              }
                            : () {
                                showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        AlertDialog(
                                            title: const Text(
                                                'Pembayaran berhasil'),
                                            content: Container(
                                              height: 200,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Image.asset(
                                                    "images/True.png",
                                                    height: 60,
                                                    width: 60,
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                      'Selamat pembayaran zakat Fitrah anda berhasil'),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                      'Semoga rezeki anda dan sekeluarga dilipat gandakan oleh Allah SWT')
                                                ],
                                              ),
                                            ),
                                            actions: <Widget>[
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                  String Penangung =
                                                      convertLaz(data["Laz"]);
                                                  String now = DateFormat(
                                                          "dd/MM/yyyy")
                                                      .format(DateTime.now());
                                                  // var no = data["usernama"] ==
                                                  //         "Maman"
                                                  //     ?
                                                  var no = _items.length + 1;
                                                  // : _items2.length + 1;
                                                  var count =
                                                      items.getCountName(data[
                                                              "usernama"]) +
                                                          1;
                                                  // data["usernama"] == "Maman"?
                                                  bayar.addData(
                                                      {"nama": data["nama"]});
                                                  items.addData({
                                                    "Id": no.toString(),
                                                    "Count": count,
                                                    "Nama": data["nama"],
                                                    "UserName":
                                                        data["usernama"],
                                                    "Tanggal": now,
                                                    "Jenis": "Zakat Fitrah",
                                                    "Jumlah": data["jumlah"],
                                                    "Status":
                                                        "Telah diterima oleh LAZ",
                                                    "Laz": data["Laz"],
                                                    "Penangung": Penangung,
                                                    "Distribusi": "Belum ada",
                                                    "Tempat": "Belum ada",
                                                    "NoTlp": "Belum ada",
                                                    "AtasNama": "Belum ada"
                                                  });
                                                  items.updateLastList();
                                                  Navigator.pushNamed(context,
                                                      DashboardScreen.route,
                                                      arguments:
                                                          data["usernama"]);
                                                },
                                                child: const Text('Lanjutkan'),
                                              ),
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                  String Penangung =
                                                      convertLaz(data["Laz"]);
                                                  String now = DateFormat(
                                                          "dd/MM/yyyy")
                                                      .format(DateTime.now());
                                                  var no = _items.length + 1;
                                                  var count =
                                                      items.getCountName(data[
                                                              "usernama"]) +
                                                          1;
                                                  // data["usernama"] == "Maman"?
                                                  bayar.addData(
                                                      {"nama": data["nama"]});
                                                  items.addData({
                                                    "Id": no.toString(),
                                                    "Count": count,
                                                    "Nama": data["nama"],
                                                    "UserName":
                                                        data["usernama"],
                                                    "Tanggal": now,
                                                    "Jenis": data["jenis"],
                                                    "Jumlah": data["jumlah"],
                                                    "Status":
                                                        "Telah diterima oleh LAZ",
                                                    "Laz": data["Laz"],
                                                    "Penangung": Penangung,
                                                    "Distribusi": "Belum ada",
                                                    "Tempat": "Belum ada",
                                                    "NoTlp": "Belum ada",
                                                    "AtasNama": "Belum ada"
                                                  });
                                                  items.updateLastList();
                                                  login.delete();
                                                  Navigator.pushNamed(
                                                    context,
                                                    LandingPageScreen.route,
                                                  );
                                                },
                                                child: const Text('Keluar'),
                                              )
                                            ]));
                              }
                    : null,
                child: data["kindPayment"] == "emoney"
                    ? Text("Bayar")
                    : Text("Ok")),
          )
        ],
      ),
    );
  }
}
