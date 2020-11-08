import 'package:flutter/material.dart';
import 'package:mobile_team_ui_app/food_app/food_app_constants/food_app_constants.dart';
import 'package:mobile_team_ui_app/food_app/model/categories.dart';
import 'package:mobile_team_ui_app/food_app/model/restaurants.dart';
import 'package:mobile_team_ui_app/food_app/view/restaurant_details_screen.dart';

class TrendingRestaurants extends StatelessWidget {
  final List<RestaurantsModel> restaurants;
  final List<CategoryModel> categories;
  final bool fromHomePage;

  TrendingRestaurants(
      {@required this.restaurants,
      @required this.fromHomePage,
      @required this.categories});

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    double widgetHeight = deviceSize.height * 0.4;
    double cardWidth = deviceSize.width * 1.0;
    return _itemWidget(
        widgetHeight: fromHomePage ? widgetHeight : deviceSize.height,
        child: buildHorizontalRestaurantList(cardWidth),
        context: context);
  }

  Widget buildHorizontalRestaurantList(double cardWidth) {
    return ListView.builder(
        itemCount: restaurants.length,
        scrollDirection: fromHomePage ? Axis.horizontal : Axis.vertical,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => RestaurantDetailsScreen(
                  restaurant: restaurants[index],
                  categories: categories,
                ),
              ),
            ),
            child: _trendingRestaurantsCard(
                restaurant: restaurants[index], cardWidth: cardWidth),
          );
        });
  }

  Widget _itemWidget(
      {@required Widget child,
      @required double widgetHeight,
      BuildContext context}) {
    return Container(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          Container(
            height: widgetHeight,
            child: child,
          ),
        ],
      ),
    );
  }

  Widget _trendingRestaurantsCard(
      {@required RestaurantsModel restaurant, @required double cardWidth}) {
    String title = restaurant.title;
    String subTitle = restaurant.address;
    String image = restaurant.image;
    double rate = restaurant.rating;
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      clipBehavior: Clip.antiAlias,
      child: FittedBox(
        child: Container(
          width: cardWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: <Widget>[
                  Image.asset(image),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 10, left: 10),
                        child: Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              color: Colors.white),
                          child: Center(
                            child: Text(
                              'OPEN',
                              style: TextStyle(
                                color: Colors.green,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10, right: 10),
                        child: Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              color: Colors.white),
                          child: Center(
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                ),
                                //SizedBox(width: 5,)
                                Text(
                                  '$rate',
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: kTitleTextStyle),
                    SizedBox(height: 6),
                    Text(subTitle, style: kSubTitleTextStyle),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
