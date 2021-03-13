import 'package:flutter/material.dart';
import '../model/item.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ItemWidget extends StatelessWidget {
  final Item item;
  ItemWidget({this.item});

  @override
  Widget build(BuildContext context) {
    List<String> urlImg = [
      'http://via.placeholder.com/210x320',
      'http://via.placeholder.com/210x320',
      'http://via.placeholder.com/210x320',
      'http://via.placeholder.com/210x320'
    ];
    return Container(
      child: Column(
        children: [
          Container(
            height: 220,
            color: Colors.blue,
            child: CarouselSlider.builder(
              options: CarouselOptions(
                autoPlay: false,
              ),
              itemCount: urlImg.length,
              itemBuilder: (BuildContext context, int itemIndex, _) =>
                  Container(
                child: Image.network(
                  urlImg[itemIndex],
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Text('${DateTime.now()}')
        ],
      ),
    );
  }
}
