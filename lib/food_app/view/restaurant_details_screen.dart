import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_team_ui_app/food_app/constants/constants.dart';
import 'package:mobile_team_ui_app/food_app/custom_widgets/custom_widgets.dart';
import 'package:mobile_team_ui_app/food_app/model/categories.dart';
import 'package:mobile_team_ui_app/food_app/model/restaurants.dart';
import 'package:mobile_team_ui_app/food_app/view/theme_bloc/bloc.dart';
import 'package:mobile_team_ui_app/resources/images.dart';

class RestaurantDetailsScreen extends StatelessWidget {
  final RestaurantsModel restaurant;
  final List<CategoryModel> categories;
  final List<String> imagesList;

  RestaurantDetailsScreen(
      {@required this.restaurant,
      @required this.categories,
      @required this.imagesList});

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
            RestaurantImagesSlider(
              imagesList: imagesList,
            ),
            _buildRestaurantTitle(size),
            _buildRestaurantDesc(size),
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

  Widget _buildRestaurantTitle(Size size) {
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

  Widget _buildRestaurantDesc(Size size) {
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
          BlocBuilder<FoodThemeChangeBloc, FoodThemeChangeState>(
            builder: (context, state) {
              return Image.asset(
                state.themeState.isLightMode ? kLocation : kLocationDark,
                width: 100,
              );
            },
          ),
        ],
      ),
    );
  }
}
