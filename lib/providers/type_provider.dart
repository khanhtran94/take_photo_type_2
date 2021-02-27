import 'package:flutter/material.dart';

import '../model/type.dart';
import '../helpers/db_helper.dart';

class TypeProvider with ChangeNotifier {
  List<Type> _typeList = [];

  List<Type> get typeList {
    return [..._typeList];
  }

  void addType(int id, String name, String description) {
    final newType = Type(id: id, name: name, description: description);
    _typeList.add(newType);
    notifyListeners();
    DBHelper.insert('types', {
      'id': newType.id,
      'name': newType.name,
      'description': newType.description
    });
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
}
