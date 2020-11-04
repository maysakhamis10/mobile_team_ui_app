import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:mobile_team_ui_app/food_app/custom_widgets/search_bar.dart';
import 'package:mobile_team_ui_app/food_app/model/categories.dart';
import 'package:mobile_team_ui_app/food_app/model/restaurants.dart';
import 'package:mobile_team_ui_app/food_app/presenter/presenter.dart';
import 'package:mobile_team_ui_app/food_app/view/home_body.dart';
import 'package:mobile_team_ui_app/food_app/view/view.dart';

class FoodAppMainScreen extends StatefulWidget {
  @override
  _FoodAppMainScreenState createState() => _FoodAppMainScreenState();
}

class _FoodAppMainScreenState extends State<FoodAppMainScreen>
    with SingleTickerProviderStateMixin
    implements FoodAppView {
  FoodAppPresenter presenter;
  List<CategoryModel> categories = [];
  List<String> friends = [];
  List<RestaurantsModel> restaurants = [];
  AnimationController _animationController;
  Animation<double> animation;
  CurvedAnimation curve;

  int _bottomNavIndex = 0;
  List<IconData> _bottomNavIcons = [
    Icons.home,
    Icons.label,
    Icons.notifications,
    Icons.person,
  ];

  @override
  void getCategories(List<CategoryModel> categories) {
    this.categories = categories;
  }

  @override
  void getFriends(List<String> friends) {
    this.friends = friends;
  }

  @override
  void getRestaurants(List<RestaurantsModel> restaurants) {
    this.restaurants = restaurants;
  }

  @override
  void initState() {
    super.initState();
    presenter = FoodAppPresenter();
    presenter.onCreate(this);
    _animationController = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
    curve = CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.5,
        1.0,
        curve: Curves.fastOutSlowIn,
      ),
    );
    animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(curve);

    Future.delayed(
      Duration(seconds: 1),
      () => _animationController.forward(),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: SearchBar(),
        ),
        body: HomeBody(
          categories: this.categories,
          friends: this.friends,
          restaurants: this.restaurants,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: AnimatedBottomNavigationBar(
          activeColor: Theme.of(context).primaryColor,
          splashColor: Theme.of(context).accentColor,
          notchAndCornersAnimation: animation,
          icons: _bottomNavIcons,
          activeIndex: _bottomNavIndex,
          gapLocation: GapLocation.center,
          notchSmoothness: NotchSmoothness.defaultEdge,
          onTap: (index) => setState(() => _bottomNavIndex = index),
        ),
      ),
    );
  }
}
