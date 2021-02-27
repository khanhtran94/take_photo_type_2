import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/type_provider.dart';

class TypeInput extends StatefulWidget {
  final Function addType;
  TypeInput({this.addType});

  @override
  _TypeInputState createState() => _TypeInputState();
}

class _TypeInputState extends State<TypeInput> {
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();

  void _submitData() {
    final enterName = _nameController.text;
    final enterDescription = _descriptionController.text;

    // widget.addType(enterName, enterDescription);
    Provider.of<TypeProvider>(context, listen: false)
        .addType(enterName, enterDescription);
    Navigator.of(context).pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Name'),
              controller: _nameController,
              onSubmitted: (_) => _submitData(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Description'),
              controller: _descriptionController,
              onSubmitted: (_) => _submitData(),
            ),
            RaisedButton(
                textColor: Colors.blue,
                color: Colors.amberAccent,
                onPressed: _submitData,
                child: Text('Add type'))
          ],
        ),
      ),
    );
  }
}
