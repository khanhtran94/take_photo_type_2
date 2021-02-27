import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/type_provider.dart';

class TypesListScreen extends StatefulWidget {
  @override
  _TypesListScreenState createState() => _TypesListScreenState();
}

class _TypesListScreenState extends State<TypesListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: FutureBuilder(
        future:
            Provider.of<TypeProvider>(context, listen: false).fetchAndSetType(),
        builder: (ctx, snapshot) =>
            snapshot.connectionState == ConnectionState.waiting
                ? Center(child: CircularProgressIndicator())
                : Center(
                    child: Text('list type'),
                  ),
      ),
    );
  }
}
