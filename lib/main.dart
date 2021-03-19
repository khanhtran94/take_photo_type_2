import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './providers/type_provider.dart';
import './screens/types_list_screen.dart';

import './screens/type_item_screen.dart';
import './screens/add_image_screen.dart';
import './screens/add_image_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: TypeProvider(),
      child: MaterialApp(
        title: 'Take photos type',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: TypesListScreen(),
        routes: {
          TypeItemScreen.routeName: (ctx) => TypeItemScreen(),
          AddImageScreen.routeName: (ctx) => AddImageScreen(),
          TypesListScreen.routeName: (ctx) => TypesListScreen()
        },
      ),
    );
  }
}
