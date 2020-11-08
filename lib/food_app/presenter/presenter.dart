import 'package:mobile_team_ui_app/food_app/model/categories.dart';
import 'package:mobile_team_ui_app/food_app/model/repository.dart';
import 'package:mobile_team_ui_app/food_app/model/restaurants.dart';
import 'package:mobile_team_ui_app/food_app/view/view.dart';

class FoodAppPresenter {
  FoodAppRepository repository;
  FoodAppView view;


  void onCreate(FoodAppView view) {
    repository = FoodAppRepository();
    this.view = view;
    _getCategories();
    _getFriends();
    _getRestaurants();
    _getImagesList();
  }

  void _getCategories() {
    List<CategoryModel> categories = [];
    repository.categories.forEach((e) {
      CategoryModel model = CategoryModel.fromMap(e);
      categories.add(model);
    });
    view.getCategories(categories);
  }

  void _getFriends() {
    view.getFriends(repository.friends);
  }

  void _getRestaurants() {
    List<RestaurantsModel> restaurants = [];
    repository.restaurants.forEach((e) {
      RestaurantsModel model = RestaurantsModel.fromMap(e);
      restaurants.add(model);
    });
    view.getRestaurants(restaurants);
  }

  void _getImagesList(){
    view.getImages(repository.imagesList);
  }

}
