import 'package:flutter/material.dart';

class ListDetailPage extends StatelessWidget {
  String img;
  String name;
  int id;
  ListDetailPage(this.img, this.name, this.id);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image(image: AssetImage('assets/$img')),
        Text(name),
      ]
    );
  }
}