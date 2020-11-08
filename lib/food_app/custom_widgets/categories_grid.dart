import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:mobile_team_ui_app/food_app/model/categories.dart';

class CategoriesGrid extends StatelessWidget {
  final List<CategoryModel> categories;

  CategoriesGrid({@required this.categories});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      height: MediaQuery.of(context).size.height * 0.4,
      child: AnimationLimiter(
        child: GridView.count(
          physics: NeverScrollableScrollPhysics(),
          crossAxisCount: 3,
          children: List.generate(
            categories.length,
            (int index) {
              return AnimationConfiguration.staggeredGrid(
                position: index,
                duration: const Duration(milliseconds: 350),
                columnCount: 2,
                child: ScaleAnimation(
                  child: SlideAnimation(
                    child: buildCatItem(categories[index]),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget buildCatItem(CategoryModel singleItem) {
    return Card(
      shadowColor: Colors.black12,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      semanticContainer: true,
      elevation: 8,
      clipBehavior: Clip.hardEdge,
      child: Container(
        child: Stack(
          children: <Widget>[
            Container(
              child: ClipRRect(
                child: Image.asset(
                  singleItem.image,
                  fit: BoxFit.cover,
                  height: 200,
                ),
              ),
            ),
            Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.black45,
                ),
                child: Text(
                  singleItem.name,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 22.0),
                )),
          ],
        ),
      ),
    );
  }
}
