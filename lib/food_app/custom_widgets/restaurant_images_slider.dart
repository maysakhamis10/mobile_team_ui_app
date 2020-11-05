import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:mobile_team_ui_app/resources/images.dart';

class RestaurantImagesSlider extends StatelessWidget {
  final List<String> imagesList = [
    kFood1,
    kFood2,
    kFood3,
    kFood4,
    kFood5,
    kFood6,
    kFood7,
    kFood8,
    kFood9,
    kFood10,
    kFood11,
    kFood12,
  ];

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Container(
      width: media.width,
      //height: media.height*0.8,
      child: CarouselSlider(
        items: imagesList
            .map(
              (item) => Container(
                child: Center(
                  child:
                      Image.asset(item, fit: BoxFit.fill, width: media.width),
                ),
              ),
            )
            .toList(),
        options: CarouselOptions(
          autoPlay: true,
          pageSnapping: true,
          disableCenter: false,
          enableInfiniteScroll: true,
          enlargeCenterPage: true,
          aspectRatio: 2.0,
        ),
      ),
    );
  }
}
