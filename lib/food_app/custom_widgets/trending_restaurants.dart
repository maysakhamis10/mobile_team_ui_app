import 'package:flutter/material.dart';
import 'package:mobile_team_ui_app/food_app/constants/text_styles.dart';
import 'package:mobile_team_ui_app/food_app/model/restaurants.dart';
import 'package:mobile_team_ui_app/food_app/view/restaurant_details_screen.dart';

// ignore: must_be_immutable
class TrendingRestaurants extends StatelessWidget {

  final List<RestaurantsModel> restaurants;
  final  bool fromHomePage ;
  TrendingRestaurants({this.restaurants,this.fromHomePage});
  double cardWidth,widgetHeight ;

  @override
  Widget build(BuildContext context) {
     Size deviceSize = MediaQuery.of(context).size;
     widgetHeight = deviceSize.height * 0.4;
     cardWidth = deviceSize.width * 1.0;
    return _itemWidget(
      widgetHeight:  fromHomePage ? widgetHeight : deviceSize.height ,
      child:  buildHorizontalRestaurantList()  ,
      context: context
    );
  }

  Widget buildHorizontalRestaurantList() {
    return ListView.builder(
        itemCount: restaurants.length,
        scrollDirection: fromHomePage ? Axis.horizontal : Axis.vertical,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () =>
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) =>
                        RestaurantDetailsScreen(restaurants[index]))),
            child: _trendingRestaurantsCard(
                title: restaurants[index].title,
                subTitle: restaurants[index].address,
                image: restaurants[index].image,
                cardWidth: cardWidth,
                rate: restaurants[index].rating
            ),
          );
        }
    );
  }

  Widget _itemWidget({
    @required Widget child,
    @required double widgetHeight,
    BuildContext context
  }) {
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

  Widget _trendingRestaurantsCard({
    @required String title,
    @required String subTitle,
    @required String image,
    @required double cardWidth,
    @required double rate
  }) {
    return
      Card(
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
                    padding: EdgeInsets.only(top: 10,left: 10),
                    child:    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          color: Colors.white
                      ),
                      child: Center(child: Text('OPEN', style: TextStyle(color: Colors.green,),),
                      ),
                    ),
                  ),
                    Padding(
                       padding: EdgeInsets.only(top: 10,right: 10),
                       child:  Container(
                         padding: EdgeInsets.all(5),
                         decoration: BoxDecoration(
                             borderRadius: BorderRadius.all(Radius.circular(5)),
                             color: Colors.white
                         ),
                         child: Center(
                           child:
                           Row(
                             children: <Widget>[
                               Icon(Icons.star,color: Colors.yellow,),
                               //SizedBox(width: 5,)
                               Text('$rate', style: TextStyle(color: Colors.black,),)],
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