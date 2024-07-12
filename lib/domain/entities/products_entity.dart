class ProductsEntity {
  final int id;
  final String title;
  final double price;
  final double rating;
  String? description;
  List<String>? images;
  num? discountPercentage;

  ProductsEntity(
      {required this.id,
      required this.title,
      required this.price,
      required this.rating,
      this.description,
      this.discountPercentage,
      this.images});
}
