import 'package:flutter/material.dart';
import 'package:mobile_team_ui_app/food_app/constants/strings.dart';
import 'package:mobile_team_ui_app/food_app/constants/text_styles.dart';
import 'package:mobile_team_ui_app/food_app/model/restaurants.dart';

class TrendingRestaurants extends StatelessWidget {
  final List<RestaurantsModel> restaurants;

  TrendingRestaurants({this.restaurants});

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    double widgetHeight = deviceSize.height * 0.4;
    double cardWidth = deviceSize.width * 0.9;

    return _itemWidget(
      title: kTrending,
      widgetHeight: widgetHeight,
      child: ListView.builder(
        itemCount: restaurants.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return _trendingRestaurantsCard(
            title: restaurants[index].title,
            subTitle: restaurants[index].address,
            image: restaurants[index].image,
            cardWidth: cardWidth,
          );
        },
      ),
    );
  }

  Widget _itemWidget({
    @required String title,
    @required Widget child,
    @required double widgetHeight,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(title, style: kTitleTextStyle),
              GestureDetector(
                child: Text("$kSeeAll (${restaurants.length})",
                    style: kClickableTextStyle),
                onTap: () {},
              ),
            ],
          ),
          SizedBox(height: 12),
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
  }) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      clipBehavior: Clip.antiAlias,
      child: FittedBox(
        child: Container(
          width: cardWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(image),
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
