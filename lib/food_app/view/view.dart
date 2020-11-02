import 'package:mobile_team_ui_app/food_app/model/categories.dart';
import 'package:mobile_team_ui_app/food_app/model/restaurants.dart';

abstract class FoodAppView {
  List<CategoryModel> getCategories();
  List<String> getFriends();
  List<RestaurantsModel> getRestaurants();
}