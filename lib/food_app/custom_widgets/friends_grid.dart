import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class FriendsGrid extends StatelessWidget {
  final List<String> friends;

  FriendsGrid({@required this.friends});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      height: MediaQuery.of(context).size.height * 0.4,
      child: AnimationLimiter(
        child: GridView.count(
          physics: NeverScrollableScrollPhysics(),
          crossAxisCount: 4,
          children: List.generate(
            friends.length,
                (int index) {
              return AnimationConfiguration.staggeredGrid(
                position: index,
                duration: const Duration(milliseconds: 350),
                columnCount: 2,
                child: ScaleAnimation(
                  child: SlideAnimation(
                    child: buildFriendItem(friends[index]),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget buildFriendItem(String imagePath) {
    return  Container(
     // padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.all(10.0),
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.cover, image: AssetImage(imagePath)),
        borderRadius: BorderRadius.all(Radius.circular(80.0)),
        color: Colors.transparent,
      ),
    );
//      ClipRRect(
//      borderRadius: BorderRadius.circular(8.0),
//      child: Image.asset(
//        imagePath,
//        height: 150.0,
//        width: 100.0,
//      ),
//    );
  }
}
