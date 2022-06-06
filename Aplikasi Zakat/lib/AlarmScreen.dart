import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/tes3.dart';
import 'package:intl/intl.dart';

final newData =
    dataAlarm(id: "2", jenis: "Zakat Fitrah", tanggal: "12/02/2022");
List<dataAlarm> _dataAlarm2 = <dataAlarm>[];

final List<CardListAlarm> _myWidgetList = [];

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
  final formKey = GlobalKey<FormState>();
  String Jenis = "Zakat Pendapatan";
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
                child: Form(
                  key: formKey,
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
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(2),
                        ],
                        validator: (value) {
                          if (value!.isEmpty ||
                              !RegExp('0[1-9]|1[0-9]|2[0-9]|3[0-1]')
                                  .hasMatch(value)) {
                            return "Isi dari angka 01-31";
                          } else {
                            return null;
                          }
                        },
                        onChanged: (value) {
                          if (formKey.currentState!.validate()) {
                            print("Validate");
                          } else {
                            print("NotValidate");
                          }
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
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(2),
                        ],
                        validator: (value) {
                          if (value!.isEmpty ||
                              !RegExp('0[1-9]|1[0-2]').hasMatch(value)) {
                            return "Isi dengan angka 01-12";
                          } else {
                            return null;
                          }
                        },
                        onChanged: (value) {
                          if (formKey.currentState!.validate()) {
                            print("Validate");
                          } else {
                            print("NotValidate");
                          }
                          if (value.isNotEmpty) {
                            Bulan = value;
                            print(Bulan);
                          }
                          ;
                        }),
                  ]),
                ),
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
                      _myWidgetList.add(CardListAlarm(
                          id: Idx.toString(), jenis: Jenis, tanggal: Tanggal));
                      _dataAlarm2.add(dataAlarm(
                          id: Idx.toString(), jenis: Jenis, tanggal: Tanggal));
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
          "Alarm Zakat",
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
      body: ListView.builder(
        itemCount: _dataAlarm2.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Row(
              children: [
                IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: const Text('Setel Alarm'),
                          content: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Form(
                              key: formKey,
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
                                                margin:
                                                    EdgeInsets.only(left: 10),
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
                                      labelText:
                                          "1.Masukan Tanggal pemasangan:",
                                    ),
                                    keyboardType: TextInputType.number,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.digitsOnly,
                                      LengthLimitingTextInputFormatter(2),
                                    ],
                                    validator: (value) {
                                      if (value!.isEmpty ||
                                          !RegExp('0[1-9]|1[0-9]|2[0-9]|3[0-1]')
                                              .hasMatch(value)) {
                                        return "Isi dari angka 01-31";
                                      } else {
                                        return null;
                                      }
                                    },
                                    onChanged: (value) {
                                      if (formKey.currentState!.validate()) {
                                        print("Validate");
                                      } else {
                                        print("NotValidate");
                                      }
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
                                    keyboardType: TextInputType.number,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.digitsOnly,
                                      LengthLimitingTextInputFormatter(2),
                                    ],
                                    validator: (value) {
                                      if (value!.isEmpty ||
                                          !RegExp('0[1-9]|1[0-2]')
                                              .hasMatch(value)) {
                                        return "Isi dengan angka 01-12";
                                      } else {
                                        return null;
                                      }
                                    },
                                    onChanged: (value) {
                                      if (formKey.currentState!.validate()) {
                                        print("Validate");
                                      } else {
                                        print("NotValidate");
                                      }
                                      if (value.isNotEmpty) {
                                        Bulan = value;
                                        print(Bulan);
                                      }
                                      ;
                                    }),
                              ]),
                            ),
                          ),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () => Navigator.pop(context, 'Cancel'),
                              child: const Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () {
                                var Idx = _dataAlarm2.length + 1;
                                Taun =
                                    DateFormat("yyyy").format(DateTime.now());
                                int Tahun = int.parse(Taun) + 1;
                                Tanggal =
                                    Tgl + "/" + Bulan + "/" + Tahun.toString();
                                setState(() {
                                  _myWidgetList.remove(index);
                                  _dataAlarm2.remove(_dataAlarm2[index]);
                                  // _myWidgetList.add(CardListAlarm(
                                  //     id: index.toString(),
                                  //     jenis: Jenis,
                                  //     tanggal: Tanggal));
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
                    icon: Icon(Icons.more_vert)),
                SizedBox(width: 20),
                Column(
                  children: [
                    // Text(index.toString()),
                    Text("${_dataAlarm2[index].jenis}"),
                    Text("${_dataAlarm2[index].tanggal}"),
                  ],
                ),
                SizedBox(width: 150),
                IconButton(
                    onPressed: () {
                      setState(() {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                                    title: const Text('Hapus Alarm'),
                                    content: Text(
                                        "Yakin untuk menghapus alarm ini ?"),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(context, 'Cancel'),
                                        child: const Text('Tidak'),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          setState(() {
                                            _myWidgetList.remove(index);
                                            _dataAlarm2
                                                .remove(_dataAlarm2[index]);
                                          });

                                          Navigator.pop(context, 'OK');
                                        },
                                        child: Text("Ya"),
                                      )
                                    ]));
                      });
                    },
                    icon: Icon(Icons.delete))
              ],
            ),
          );
          // return CardListAlarm(
          //     id: index.toString(),
          //     jenis: "${_dataAlarm2[index].jenis}",
          //     tanggal: "${_dataAlarm2[index].tanggal}");
        },
      ),
    );
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
                  showDialog(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                              title: const Text('Hapus Alarm'),
                              content:
                                  Text("Yakin untuk menghapus alarm ini ?"),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(context, 'Cancel'),
                                  child: const Text('Tidak'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    setState(() {
                                      _myWidgetList.remove(widget.id);
                                      _dataAlarm2.remove(
                                          _dataAlarm2[int.parse(widget.id)]);
                                    });

                                    Navigator.pop(context, 'OK');
                                  },
                                  child: Text("Ya"),
                                )
                              ]));
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
