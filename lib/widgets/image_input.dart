import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspaths;
import 'dart:io';

class ImageInput extends StatefulWidget {
  @override
  _ImageInputState createState() => _ImageInputState();

  final Function onSelectImage;
  ImageInput(this.onSelectImage);
}

class _ImageInputState extends State<ImageInput> {
  File _storedImage;

  Future<void> _takePicture() async {
    final imageFile =
        await ImagePicker.pickImage(source: ImageSource.camera, maxWidth: 600);

    if (imageFile == null) {
      return;
    }
    setState(() {
      _storedImage = File(imageFile.path);
    });
    final appDir = await syspaths.getApplicationDocumentsDirectory();
    final fileName = path.basename(imageFile.path);
    final savedImage = await imageFile.copy('${appDir.path}.$fileName');
    widget.onSelectImage(savedImage);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 150,
          height: 150,
          decoration:
              BoxDecoration(border: Border.all(width: 1, color: Colors.green)),
          child: _storedImage != null
              ? Image.file(
                  _storedImage,
                  fit: BoxFit.cover,
                  width: double.infinity,
                )
              : Text(
                  'No image take',
                  textAlign: TextAlign.center,
                ),
          alignment: Alignment.center,
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
            child: FlatButton.icon(
          onPressed: _takePicture,
          icon: Icon(Icons.camera),
          label: Text('Take camera'),
          textColor: Theme.of(context).primaryColor,
        ))
      ],
    );
  }
}
