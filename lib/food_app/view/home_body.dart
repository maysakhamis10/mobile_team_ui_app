import 'package:flutter/material.dart';
import 'package:mobile_team_ui_app/food_app/constants/constants.dart';
import 'package:mobile_team_ui_app/food_app/custom_widgets/custom_widgets.dart';
import 'package:mobile_team_ui_app/food_app/model/categories.dart';
import 'package:mobile_team_ui_app/food_app/model/restaurants.dart';
import 'more_restaurants_screen.dart';

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
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: SearchBar(),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildTitle(context, kTrending),
              buildRestaurantList(),
              buildTitle(context, kCategory),
              buildCategoryList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12, top: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text('$title', style: kTitleTextStyle),
          GestureDetector(
            child: Text("$kSeeAll (${restaurants.length})",
                style: kClickableTextStyle),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MoreRestaurantScreen(
                    restaurants: restaurants,
                    categories: categories,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget buildRestaurantList() {
    return TrendingRestaurants(
      restaurants: restaurants,
      categories: categories,
      fromHomePage: true,
    );
  }

  Widget buildCategoryList() {
    return CategoriesGrid(categories: categories);
  }
}
