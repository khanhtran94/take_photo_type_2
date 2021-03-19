import 'dart:io';
import 'package:flutter/foundation.dart';
import '../model/item.dart';
import '../model/image_item.dart';

import '../helpers/db_helper.dart';

class ItemProvider with ChangeNotifier {
  List<Item> _items = [];

  List<Item> get items {
    return [..._items];
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
}
