import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:flutter_application_2/Provider/Provider.dart';
import 'package:provider/provider.dart';

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

class zakatMall_3Screen extends StatefulWidget {
  zakatMall_3Screen({Key? key}) : super(key: key);

  static const route = "/ZakatMall3";

  @override
  State<zakatMall_3Screen> createState() => _zakatMall_3State();
}

class _zakatMall_3State extends State<zakatMall_3Screen> {
  final formKey = GlobalKey<FormState>();
  bool isButtonActive = false;
  @override
  Widget build(BuildContext context) {
    final data =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final items = Provider.of<itemLaporan>(context);
    final _items = items.allItems;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Laporan Zakat",
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
        actions: [Icon(Icons.home)],
      ),
      body: ListView(
        children: [
          Padding(
              padding: const EdgeInsets.only(top: 50.0, left: 8.0, right: 8.0),
              child: Column(
                children: [
                  Text(
                      "Untuk melakukan pembayaran menggunakan metode " +
                          data["methodPayment"] +
                          " silahkan masukan no hp yang terhubung dengan " +
                          data["methodPayment"],
                      style: TextStyle(fontSize: 16)),
                  Form(
                      key: formKey,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 20.0, left: 8.0, right: 8.0),
                        child: TextFormField(
                          decoration:
                              InputDecoration(labelText: "Masukan no hp :"),
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
                                isButtonActive = true;
                              });
                              print("validate");
                            } else {
                              setState(() {
                                isButtonActive = false;
                              });
                            }
                          },
                          style: TextStyle(fontSize: 20),
                        ),
                      )),
                ],
              )),
          SizedBox(height: 90),
          Padding(
            padding: const EdgeInsets.all(20),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    onSurface: Colors.lightGreen,
                    primary: Colors.lightGreen,
                    minimumSize: const Size(200, 50)),
                onPressed: isButtonActive
                    ? () {
                        showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                                    title: const Text('Pembayaran berhasil'),
                                    content: Container(
                                      height: 130,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Icon(Icons.check),
                                          Text(
                                              'Selamat pembayaran zakat fitrah anda berhasil'),
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
                                          String now = DateFormat("dd/MM/yyyy")
                                              .format(DateTime.now());
                                          var no = _items.length + 1;
                                          items.addData({
                                            "Id": no.toString(),
                                            "Nama": data["nama"],
                                            "Tanggal": now,
                                            "Jenis": data["jenis"],
                                            "Jumlah": data["jumlah"],
                                            "Status": "Telah diterima oleh LAZ",
                                            "Laz": data["Laz"],
                                            "Penangung": Penangung,
                                            "Distribusi": "Belum ada",
                                            "Tempat": "Belum ada",
                                            "NoTlp": "Belum ada",
                                            "AtasNama": "Belum ada"
                                          });
                                        },
                                        child: const Text('Ok'),
                                      )
                                    ]));
                      }
                    : null,
                child: Text("Bayar")),
          )
        ],
      ),
    );
  }
}
