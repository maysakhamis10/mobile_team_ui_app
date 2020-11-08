import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mobile_team_ui_app/food_app/custom_widgets/food_app_bar.dart';
import 'package:mobile_team_ui_app/food_app/custom_widgets/restaurant_images_slider.dart';
import 'package:mobile_team_ui_app/food_app/food_app_constants/food_app_constants.dart';
import 'package:mobile_team_ui_app/food_app/model/categories.dart';
import 'package:mobile_team_ui_app/food_app/model/restaurants.dart';
import 'package:mobile_team_ui_app/resources/images.dart';
import '../custom_widgets/categories_grid.dart';

class RestaurantDetailsScreen extends StatelessWidget {
  final RestaurantsModel restaurant;
  final List<CategoryModel> categories;

  RestaurantDetailsScreen(
      {@required this.restaurant, @required this.categories});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: buildFoodAppBar(context, kRestaurantDetails),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: 5,
            ),
            RestaurantImagesSlider(),
            buildRestaurantTitle(size),
            buildRestaurantDesc(size),
            Container(
              padding: const EdgeInsets.all(12),
              height: size.height * 0.4,
              child: CategoriesGrid(categories: categories),
            ),
            //SizedBox(height: 100,)
          ],
        ),
      ),
    );
  }

  Widget buildRestaurantTitle(Size size) {
    return Container(
      height: size.height * 0.1,
      margin: EdgeInsets.only(left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            restaurant.title,
            style: kTitleTextStyle,
          ),
          Image.asset(
            kGiphy,
            width: size.width * 0.2,
            height: size.height * 0.2,
          ),
          Text(
            restaurant.rating.toString(),
          ),
        ],
      ),
    );
  }

  Widget buildRestaurantDesc(Size size) {
    return Container(
      height: size.height * 0.1,
      margin: EdgeInsets.only(left: 20, right: 20),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(
              restaurant.address,
              style: kSubTitleTextStyle,
            ),
          ),
          Image.asset(
            kLocation,
            width: 100,
          ),
        ],
      ),
    );
  }
}
