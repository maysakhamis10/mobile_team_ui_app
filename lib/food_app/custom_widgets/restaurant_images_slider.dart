import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:carousel_slider/carousel_options.dart';


class RestaurantImagesSlider extends StatelessWidget{

  final List<String> imagesList = [
    'assets/images/food_app/food1.jpeg',
    'assets/images/food_app/food2.jpeg',
    'assets/images/food_app/food3.jpeg',
    'assets/images/food_app/food4.jpeg',
    'assets/images/food_app/food5.jpeg',
    'assets/images/food_app/food6.jpeg',
    'assets/images/food_app/food7.jpeg',
    'assets/images/food_app/food8.jpeg',
    'assets/images/food_app/food9.jpeg',
    'assets/images/food_app/food10.jpeg',
    'assets/images/food_app/food11.jpeg',
    'assets/images/food_app/food12.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Container(
        width: media.width,
        //height: media.height*0.8,
        child: CarouselSlider(
          items: imagesList.map((item) =>
              Container(
                child:

                Center(child: Image.asset(item,
                        fit: BoxFit.fill,
                        width: media.width)


                ),
              )).toList(),
          options: CarouselOptions(
            autoPlay: true,
            pageSnapping: true,
            disableCenter: false,
            enableInfiniteScroll: true,
            enlargeCenterPage: true,
            aspectRatio: 2.0,
          ),
        )
    );



  }


}

