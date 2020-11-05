import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mobile_team_ui_app/food_app/constants/text_styles.dart';
import 'package:mobile_team_ui_app/food_app/food_app_constants/food_app_strings.dart';
import 'package:mobile_team_ui_app/food_app/model/categories.dart';
import 'package:mobile_team_ui_app/food_app/model/restaurants.dart';
import 'package:mobile_team_ui_app/food_app/presenter/presenter.dart';
import 'file:///D:/android%20projects/mobile_team_ui_app/lib/food_app/custom_widgets/restaurant_images_slider.dart';
import 'package:mobile_team_ui_app/food_app/view/view.dart';

import '../custom_widgets/category_list.dart';

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

  Size size;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    presenter = FoodAppPresenter();
    presenter.onCreate(this);
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child:
              Text(kRestuarantDetails
                , style: TextStyle(
                    color: Colors.black
                ),),
        ),
      ),
      backgroundColor: Colors.white,
      body:
      SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(height: 5,),
            RestaurantImagesSlider(),
             buildRestaurantTitle(),
            buildRestaurantDesc(),
            Container(
              padding: const EdgeInsets.all(12),
              height: size.height * 0.4,
              child: CategoryListScreen(categories: categories),
            ),
            //SizedBox(height: 100,)
          ],
        ),
      ),
    );
  }

  Widget buildRestaurantTitle(){
    return Container(
        height: size.height*0.1,
        margin: EdgeInsets.only(left: 20 , right: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
          Text(widget.restaurantsModel.title,style: kTitleTextStyle,),
          Image.asset(
            "assets/images/food_app/giphy.gif",
            width: size.width*0.2,
            height: size.height*0.2,
          ),
          Text(widget.restaurantsModel.rating.toString(),style: TextStyle(color: Colors.black26),),



        ],
    ),
      );

  }

  Widget buildRestaurantDesc() {
    return Container(
      height: size.height*0.1,
      margin: EdgeInsets.only(left: 20, right: 20),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(
              widget.restaurantsModel.address, style: kSubTitleTextStyle,),
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