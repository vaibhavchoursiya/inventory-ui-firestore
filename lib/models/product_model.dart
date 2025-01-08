class ProductModel {
  final String id;
  final String name;
  final String description;
  final int totalQuantity;
  final double price;
  bool isAddToCart;

  ProductModel(
      {required this.id,
      required this.name,
      required this.description,
      required this.totalQuantity,
      required this.price,
      this.isAddToCart = false});

  toMap() {
    return {
      "name": name,
      "description": description,
      "totalQuantity": totalQuantity,
      "price": price,
    };
  }

  factory ProductModel.fromJson(Map model) {
    return ProductModel(
        id: model["id"],
        name: model["name"],
        description: model["description"],
        totalQuantity: model["totalQuantity"],
        price: model["price"],
        isAddToCart: false);
  }
}
