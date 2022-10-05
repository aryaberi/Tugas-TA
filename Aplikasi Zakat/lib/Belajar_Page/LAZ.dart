import 'package:flutter/material.dart';
import 'package:flutter_application_2/Provider/itemLogin.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_2/LandingPage.dart';


class LAZScreen extends StatefulWidget {
  const LAZScreen({Key? key}) : super(key: key);
  static const route = "LAZ";

  @override
  LAZState createState() => LAZState();
}

List<Map> LAZ = [
  {"id": '1', "image": "images/Logo_LAZ/Logo_RZ.png", "name": "Rumah Zakat"},
  {"id": '2', "image": "images/Logo_LAZ/Logo-lazismu.png", "name": "Lazismu"},
  {"id": '3', "image": "images/Logo_LAZ/Logo_Baznas.png", "name": "BAZNAS"},
];

class LAZState extends State<LAZScreen> {
  @override
  String _Laz = "Rumah Zakat";
  String initLaz = "1";
  Widget build(BuildContext context) {
    final login = Provider.of<itemLogin>(context);
    final _login = login.allItems;
    return Scaffold(
        appBar: AppBar(
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
          actions: [
          _login.isEmpty
              ? SizedBox()
              : TextButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                                // title: const Text('Hapus Alarm'),
                                content:
                                    Text("Yakin ingin keluar dari aplikasi ?"),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(context, 'Cancel'),
                                    child: const Text('Tidak'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      login.delete();
                                      Navigator.pushNamed(
                                          context, LandingPageScreen.route);
                                    },
                                    child: Text("Ya"),
                                  )
                                ]));
                  },
                  child: Text(
                    "Keluar",
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xffffffff),
                    ),
                  )),
        ],
        ),
        body: ListView(children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Text(
                  "Tentang LAZ",
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
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
                              hint: new Text("Pilih LAZ"),
                              value: initLaz,
                              onChanged: (Value) {
                                if (Value!.isNotEmpty) {
                                  setState(() {
                                    var idx = Value;
                                    _Laz = LAZ[int.parse(idx) - 1]["name"];
                                  });
                                }
                                setState(() {
                                  initLaz = Value.toString();
                                });

                                print(_Laz);
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
                                          margin: EdgeInsets.only(left: 10),
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
                _Laz == "Rumah Zakat"
                    ? Column(
                        children: [
                          Image(
                            fit: BoxFit.cover,
                            image: AssetImage("images/Logo_LAZ/Logo_RZ.png"),
                            // height: 200,
                            // width: 200,
                          ),
                          Text(
                              "Rumah Zakat adalah lembaga filantropi yang mengelola zakat, infak sedekah, serta dana sosial lainnya melalui program-program pemberdayaan masyarakat. Program pemberdayaan direalisasikan melalui empat rumpun utama yaitu Senyum Juara (pendidikan), Senyum Sehat (kesehatan), Senyum Mandiri (pemberdayaan ekonomi), serta Senyum Lestari (inisiatif kelestarian lingkungan).",
                              style: TextStyle(fontSize: 14)),
                          SizedBox(
                            height: 10,
                          ),
                          Text("KANTOR PUSAT", style: TextStyle(fontSize: 14)),
                          Text("Jl. Turangga No. 33 Bandung",
                              style: TextStyle(fontSize: 14)),
                          Text("Call Center: 0804 100 1000",
                              style: TextStyle(fontSize: 14)),
                          Text("WA/SMS Center: 0815 7300 1555",
                              style: TextStyle(fontSize: 14)),
                          SizedBox(
                            height: 10,
                          ),
                          Text("PUSAT INFO", style: TextStyle(fontSize: 14)),
                          Text("Telp: 022-731 7400",
                              style: TextStyle(fontSize: 14)),
                          Text("Fax: 022-733 2451",
                              style: TextStyle(fontSize: 14)),
                          Text("Email: welcome@rumahzakat.org",
                              style: TextStyle(fontSize: 14)),
                          SizedBox(
                            height: 10,
                          ),
                          Text("PROGRAM KERJA", style: TextStyle(fontSize: 14)),
                          Text(
                              "Program Kesahatan, Pendidkan, Capacity Building, Ramadahan dan Qurban, Insedental Bencana, Ekonomi",
                              style: TextStyle(fontSize: 14)),
                        ],
                      )
                    : _Laz == "BAZNAS"
                        ? Column(
                            children: [
                              Image(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                    "images/Logo_LAZ/Logo_Baznas.png"),
                                // height: 200,
                                // width: 200,
                              ),
                              Text(
                                  "Badan Amil Zakat Nasional (BAZNAS) merupakan badan resmi dan satu-satunya yang dibentuk oleh pemerintah berdasarkan Keputusan Presiden RI No. 8 Tahun 2001 yang memiliki tugas dan fungsi menghimpun dan menyalurkan zakat, infaq, dan sedekah (ZIS) pada tingkat nasional. Lahirnya Undang-Undang Nomor 23 Tahun 2011 tentang Pengelolaan Zakat semakin mengukuhkan peran BAZNAS sebagai lembaga yang berwenang melakukan pengelolaan zakat secara nasional. Dalam UU tersebut, BAZNAS dinyatakan sebagai lembaga pemerintah nonstruktural yang bersifat mandiri dan bertanggung jawab kepada Presiden melalui Menteri Agama. Dengan demikian, BAZNAS bersama Pemerintah bertanggung jawab untuk mengawal pengelolaan zakat yang berasaskan: syariat Islam, amanah, kemanfaatan, keadilan, kepastian hukum, terintegrasi dan akuntabilitas.",
                                  style: TextStyle(fontSize: 14)),
                              SizedBox(
                                height: 10,
                              ),
                              Text("KANTOR LAYANAN",
                                  style: TextStyle(fontSize: 14)),
                              Text("Alamat: Jl. Matraman Raya No.134,",
                                  style: TextStyle(fontSize: 14)),
                              Text("Kb. Manggis, Kec. Matraman,",
                                  style: TextStyle(fontSize: 14)),
                              Text("Jakarta 13150",
                                  style: TextStyle(fontSize: 14)),
                              SizedBox(
                                height: 10,
                              ),
                              Text("PUSAT INFO",
                                  style: TextStyle(fontSize: 14)),
                              Text("WA: 081111555777",
                                  style: TextStyle(fontSize: 14)),
                              Text("Email: layananmuzaki@baznas.go.id",
                                  style: TextStyle(fontSize: 14)),
                              SizedBox(
                                height: 10,
                              ),
                              Text("PROGRAM KERJA",
                                  style: TextStyle(fontSize: 14)),
                              Text(
                                  "Program Kesahatan, Pendidkan, Dakwah, Kemanusian, Ekonomi",
                                  style: TextStyle(fontSize: 14)),
                            ],
                          )
                        : Column(
                            children: [
                              Image(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                    "images/Logo_LAZ/Logo-lazismu.png"),
                                // height: 200,
                                // width: 200,
                              ),
                              Text(
                                  "LAZISMU adalah lembaga zakat nasional dengan SK Menag No. 90 Tahun 2022, yang berkhidmat dalam pemberdayaan masyarakat melalui pendayagunaan dana zakat, infaq, wakaf dan dana kedermawanan lainnya baik dari perseorangan, lembaga, perusahaan dan instansi lainnya. Lazismu tidak menerima segala bentuk dana yang bersumber dari kejahatan. UU RI No. 8 Tahun 2010 Tentang Pencegahan dan Pemberantasan Tindak Pidana Pencucian Uang.",
                                  style: TextStyle(fontSize: 14)),
                              SizedBox(
                                height: 10,
                              ),
                              Text("KANTOR PUSAT",
                                  style: TextStyle(fontSize: 14)),
                              Text("Alamat Kantor: Jl. Menteng Raya No. 62,",
                                  style: TextStyle(fontSize: 14)),
                              Text("Jakarta Pusat,",
                                  style: TextStyle(fontSize: 14)),
                              Text("Email: info@lazismu.org,",
                                  style: TextStyle(fontSize: 14)),
                              SizedBox(
                                height: 10,
                              ),
                              Text("PUSAT INFO",
                                  style: TextStyle(fontSize: 14)),
                              Text("Telp: 021 3150400 ",
                                  style: TextStyle(fontSize: 14)),
                              Text("HP: 0856-1626-222",
                                  style: TextStyle(fontSize: 14)),
                              SizedBox(
                                height: 10,
                              ),
                              Text("PROGRAM KERJA",
                                  style: TextStyle(fontSize: 14)),
                              Text(
                                  "Program Kesahatan, Pendidkan, Sosial Dakwah, Kemanusian, Ekonomi, Lingkungan",
                                  style: TextStyle(fontSize: 14)),
                            ],
                          ),
              ],
            ),
          )
        ]));
  }
}
