import 'package:flutter/material.dart';
import '../model/item.dart';

class ItemWidget extends StatelessWidget {
  final Item item;
  ItemWidget({this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Image.network('http://via.placeholder.com/200x320'),
          Text('name item')
        ],
      ),
    );
  }
}
