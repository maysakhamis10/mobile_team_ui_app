import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mobile_team_ui_app/food_app/constants/text_styles.dart';
import 'package:mobile_team_ui_app/food_app/model/categories.dart';
import 'package:mobile_team_ui_app/food_app/model/restaurants.dart';
import 'package:mobile_team_ui_app/food_app/presenter/presenter.dart';
import 'package:mobile_team_ui_app/food_app/view/restaurant_images_slider.dart';
import 'package:mobile_team_ui_app/food_app/view/view.dart';

import 'category_list.dart';

// ignore: must_be_immutable
class RestaurantDetailsScreen extends StatefulWidget {

  RestaurantsModel restaurantsModel ;

  @override
  State<StatefulWidget> createState() => _RestaurantDetailsScreenState();

  RestaurantDetailsScreen(this.restaurantsModel);
}

class _RestaurantDetailsScreenState
    extends State<RestaurantDetailsScreen> implements FoodAppView {

  List<CategoryModel> categories = [];

  FoodAppPresenter presenter;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    presenter = FoodAppPresenter();
    presenter.onCreate(this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
        child: Column(
          children: <Widget>[
            RestaurantImagesSlider(),
            buildRestaurantTitle(),
            buildRestaurantDesc(),
            Expanded(child: CategoryListScreen(categories: categories)),
          ],
        ),
      ),
      ),

    );
  }

  Widget buildRestaurantTitle(){
    return Container(
        margin: EdgeInsets.only(left: 20 , right: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
          Text(widget.restaurantsModel.title,style: kSubTitleTextStyle,),
          Image.asset(
            "assets/images/food_app/giphy.gif",
            width: 120,
            height: 100,
          ),
          Text(widget.restaurantsModel.rating.toString(),style: TextStyle(color: Colors.black26),),



        ],
    ),
      );

  }

  Widget buildRestaurantDesc(){
    return Container(
      margin: EdgeInsets.only(left: 20 , right: 20),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(widget.restaurantsModel.address,style: kSubTitleTextStyle,),
          ),
          Image.asset(
            "assets/images/food_app/location.gif",
            width: 100,
          ),
        ],
      ),
    );

  }




  @override
  void getCategories(List<CategoryModel> categories) {
    this.categories = categories;

  }

  @override
  void getFriends(List<String> friends) {
    // TODO: implement getFriends
  }

  @override
  void getRestaurants(List<RestaurantsModel> restaurants) {
    // TODO: implement getRestaurants
  }

}