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
                : Consumer<TypeProvider>(
                    child: Center(
                      child: Text('No item'),
                    ),
                    builder: (ctx, typeProvider, ch) =>
                        typeProvider.typeList.length <= 0
                            ? ch
                            : ListView.builder(
                                itemBuilder: (ctx, i) => ListTile(
                                  title: Text(typeProvider.typeList[i].name),
                                ),
                                itemCount: typeProvider.typeList.length,
                              ),
                  ),
      ),
    );
  }
}
