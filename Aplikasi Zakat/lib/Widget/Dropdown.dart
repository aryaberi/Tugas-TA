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
  List<Map> Moon = [
    {"name": "Januari"},
    {"name": "Febuari"},
    {"name": "Maret"},
    {"name": "April"},
    {"name": "Mei"},
    {"name": "Juni"},
    {"name": "Juli"},
    {"name": "Agustus"},
    {"name": "September"},
    {"name": "Oktober"},
    {"name": "November"},
    {"name": "Desember"},
  ];

  List<Map> Day = [
    {"name": "1"},
    {"name": "2"},
    {"name": "3"},
    {"name": "4"},
    {"name": "5"},
    {"name": "6"},
    {"name": "7"},
    {"name": "8"},
    {"name": "9"},
    {"name": "10"},
    {"name": "11"},
    {"name": "12"},
    {"name": "13"},
    {"name": "14"},
    {"name": "15"},
    {"name": "16"},
    {"name": "17"},
    {"name": "18"},
    {"name": "19"},
    {"name": "20"},
    {"name": "21"},
    {"name": "22"},
    {"name": "23"},
    {"name": "24"},
    {"name": "25"},
    {"name": "26"},
    {"name": "27"},
    {"name": "28"},
    {"name": "29"},
    {"name": "30"},
    {"name": "31"},
  ];
  List<Map> Day2 = [
    {"name": "1"},
    {"name": "2"},
    {"name": "3"},
    {"name": "4"},
    {"name": "5"},
    {"name": "6"},
    {"name": "7"},
    {"name": "8"},
    {"name": "9"},
    {"name": "10"},
    {"name": "11"},
    {"name": "12"},
    {"name": "13"},
    {"name": "14"},
    {"name": "15"},
    {"name": "16"},
    {"name": "17"},
    {"name": "18"},
    {"name": "19"},
    {"name": "20"},
    {"name": "21"},
    {"name": "22"},
    {"name": "23"},
    {"name": "24"},
    {"name": "25"},
    {"name": "26"},
    {"name": "27"},
    {"name": "28"},
    {"name": "29"},
    {"name": "30"},
  ];
  List<Map> Day3 = [
    {"name": "1"},
    {"name": "2"},
    {"name": "3"},
    {"name": "4"},
    {"name": "5"},
    {"name": "6"},
    {"name": "7"},
    {"name": "8"},
    {"name": "9"},
    {"name": "10"},
    {"name": "11"},
    {"name": "12"},
    {"name": "13"},
    {"name": "14"},
    {"name": "15"},
    {"name": "16"},
    {"name": "17"},
    {"name": "18"},
    {"name": "19"},
    {"name": "20"},
    {"name": "21"},
    {"name": "22"},
    {"name": "23"},
    {"name": "24"},
    {"name": "25"},
    {"name": "26"},
    {"name": "27"},
    {"name": "28"},
    {"name": "29"},
  ];
  final formKey = GlobalKey<FormState>();

  String Jenis = "Zakat Pendapatan";
  String Tgl = "1";
  String Bulan = "Januari";
  String Taun = "2022";
  String Tanggal = "1/1/2022";
  String jenisBulan = "Ganjil";
  bool cat = false;
  void _update(bool b) {
    setState(() {
      cat = b;
    });
  }

  // List<Map> Day = Day1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return StatefulBuilder(
                  builder: (context, StateSetter setState) {
                    return AlertDialog(
                      title: const Text('Setel Alarm'),
                      content: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Form(
                          key: formKey,
                          child: Column(children: [
                            Text(
                              "Pilih Jenis Zakat",
                              style: TextStyle(fontSize: 16),
                            ),
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
                            Text(
                              "Pilih Tanggal Pemasangan",
                              style: TextStyle(fontSize: 16),
                            ),
                            DecoratedBox(
                              decoration: BoxDecoration(
                                border: Border.all(),
                              ),
                              child: DropdownButtonFormField(
                                isExpanded: true,
                                isDense: true,
                                hint: new Text("Pilih Jenis Zakat"),
                                value: Tgl,
                                onChanged: (Value) {
                                  setState(() {
                                    Tgl = Value.toString();
                                  });

                                  print(Jenis);
                                },
                                items: jenisBulan == "Febuari"
                                    ? Day3.map((Map map) {
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
                                      }).toList()
                                    : jenisBulan == "Ganjil"
                                        ? Day.map((Map map) {
                                            return new DropdownMenuItem<String>(
                                              value: map["name"].toString(),
                                              // value: _mySelection,
                                              child: Row(
                                                children: <Widget>[
                                                  Container(
                                                      margin: EdgeInsets.only(
                                                          left: 10),
                                                      child: Text(map["name"])),
                                                ],
                                              ),
                                            );
                                          }).toList()
                                        : Day2.map((Map map) {
                                            return new DropdownMenuItem<String>(
                                              value: map["name"].toString(),
                                              // value: _mySelection,
                                              child: Row(
                                                children: <Widget>[
                                                  Container(
                                                      margin: EdgeInsets.only(
                                                          left: 10),
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
                            Text(
                              "Pilih Bulan Pemasangan",
                              style: TextStyle(fontSize: 16),
                            ),
                            DecoratedBox(
                              decoration: BoxDecoration(
                                border: Border.all(),
                              ),
                              child: DropdownButtonFormField(
                                isExpanded: true,
                                isDense: true,
                                hint: new Text("Pilih Bulan"),
                                value: Bulan,
                                onChanged: (Value) {
                                  setState(() {
                                    Bulan = Value.toString();
                                    if (Value == "Januari" ||
                                        Value == "Maret" ||
                                        Value == "Mei" ||
                                        Value == "Juli" ||
                                        Value == "Agustus" ||
                                        Value == "Oktober" ||
                                        Value == "Desember") {
                                      jenisBulan = "Ganjil";
                                    } else if (Value == "Febuari") {
                                      jenisBulan = "Febuari";
                                    } else {
                                      jenisBulan = "Genap";
                                    }
                                  });

                                  print(Bulan);
                                },
                                items: Moon.map((Map map) {
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
                            print(_dataAlarm2.length);
                            var Idx = _dataAlarm2.length + 1;
                            Taun = DateFormat("yyyy").format(DateTime.now());

                            Tanggal = Tgl + "/" + Bulan;
                            setState(() {
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
                    );
                  },
                );
              });
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
      body: _dataAlarm2.length == 0
          ? Text("Belum ada alarm yang dipasang")
          : ListView.builder(
              itemCount: _dataAlarm2.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: Row(
                    children: [
                      SizedBox(width: 20),
                      Column(
                        children: [
                          // Text(index.toString()),
                          Text("${_dataAlarm2[index].jenis}"),
                          Text("${_dataAlarm2[index].tanggal}"),
                        ],
                      ),
                      SizedBox(width: 120),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              showDialog(
                                context: context,
                                builder: (context) => StatefulBuilder(
                                  builder: (context, StateSetter setState) {
                                    return AlertDialog(
                                      title: const Text('Setel Alarm'),
                                      content: SingleChildScrollView(
                                        scrollDirection: Axis.vertical,
                                        child: Form(
                                          key: formKey,
                                          child: Column(children: [
                                            Text(
                                              "Pilih Jenis Zakat",
                                              style: TextStyle(fontSize: 16),
                                            ),
                                            DecoratedBox(
                                              decoration: BoxDecoration(
                                                border: Border.all(),
                                              ),
                                              child: DropdownButtonFormField(
                                                isExpanded: true,
                                                isDense: true,
                                                hint: new Text(
                                                    "Pilih Jenis Zakat"),
                                                value: Jenis,
                                                onChanged: (Value) {
                                                  setState(() {
                                                    Jenis = Value.toString();
                                                  });

                                                  print(Jenis);
                                                },
                                                items: zakatMall.map((Map map) {
                                                  return new DropdownMenuItem<
                                                      String>(
                                                    value:
                                                        map["name"].toString(),
                                                    // value: _mySelection,
                                                    child: Row(
                                                      children: <Widget>[
                                                        Container(
                                                            margin:
                                                                EdgeInsets.only(
                                                                    left: 10),
                                                            child: Text(
                                                                map["name"])),
                                                      ],
                                                    ),
                                                  );
                                                }).toList(),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Text(
                                              "Pilih Tanggal Pemasangan",
                                              style: TextStyle(fontSize: 16),
                                            ),
                                            DecoratedBox(
                                              decoration: BoxDecoration(
                                                border: Border.all(),
                                              ),
                                              child: DropdownButtonFormField(
                                                isExpanded: true,
                                                isDense: true,
                                                hint: new Text(
                                                    "Pilih Jenis Zakat"),
                                                value: Tgl,
                                                onChanged: (Value) {
                                                  setState(() {
                                                    Tgl = Value.toString();
                                                  });

                                                  print(Jenis);
                                                },
                                                items: jenisBulan == "Febuari"
                                                    ? Day3.map((Map map) {
                                                        return new DropdownMenuItem<
                                                            String>(
                                                          value: map["name"]
                                                              .toString(),
                                                          // value: _mySelection,
                                                          child: Row(
                                                            children: <Widget>[
                                                              Container(
                                                                  margin: EdgeInsets
                                                                      .only(
                                                                          left:
                                                                              10),
                                                                  child: Text(map[
                                                                      "name"])),
                                                            ],
                                                          ),
                                                        );
                                                      }).toList()
                                                    : jenisBulan == "Ganjil"
                                                        ? Day.map((Map map) {
                                                            return new DropdownMenuItem<
                                                                String>(
                                                              value: map["name"]
                                                                  .toString(),
                                                              // value: _mySelection,
                                                              child: Row(
                                                                children: <
                                                                    Widget>[
                                                                  Container(
                                                                      margin: EdgeInsets.only(
                                                                          left:
                                                                              10),
                                                                      child: Text(
                                                                          map["name"])),
                                                                ],
                                                              ),
                                                            );
                                                          }).toList()
                                                        : Day2.map((Map map) {
                                                            return new DropdownMenuItem<
                                                                String>(
                                                              value: map["name"]
                                                                  .toString(),
                                                              // value: _mySelection,
                                                              child: Row(
                                                                children: <
                                                                    Widget>[
                                                                  Container(
                                                                      margin: EdgeInsets.only(
                                                                          left:
                                                                              10),
                                                                      child: Text(
                                                                          map["name"])),
                                                                ],
                                                              ),
                                                            );
                                                          }).toList(),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Text(
                                              "Pilih Bulan Pemasangan",
                                              style: TextStyle(fontSize: 16),
                                            ),
                                            DecoratedBox(
                                              decoration: BoxDecoration(
                                                border: Border.all(),
                                              ),
                                              child: DropdownButtonFormField(
                                                isExpanded: true,
                                                isDense: true,
                                                hint: new Text("Pilih Bulan"),
                                                value: Bulan,
                                                onChanged: (Value) {
                                                  setState(() {
                                                    Bulan = Value.toString();
                                                    if (Value == "Januari" ||
                                                        Value == "Maret" ||
                                                        Value == "Mei" ||
                                                        Value == "Juli" ||
                                                        Value == "Agustus" ||
                                                        Value == "Oktober" ||
                                                        Value == "Desember") {
                                                      jenisBulan = "Ganjil";
                                                    } else if (Value ==
                                                        "Febuari") {
                                                      jenisBulan = "Febuari";
                                                    } else {
                                                      jenisBulan = "Genap";
                                                    }
                                                  });

                                                  print(Bulan);
                                                },
                                                items: Moon.map((Map map) {
                                                  return new DropdownMenuItem<
                                                      String>(
                                                    value:
                                                        map["name"].toString(),
                                                    // value: _mySelection,
                                                    child: Row(
                                                      children: <Widget>[
                                                        Container(
                                                            margin:
                                                                EdgeInsets.only(
                                                                    left: 10),
                                                            child: Text(
                                                                map["name"])),
                                                      ],
                                                    ),
                                                  );
                                                }).toList(),
                                              ),
                                            ),
                                          ]),
                                        ),
                                      ),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context, 'Cancel'),
                                          child: const Text('Cancel'),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            var Idx = _dataAlarm2.length + 1;
                                            Taun = DateFormat("yyyy")
                                                .format(DateTime.now());

                                            Tanggal = Tgl + "/" + Bulan;
                                            setState(() {
                                              _myWidgetList.remove(index);
                                              _dataAlarm2
                                                  .remove(_dataAlarm2[index]);
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
                                    );
                                  },
                                ),
                              );
                            });
                          },
                          icon: Icon(Icons.edit)),
                      SizedBox(width: 10),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      AlertDialog(
                                          title: const Text('Hapus Alarm'),
                                          content: Text(
                                              "Yakin untuk menghapus alarm ini ?"),
                                          actions: <Widget>[
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  context, 'Cancel'),
                                              child: const Text('Tidak'),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                setState(() {
                                                  _myWidgetList.remove(index);
                                                  _dataAlarm2.remove(
                                                      _dataAlarm2[index]);
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
