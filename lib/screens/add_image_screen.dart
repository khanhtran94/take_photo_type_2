import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:take_picture_type_v2/model/image_item.dart';

import '../widgets/image_input.dart';
import '../providers/item_provider.dart';

import 'dart:io';

class AddImageScreen extends StatefulWidget {
  static const routeName = '/add-image';

  @override
  _AddImageScreenState createState() => _AddImageScreenState();
}

class _AddImageScreenState extends State<AddImageScreen> {
  final _titleController = TextEditingController();

  File _pickedImage;
  List<ImageItem> _listImage = [];

  void _selectImage(File pickedImage) {
    _pickedImage = pickedImage;
    _listImage.add(new ImageItem(image: _pickedImage));
  }

  void _saveImages() {
    print("save images");
    Provider.of<ItemProvider>(context, listen: false)
        .addItem(_titleController.text, 1, _listImage);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    Map<String, String> argument = ModalRoute.of(context).settings.arguments;
    print(argument);
    return Scaffold(
      appBar: AppBar(
        title: Text('Add images'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(labelText: 'Title'),
                      controller: _titleController,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ImageInput(_selectImage),
                  ],
                ),
              ),
            ),
          ),
          RaisedButton.icon(
            onPressed: _saveImages,
            icon: Icon(Icons.add),
            label: Text('Add image'),
            elevation: 0,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            color: Colors.redAccent,
          )
        ],
      ),
    );
  }
}
