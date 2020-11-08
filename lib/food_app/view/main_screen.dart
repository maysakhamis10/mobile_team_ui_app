import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_team_ui_app/food_app/model/categories.dart';
import 'package:mobile_team_ui_app/food_app/model/restaurants.dart';
import 'package:mobile_team_ui_app/food_app/presenter/presenter.dart';
import 'package:mobile_team_ui_app/food_app/view/home_body.dart';
import 'package:mobile_team_ui_app/food_app/view/theme_bloc/bloc.dart';
import 'package:mobile_team_ui_app/food_app/view/view.dart';
import 'package:mobile_team_ui_app/resources/images.dart';

class FoodAppMainScreen extends StatefulWidget {
  @override
  _FoodAppMainScreenState createState() => _FoodAppMainScreenState();
}

class _FoodAppMainScreenState extends State<FoodAppMainScreen>
    with SingleTickerProviderStateMixin implements FoodAppView {

  FoodAppPresenter presenter;

  List<CategoryModel> categories = [];
  List<String> friends = [];
  List<String> picturesList = [];
  List<RestaurantsModel> restaurants = [];

  AnimationController _animationController;
  Animation<double> _animation;
  CurvedAnimation _curve;

  int _bottomNavIndex = 0;


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
  void getImages(List<String> pictures) {
    this.picturesList = pictures;
  }

  @override
  void initState() {
    super.initState();
    _initPresenter();
    _initAnimation();
  }

  void _initPresenter() {
    presenter = FoodAppPresenter();
    presenter.onCreate(this);
  }

  void _initAnimation() {
    _animationController = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
    _curve = CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.5,
        1.0,
        curve: Curves.fastOutSlowIn,
      ),
    );
    _animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(_curve);

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
    return Scaffold(
      body: _buildBody(),
      appBar: _buildAppBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: _buildFloatingButton(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildBody(){
    return Container(
      margin: EdgeInsets.all(5.0),
      child: HomeBody(
        categories: this.categories,
        friends: this.friends,
        restaurants: this.restaurants,
        imagesList: picturesList,
      ),
    ) ;
  }

  Widget _buildAppBar() {
    return AppBar(
      elevation: 0.0,
      title: Text("Food App "),
      actions: <Widget>[
        Row(
          children: <Widget>[
            Text(
              "Light Mode",
              style: TextStyle(fontSize: 12),
            ),
            BlocBuilder<FoodThemeChangeBloc, FoodThemeChangeState>(
              builder: (context, state) {
                return Padding(
                  padding: EdgeInsets.only(top: 0),
                  child: Switch(
                    value: state.themeState.isLightMode,
                    onChanged: (value) =>
                        BlocProvider.of<FoodThemeChangeBloc>(context).add(
                          FoodAppOnThemeChangedEvent(value),
                        ),
                  ),
                );
              },
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildFloatingButton() {
    return FloatingActionButton(
      backgroundColor: Theme
          .of(context)
          .primaryColor,
      onPressed: () {},
      child: Icon(Icons.add, color: Colors.white),
    );
  }

  Widget _buildBottomNavigationBar() {
    return AnimatedBottomNavigationBar(
      activeColor: Theme
          .of(context)
          .primaryColor,
      inactiveColor: Theme
          .of(context)
          .unselectedWidgetColor,
      backgroundColor: Theme
          .of(context)
          .backgroundColor,
      elevation: 20,
      notchAndCornersAnimation: _animation,
      icons: iconsBottomList,
      activeIndex: _bottomNavIndex,
      gapLocation: GapLocation.center,
      notchSmoothness: NotchSmoothness.defaultEdge,
      onTap: (index) => setState(() => _bottomNavIndex = index),
    );
  }


}
