import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/type_provider.dart';
import '../widgets/type_input.dart';
import '../model/type.dart';

class TypesListScreen extends StatefulWidget {
  @override
  _TypesListScreenState createState() => _TypesListScreenState();
}

class _TypesListScreenState extends State<TypesListScreen> {
  void _startAddNewType(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            behavior: HitTestBehavior.opaque,
            child: TypeInput(),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                _startAddNewType(context);
              })
        ],
      ),
      body: FutureBuilder(
        future:
            Provider.of<TypeProvider>(context, listen: false).fetchAndSetType(),
        builder: (ctx, snapshot) => snapshot.connectionState ==
                ConnectionState.waiting
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
                              leading: CircleAvatar(
                                child: Text('${typeProvider.typeList[i].id}'),
                              ),
                              title: Text(typeProvider.typeList[i].name),
                              subtitle:
                                  Text(typeProvider.typeList[i].description),
                            ),
                            itemCount: typeProvider.typeList.length,
                          ),
              ),
      ),
    );
  }
}
