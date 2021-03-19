import 'package:flutter/material.dart';
import '../model/type.dart';
import '../model/image_item.dart';
import '../model/item.dart';
import '../widgets/item_widget.dart';
import '../screens/add_image_screen.dart';

class TypeItemScreen extends StatefulWidget {
  static const routeName = '/type-item';
  @override
  _TypeItemScreenState createState() => _TypeItemScreenState();
}

class _TypeItemScreenState extends State<TypeItemScreen> {
  @override
  Widget build(BuildContext context) {
    // final Map<String, Type> args = ModalRoute.of(context).settings.arguments;
    final Type args = ModalRoute.of(context).settings.arguments;

    var mediaQueryData = MediaQuery.of(context);
    final double widthScreen = mediaQueryData.size.width;
    final double appBarHeight = kToolbarHeight;
    final double paddingTop = mediaQueryData.padding.top;
    final double paddingBottom = mediaQueryData.padding.bottom;
    final double heightScreen =
        mediaQueryData.size.height - paddingBottom - paddingTop - appBarHeight;

    print(args);
    return Scaffold(
      appBar: AppBar(
        title: Text('${args.name}'),
      ),
      body: Center(
          child: new GridView.count(
        crossAxisCount: 2,
        childAspectRatio: widthScreen / heightScreen,
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        crossAxisSpacing: 10,
        children: [
          ItemWidget(),
          ItemWidget(),
          ItemWidget(),
          ItemWidget(),
          ItemWidget(),
          ItemWidget(),
          ItemWidget(),
          ItemWidget(),
          ItemWidget(),
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(AddImageScreen.routeName,
              arguments: {'type_id': '${args.id}'});
        },
        child: Icon(Icons.add_a_photo),
      ),
    );
  }
}
