import 'package:flutter/material.dart';
import 'package:flutter_application_2/tes3.dart';
import 'package:intl/intl.dart';

final newData =
    dataAlarm(id: "2", jenis: "Zakat Fitrah", tanggal: "12/02/2022");
List<dataAlarm> _dataAlarm2 = <dataAlarm>[];

class AlarmScrenn extends StatefulWidget {
  const AlarmScrenn({Key? key}) : super(key: key);
  static const route = "/Alarm";
  @override
  _AlarmScrennState createState() => _AlarmScrennState();
}

class _AlarmScrennState extends State<AlarmScrenn> {
  List<Map> zakatMall = [
    {"name": "Zakat Pendapatan"},
    {"name": "Zakat Tabungan"},
    {"name": "Zakat Perniagaan"},
    {"name": "Zakat Emas"},
    {"name": "Zakat Perak"},
    {"name": "Zakat Fidyah"}
  ];

  String Jenis = "Zakat Harta";
  String Tgl = "1";
  String Bulan = "1";
  String Taun = "2022";
  String Tanggal = "1/1/2022";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                title: const Text('Setel Alarm'),
                content: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(children: [
                    DecoratedBox(
                      decoration: BoxDecoration(
                        border: Border.all(),
                      ),
                      child: DropdownButtonFormField(
                        isExpanded: true,
                        isDense: true,
                        hint: new Text("Pilih Jenis Zakat"),
                        value: Jenis,
                        onChanged: (Value) {
                          setState(() {
                            Jenis = Value.toString();
                          });

                          print(Jenis);
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
                    TextFormField(
                        decoration: InputDecoration(
                          labelText: "1.Masukan Tanggal pemasangan:",
                        ),
                        onChanged: (value) {
                          if (value.isNotEmpty) {
                            Tgl = value;
                            print(Tgl);
                          }
                          ;
                        }),
                    TextFormField(
                        decoration: InputDecoration(
                          labelText: "2.Masukan Bulan pemasangan:",
                        ),
                        onChanged: (value) {
                          if (value.isNotEmpty) {
                            Bulan = value;
                            print(Bulan);
                          }
                          ;
                        }),
                  ]),
                ),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'Cancel'),
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () {
                      var Idx = _dataAlarm2.length + 1;
                      Taun = DateFormat("yyyy").format(DateTime.now());
                      int Tahun = int.parse(Taun) + 1;
                      Tanggal = Tgl + "/" + Bulan + "/" + Tahun.toString();
                      setState(() {
                        _dataAlarm2.add(dataAlarm(
                            id: Idx.toString(),
                            jenis: Jenis,
                            tanggal: Tanggal));
                      });
                      Navigator.pop(context, 'OK');
                    },
                    child: const Text('OK'),
                  ),
                ],
              ),
            );
          },
          child: Icon(Icons.add),
        ),
        appBar: AppBar(
          title: Text(
            "Laporan Zakat",
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
          ..._dataAlarm2.map((items) {
            return CardListAlarm(
                jenis: items.jenis, tanggal: items.tanggal, id: items.id);
          }).toList(),
        ]));
  }
}

class CardListAlarm extends StatefulWidget {
  final String id;
  final String jenis;
  final String tanggal;
  const CardListAlarm({
    Key? key,
    required this.id,
    required this.jenis,
    required this.tanggal,
  }) : super(key: key);

  @override
  State<CardListAlarm> createState() => _CardListAlarmState();
}

class _CardListAlarmState extends State<CardListAlarm> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.5),
      child: Card(
          child: InkWell(
        onTap: () {
          //  context: context,
        },
        child: ListTile(
          title: Align(
            alignment: Alignment.centerLeft,
            child: Column(
              children: [Text(widget.jenis + widget.id), Text(widget.tanggal)],
            ),
          ),
          trailing: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  _dataAlarm2.removeWhere((item) => item.id == widget.id);
                },
              );
            },
          ),
        ),
      )),
    );
  }
}

class dataAlarm {
  final String id;
  final String jenis;
  final String tanggal;

  const dataAlarm(
      {required this.id, required this.jenis, required this.tanggal});
}
