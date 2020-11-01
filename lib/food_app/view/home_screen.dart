import 'package:flutter/material.dart';
import 'package:mobile_team_ui_app/resources/images.dart';

class HomeScreen extends StatelessWidget {
  String kTrending = "Trending Restaurants";
  String kSeeAll = "See All";

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [],
    );
  }

  Widget _itemWidget({@required String title, @required Widget child}) {
    return Column(
      children: [
        Row(
          children: [
            Text(title),
            GestureDetector(
              child: Text(kSeeAll),
              onTap: () {},
            ),
          ],
        ),
        child,
      ],
    );
  }

  Widget _trendingRestaurantsCard({
    @required String title,
    @required String subTitle,
    @required String image,
  }) {
    return Card(
      shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: Stack(
              children: [
                Image.asset(image),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Text(title),
                Text(subTitle),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
