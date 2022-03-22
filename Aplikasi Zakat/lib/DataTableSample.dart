import 'package:flutter/material.dart';
import 'package:flutter_application_2/Provider/Provider.dart';
import 'package:provider/provider.dart';

import 'Scroll _view.dart';

class DataTableSample extends StatefulWidget {
  const DataTableSample({Key? key}) : super(key: key);
  static const route = "/Laporan2";
  @override
  _DataTableSampleState createState() => _DataTableSampleState();
}

class _DataTableSampleState extends State<DataTableSample> {
  void _getSelectedRowInfo(dynamic name, dynamic price) {
    print('Name:$name  price: $price');
  }

  @override
  Widget build(BuildContext context) {
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
        body: Column(children: [
          Expanded(
            child: ListView(children: [
              DataTable(
                columnSpacing: 10,
                dataRowHeight: 100,
                onSelectAll: (b) {},
                sortAscending: true,
                columns: <DataColumn>[
                  DataColumn(
                    label: Text('No'),
                  ),
                  DataColumn(
                    label: Text('Detail'),
                  ),
                  DataColumn(
                    label: Text('Status'),
                  ),
                  DataColumn(
                    label: Text(''),
                  ),
                ],
                rows: _items
                    .map(
                      (Map itemRow) => DataRow(
                        cells: [
                          DataCell(
                            Text(itemRow["Id"]),
                            showEditIcon: false,
                            placeholder: false,
                          ),
                          DataCell(
                            cardDetail(
                                nama: itemRow["Nama"],
                                tanggal: itemRow["Tanggal"],
                                jenis: itemRow["Jenis"]),
                            placeholder: false,
                            // onTap: () {
                            //   _getSelectedRowInfo(itemRow["Id"], itemRow["Nama"]);
                            // },
                          ),
                          DataCell(
                            Text(itemRow["Status"]),
                            showEditIcon: false,
                            placeholder: false,
                          ),
                          DataCell(
                            Text("rincian"),
                            placeholder: false,
                            onTap: () {
                              showDialog<String>(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      AlertDialog(
                                          title: const Text(
                                              'Rincian Pembayaran Zakat'),
                                          content: Container(
                                            height: 400,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text("Anda telah membayarkat " +
                                                    itemRow["Jenis"]),
                                                Text(
                                                  "Pada Tanggal : " +
                                                      itemRow["Tanggal"],
                                                ),
                                                Text("Kepada : " +
                                                    itemRow["Laz"]),
                                                Text("Atas Nama : " +
                                                    itemRow["Nama"]),
                                                Text("Sebesar : " +
                                                    itemRow["Jumlah"]),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                itemRow["Status"] ==
                                                        "Telah diterima oleh LAZ"
                                                    ? Text("Saat ini Zakat anda telah diterima oleh LAZ yang bersangkutan, Anda bisa menghubungi " +
                                                        itemRow["Penangung"] +
                                                        "Untuk informasi lebih seputar status Zakat anda")
                                                    : Column(children: [
                                                        Text("No Penanggung Jawab :" +
                                                            itemRow[
                                                                "Penangung"]),
                                                        Text(
                                                            "Telah disalurkan ke " +
                                                                itemRow[
                                                                    "Tempat"]),
                                                        Align(
                                                          alignment:
                                                              Alignment.topLeft,
                                                          child: Text(
                                                            "Pada Tanggal : " +
                                                                itemRow[
                                                                    "Distribusi"],
                                                          ),
                                                        ),
                                                        Text(
                                                          "Anda dapat menghubungi No " +
                                                              itemRow["NoTlp"] +
                                                              " Selaku " +
                                                              itemRow[
                                                                  "AtasNama"] +
                                                              " untuk memastikan",
                                                        )
                                                      ]),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                              ],
                                            ),
                                          ),
                                          actions: <Widget>[
                                            TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: const Text('Ok'),
                                            )
                                          ]));
                            },
                          ),
                        ],
                      ),
                    )
                    .toList(),
              ),
            ]),
          )
        ]));
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
