import 'package:flutter/material.dart';
import 'package:mobile_team_ui_app/food_app/food_app_constants/food_app_strings.dart';

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Card(
        child: TextField(
          decoration: InputDecoration(

            prefixIcon: Icon(Icons.search),
            suffixIcon: Icon(Icons.filter_list),
            labelText: kSearch,
          ),
        ),
      ),
    );
  }
}
