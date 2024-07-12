import 'package:route_task/domain/entities/products_entity.dart';

class ProductsModel extends ProductsEntity {
  ProductsModel(
      {required super.id,
      required super.title,
      required super.price,
      required super.rating,
      super.description,
      super.discountPercentage,
      super.images});

  factory ProductsModel.fromJson(Map<String, dynamic> json) {
    List<String> listImages = [];
    if (json["images"] != null) {
      for (var e in json["images"]) {
        listImages.add(e);
      }
    }
    return ProductsModel(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        price: json["price"],
        rating: json["rating"],
        discountPercentage: json["discountPercentage"],
        images: listImages);
  }
}
