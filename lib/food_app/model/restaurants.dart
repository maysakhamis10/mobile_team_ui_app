import 'package:mobile_team_ui_app/resources/images.dart';

class RestaurantsModel {
  String image;
  String title;
  String address;
  double rating;

  RestaurantsModel({
    this.image,
    this.title,
    this.address,
    this.rating,
});

  RestaurantsModel.fromMap(Map<String,dynamic> map){
    this.image = map["img"];
    this.title = map["title"];
    this.address = map["address"];
    this.rating = double.parse(map["rating"]);
  }

}
