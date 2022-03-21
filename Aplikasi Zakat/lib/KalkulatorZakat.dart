import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_2/KalkulatorZHarta.dart';

class KalkulatorScreen extends StatelessWidget {
  const KalkulatorScreen({Key? key}) : super(key: key);
  static const route = "/Kalkulator";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Kalkulator Zakat",
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
        body: ListView(shrinkWrap: true, children: [
          CardListKalkulator(name: "Zakat Harta"),
          CardListKalkulator(name: "Zakat Profesi"),
          CardListKalkulator(name: "Zakat Temuan"),
          CardListKalkulator(name: "Zakat Ternak"),
        ]));
  }
}

class CardListKalkulator extends StatelessWidget {
  final String name;
  const CardListKalkulator({
    Key? key,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.5),
      child: Card(
          child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, kalkulatorZHartaScreen.route);
          print("klik");
        },
        child: ListTile(
          title: Text(name),
          trailing: Icon(Icons.arrow_right),
        ),
      )),
    );
  }
}
