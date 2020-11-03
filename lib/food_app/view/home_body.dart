import 'package:flutter/material.dart';
import 'package:mobile_team_ui_app/food_app/custom_widgets/trending_restaurants.dart';
import 'package:mobile_team_ui_app/food_app/model/categories.dart';
import 'package:mobile_team_ui_app/food_app/model/restaurants.dart';

class HomeBody extends StatelessWidget {
  final List<CategoryModel> categories;
  final List<String> friends;
  final List<RestaurantsModel> restaurants;

  HomeBody({
    @required this.categories,
    @required this.friends,
    @required this.restaurants,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        TrendingRestaurants(restaurants: restaurants),
      ],
    );
  }
}
