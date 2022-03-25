import 'package:flutter/material.dart';

class CardList extends StatelessWidget {
  final String name;
  final String route;
  const CardList({
    Key? key,
    required this.name,
    required this.route,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.5),
      child: Card(
          child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, route);
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
