import 'package:flutter/material.dart';

class image_font_2 extends StatelessWidget {
  final String imageurl;
  const image_font_2({
    Key? key,
    required this.imageurl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(5.0),
            child: Image.asset(
              imageurl,
              height: 300,
              width: 300,
            ),
          ),
        ]);
  }
}
