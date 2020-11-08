import 'package:flutter/material.dart';
import 'package:mobile_team_ui_app/food_app/constants/constants.dart';
import 'package:mobile_team_ui_app/food_app/custom_widgets/custom_widgets.dart';
import 'package:mobile_team_ui_app/food_app/model/categories.dart';
import 'package:mobile_team_ui_app/food_app/model/restaurants.dart';

class MoreRestaurantScreen extends StatelessWidget {
  final List<RestaurantsModel> restaurants;
  final List<CategoryModel> categories;

  MoreRestaurantScreen({@required this.restaurants, @required this.categories});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildFoodAppBar(context, kTrending),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SearchBar(),
            SizedBox(height: 12),
            TrendingRestaurants(
              restaurants: restaurants,
              categories: categories,
              fromHomePage: false,
            ),
          ],
        ),
      ),
    );
  }
}
