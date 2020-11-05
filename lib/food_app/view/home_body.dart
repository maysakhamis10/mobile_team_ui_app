import 'package:flutter/material.dart';
import 'package:mobile_team_ui_app/food_app/constants/text_styles.dart';
import 'package:mobile_team_ui_app/food_app/custom_widgets/search_bar.dart';
import 'package:mobile_team_ui_app/food_app/custom_widgets/trending_restaurants.dart';
import 'package:mobile_team_ui_app/food_app/food_app_constants/food_app_strings.dart';
import 'package:mobile_team_ui_app/food_app/model/categories.dart';
import 'package:mobile_team_ui_app/food_app/model/restaurants.dart';
import '../custom_widgets/category_list.dart';
import 'more_restaurants_screen.dart';

class HomeBody extends StatelessWidget {
  final List<CategoryModel> categories;
  final List<String> friends;
  final List<RestaurantsModel> restaurants;
  var size ;
  HomeBody({
    @required this.categories,
    @required this.friends,
    @required this.restaurants,
  });

  @override
  Widget build(BuildContext context) {
    size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(height: 20),
            SearchBar(),
            buildRestaurantTitle(context),
            buildRestaurantList(),
            buildCategoryTitle(context),
            buildCategoryList(),
          ],
        ),
      ),
    );
  }

  Widget buildRestaurantTitle(BuildContext context){
    return   Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text('$kTrending' , style: kTitleTextStyle),
          GestureDetector(
            child: Text("$kSeeAll (${restaurants.length})",
                style: kClickableTextStyle),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) =>
                  MoreRestaurantScreen(restaurants: restaurants ,)));
            },
          ),
        ],
      ),
    );
  }

  Widget buildRestaurantList(){
   return TrendingRestaurants(restaurants: restaurants,fromHomePage: true ,);
  }

  Widget buildCategoryTitle(BuildContext context){
    return   Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text('$kCategory' , style: kTitleTextStyle),
          GestureDetector(
            child: Text("$kSeeAll (${restaurants.length})",
                style: kClickableTextStyle),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) =>
                  MoreRestaurantScreen(restaurants: restaurants ,)));
            },
          ),
        ],
      ),
    );
  }

  Widget buildCategoryList(){
    return  Container(
      padding: const EdgeInsets.all(12),
      height: size.height*0.4,
      child: CategoryListScreen(categories: categories),
    );
  }


}
