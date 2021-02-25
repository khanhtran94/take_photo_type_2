import '../model/image_item.dart';

class Item {
  final int id;
  final String name;
  final int typeId;
  final List<ImageItem> imageItems;

  Item({this.id, this.name, this.typeId, this.imageItems});
}
