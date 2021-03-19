import 'package:flutter/material.dart';

import '../model/type.dart';
import '../helpers/db_helper.dart';
import 'dart:io';
import 'package:flutter/foundation.dart';
import '../model/item.dart';
import '../model/image_item.dart';

import '../helpers/db_helper.dart';

class TypeProvider with ChangeNotifier {
  List<Type> _typeList = [];

  List<Type> get typeList {
    return [..._typeList];
  }

  List<Item> _items = [];

  List<Item> get items {
    return [..._items];
  }

  void addType(String name, String description) {
    final newType = Type(name: name, description: description);
    _typeList.add(newType);
    notifyListeners();
    DBHelper.insert(
        'types', {'name': newType.name, 'description': newType.description});
  }

  Future<void> fetchAndSetType() async {
    final dataList = await DBHelper.getData('types');

    _typeList = dataList
        .map((item) => Type(
            id: item['id'],
            name: item['name'],
            description: item['description']))
        .toList();
    notifyListeners();
  }

  void addItem(String titleItem, int typeId, List<ImageItem> listImage) {
    final newItem = Item(
        id: DateTime.now().toString(),
        typeId: typeId,
        imageItems: listImage,
        name: titleItem);

    _items.add(newItem);
    notifyListeners();

    DBHelper.insert('items',
        {'id': newItem.id, 'type_id': newItem.typeId, 'name': newItem.name});

    for (ImageItem item in listImage) {
      DBHelper.insert(
          'image_items', {'item_id': newItem.id, 'image': item.image.path});
    }
  }

  // todo: xem tat cac cac anh cua item theo id cua item
  Future<void> fetchAndSetItems() async {
    final dataList = await DBHelper.getData('items');
  }
  //todo: bo sung sau khi lay cac item cua type theo id
}
