class CategoryModel {
  String name;
  String image;

  CategoryModel({
    this.name,
    this.image,
  });

  CategoryModel.fromMap(Map<String, dynamic> map){
    this.name = map["name"];
    this.image = map["img"];
  }
}


