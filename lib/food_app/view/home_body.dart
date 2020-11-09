import 'package:flutter/material.dart';
import 'package:mobile_team_ui_app/food_app/constants/constants.dart';
import 'package:mobile_team_ui_app/food_app/custom_widgets/custom_widgets.dart';
import 'package:mobile_team_ui_app/food_app/custom_widgets/friends_grid.dart';
import 'package:mobile_team_ui_app/food_app/model/categories.dart';
import 'package:mobile_team_ui_app/food_app/model/restaurants.dart';
import 'more_restaurants_screen.dart';

class HomeBody extends StatelessWidget {
  final List<CategoryModel> categories;
  final List<String> friends;
  final List<String> imagesList;
  final List<RestaurantsModel> restaurants;

  HomeBody({
    @required this.categories,
    @required this.friends,
    @required this.restaurants,
    @required this.imagesList
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
              _buildTitle(context, kTrending),
              _buildRestaurantList(),
              _buildTitle(context, kCategory),
              _buildCategoryList(),
              _buildTitle(context, kFriends),
              _buildFriendsList(),

            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTitle(BuildContext context, String title) {
    return Container(
        padding: const EdgeInsets.only(left: 12, right: 2, top: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
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
                      imagesList: imagesList,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
    );
  }

  Widget _buildRestaurantList() {
    return TrendingRestaurants(
      restaurants: restaurants,
      categories: categories,
      fromHomePage: true,
      imagesList: imagesList,
    );
  }

  Widget _buildCategoryList() {
    return CategoriesGrid(categories: categories);
  }

  Widget _buildFriendsList() {
    return FriendsGrid(friends: friends);
  }

}
