import 'package:flutter/material.dart';
import 'package:flutter_application_2/Provider/Provider.dart';
import 'package:provider/provider.dart';

List<Map> dataRow = [
  {
    "Id": 1,
    "Nama": "Budi",
    "Tanggal": "12/02/2022",
    "Jenis": "Zakat Fitrah",
    "Status": "Telah dibayarkan"
  },
  {
    "Id": 2,
    "Nama": "Maman",
    "Tanggal": "12/02/2022",
    "Jenis": "Zakat Fitrah",
    "Status": "Telah dibayarkan"
  }
];

class LaporanScreen extends StatelessWidget {
  static const route = "/Laporan";

  const LaporanScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final items = Provider.of<itemLaporan>(context);
    final _allitems = items.allItems;
    return Scaffold(
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
        DataTable(
            columnSpacing: 10,
            dataRowHeight: 100,
            columns: const <DataColumn>[
              DataColumn(
                  label: Text(
                "No",
                textAlign: TextAlign.center,
              )),
              DataColumn(
                  label: Expanded(
                      child: Text("Detail", textAlign: TextAlign.center))),
              DataColumn(label: Text("Status", textAlign: TextAlign.center)),
              DataColumn(label: Text("")),
            ],
            rows: const <DataRow>[
              DataRow(
                cells: <DataCell>[
                  DataCell(Text("1")),
                  DataCell(cardDetail(
                      nama: "Donis Suprianto",
                      tanggal: "11/30/2021",
                      jenis: "Zakat Profesi")),
                  DataCell(Text("Diterima oleh LAZ")),
                  DataCell(Text("rincian")),
                ],
                // onSelectChanged: (bool selected) {
                //   print('row 1 pressed');
                // },
              ),
              DataRow(cells: <DataCell>[
                DataCell(Text("2")),
                DataCell(cardDetail(
                    nama: "Donis Suprianto",
                    tanggal: "12/02/2021",
                    jenis: "Zakat Harta")),
                DataCell(Text("Telah disalurkan")),
                DataCell(Text("rincian")),
              ])
            ]),
      ]),
    );
  }
}

class cardDetail extends StatelessWidget {
  final String nama;
  final String tanggal;
  final String jenis;
  const cardDetail({
    Key? key,
    required this.nama,
    required this.tanggal,
    required this.jenis,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 5),
          child: Align(
            alignment: Alignment.centerLeft,
            child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 160),
                child: Text(
                  "Nama: " + nama,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                )),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: Align(
              alignment: Alignment.centerLeft,
              child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 160),
                  child: Text("Tanggal: " + tanggal,
                      overflow: TextOverflow.ellipsis))),
        ),
        Align(
            alignment: Alignment.centerLeft,
            child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 160),
                child: Text("Jenis Zakat: " + jenis,
                    overflow: TextOverflow.ellipsis))),
      ],
    ));
  }
}
