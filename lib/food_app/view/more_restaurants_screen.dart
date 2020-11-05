import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_team_ui_app/food_app/custom_widgets/search_bar.dart';
import 'package:mobile_team_ui_app/food_app/custom_widgets/trending_restaurants.dart';
import 'package:mobile_team_ui_app/food_app/food_app_constants/food_app_strings.dart';
import 'package:mobile_team_ui_app/food_app/model/restaurants.dart';

class MoreRestaurantScreen extends StatelessWidget {
  final List<RestaurantsModel> restaurants;

  MoreRestaurantScreen({
    @required this.restaurants,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        centerTitle: true,
        title: Text(
          kTrending,
          style: TextStyle(color: Colors.white,
              fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: Colors.white,
      body:
      Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SearchBar(),
              SizedBox(height: 12),
              TrendingRestaurants(
                restaurants: restaurants, fromHomePage: false,),
            ],
          ),
        ),
      ),
    );
  }
}
