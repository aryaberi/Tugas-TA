import 'package:flutter/material.dart';

class CardList2 extends StatelessWidget {
  final String name;
  final String route;
  final String argumen;
  const CardList2({
    Key? key,
    required this.name,
    required this.route,
    required this.argumen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.5),
      child: Card(
          child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, route, arguments: argumen);
        },
        child: ListTile(
          title: Text(name),
          trailing: Icon(Icons.arrow_right),
        ),
      )),
    );
  }
}
