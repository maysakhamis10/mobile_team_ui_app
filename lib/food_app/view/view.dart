import 'package:mobile_team_ui_app/food_app/model/categories.dart';
import 'package:mobile_team_ui_app/food_app/model/restaurants.dart';

abstract class FoodAppView {
  void getCategories(List<CategoryModel> categories);
  void getFriends(List<String> friends);
  void getRestaurants(List<RestaurantsModel> restaurants);
}