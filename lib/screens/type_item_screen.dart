import 'package:flutter/material.dart';
import '../model/type.dart';
import '../model/image_item.dart';
import '../model/item.dart';

class TypeItemScreen extends StatefulWidget {
  static const routeName = '/add-place';
  @override
  _TypeItemScreenState createState() => _TypeItemScreenState();
}

class _TypeItemScreenState extends State<TypeItemScreen> {
  @override
  Widget build(BuildContext context) {
    final Map<String, Type> args = ModalRoute.of(context).settings.arguments;
    print(args);
    return Scaffold(
      appBar: AppBar(
        title: Text('${args['type'].name}'),
      ),
      body: Center(
        child: Text('${args['type'].id}'),
      ),
    );
  }
}
