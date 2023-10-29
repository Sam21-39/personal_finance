class CategoryModel {
  String? name;
  String? imageUrl;
  String? id;

  CategoryModel({this.id, this.imageUrl, this.name});

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        id: json["id"],
        imageUrl: json["imageUrl"],
        name: json["name"],
      );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'imageUrl': imageUrl,
      'name': name,
    };
  }
}
