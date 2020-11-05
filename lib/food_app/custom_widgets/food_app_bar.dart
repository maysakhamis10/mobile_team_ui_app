import 'package:flutter/material.dart';

AppBar buildFoodAppBar(BuildContext context, String title) {
  return AppBar(
    backgroundColor: Colors.white,
    leading: IconButton(
        icon: Icon(Icons.arrow_back_ios, color: Colors.black),
        onPressed: () {
          Navigator.pop(context);
        }),
    centerTitle: true,
    title: Text(
      title,
      style: TextStyle(color: Colors.black),
    ),
  );
}
