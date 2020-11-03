import 'package:flutter/material.dart';

class CategoryModel {
  String name;
  Color color1;
  Color color2;
  String image;

  CategoryModel({
    this.name,
    this.color1,
    this.color2,
    this.image,
  });

  CategoryModel.fromMap(Map<String, dynamic> map){
    this.name = map["name"];
    this.color1 = map["color1"];
    this.color2 = map["color2"];
    this.image = map["img"];
  }
}


