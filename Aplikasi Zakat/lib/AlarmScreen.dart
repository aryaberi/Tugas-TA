import 'package:flutter/material.dart';
import 'package:flutter_application_2/tes3.dart';

List<Map> data2 = [
  {"Id": "1", "Jenis": "Zakat Harta", "Tanggal": "12/03/2022"},
  {"Id": "2", "Jenis": "Zakat Profesi", "Tanggal": "12/03/2022"},
];
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
  final List<Map<String, dynamic>> data = [
    {"Id": "1", "Jenis": "Zakat Harta", "Tanggal": "12/03/2022"},
    {"Id": "2", "Jenis": "Zakat Profesi", "Tanggal": "12/03/2022"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            var Idx = _dataAlarm2.length + 1;
            setState(() {
              _dataAlarm2.add(dataAlarm(
                  id: Idx.toString(), jenis: "ujang", tanggal: "12/04/2021"));
            });
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
          TextButton(
            onPressed: () {},
            child: const Text('Show Dialog'),
          )
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
                  showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: const Text('AlertDialog Title'),
                      content: const Text('AlertDialog description'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () => Navigator.pop(context, 'Cancel'),
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              _dataAlarm2.removeWhere(
                                  (element) => element.id == widget.id);
                            });

                            Navigator.pop(context, 'OK');
                          },
                          child: const Text('OK'),
                        ),
                      ],
                    ),
                  );
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
