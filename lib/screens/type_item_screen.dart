import 'package:flutter/material.dart';

class TypeItemScreen extends StatefulWidget {
  static const routeName = '/add-place';
  @override
  _TypeItemScreenState createState() => _TypeItemScreenState();
}

class _TypeItemScreenState extends State<TypeItemScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Type 1'),
      ),
    );
  }
}
