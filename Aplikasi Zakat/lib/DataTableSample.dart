import 'package:flutter/material.dart';

class DataTableSample extends StatefulWidget {
  const DataTableSample({Key? key}) : super(key: key);
  static const route = "/Laporan2";
  @override
  _DataTableSampleState createState() => _DataTableSampleState();
}

class _DataTableSampleState extends State<DataTableSample> {
  List<Map> dataRow = [
    {
      "Id": "1",
      "No": "1",
      "Nama": "Budi",
      "Tanggal": "12/02/2022",
      "Jenis": "Zakat Fitrah",
      "Status": "Telah dibayarkan"
    },
    {
      "Id": "2",
      "No": "2",
      "Nama": "Maman",
      "Tanggal": "12/02/2022",
      "Jenis": "Zakat Fitrah",
      "Status": "Telah dibayarkan"
    }
  ];

  void _getSelectedRowInfo(dynamic name, dynamic price) {
    print('Name:$name  price: $price');
  }

  @override
  Widget build(BuildContext context) {
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
      body: Container(
        child: DataTable(
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
          rows: dataRow
              .map(
                (Map itemRow) => DataRow(
                  cells: [
                    DataCell(
                      Text(itemRow["No"]),
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
                        _getSelectedRowInfo(itemRow["Id"], itemRow["Nama"]);
                      },
                    ),
                  ],
                ),
              )
              .toList(),
        ),
      ),
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
