import 'package:mobile_team_ui_app/food_app/model/categories.dart';
import 'package:mobile_team_ui_app/food_app/model/repository.dart';
import 'package:mobile_team_ui_app/food_app/model/restaurants.dart';
import 'package:mobile_team_ui_app/food_app/view/view.dart';

class FoodAppPresenter {
  FoodAppRepository repository;
  FoodAppView view;

  List<CategoryModel> getCategories() {
    List<CategoryModel> categories = [];
    repository.categories.forEach((e) {
      CategoryModel model = CategoryModel.fromMap(e);
      categories.add(model);
    });
    return categories;
  }

  List<String> getFriends() {
    return repository.friends;
  }

  List<RestaurantsModel> getRestaurants(){
    repository.restaurants.forEach((e) {

    });
  }
}
