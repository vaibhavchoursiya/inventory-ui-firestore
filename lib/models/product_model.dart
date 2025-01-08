class ProductModel {
  final String id;
  final String imageUrl;
  final String name;
  final String description;
  final int totalQuantity;
  final double price;
  bool isAddToCart;

  ProductModel(
      {required this.id,
      required this.imageUrl,
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
      "imageUrl": imageUrl,
      "price": price,
    };
  }

  factory ProductModel.fromJson(Map model, String id) {
    return ProductModel(
        id: id,
        imageUrl: model["imageUrl"] ??
            "https://www.katyayaniorganics.com/wp-content/uploads/2022/09/PROM.png",
        name: model["name"],
        description: model["description"],
        totalQuantity: model["totalQuantity"],
        price: model["price"],
        isAddToCart: false);
  }
}
