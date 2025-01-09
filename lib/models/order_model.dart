class OrderModel {
  final String id;
  final String imageUrl;
  final String name;
  final String description;
  int totalQuantity;
  final double price;

  OrderModel(
      {required this.id,
      required this.imageUrl,
      required this.name,
      required this.description,
      this.totalQuantity = 1,
      required this.price});

  factory OrderModel.fromJson(Map model, String id) {
    return OrderModel(
        id: id,
        imageUrl: model["imageUrl"],
        name: model["name"],
        description: model["description"],
        price: model["price"],
        totalQuantity: 1);
  }

  toMap() {
    return {
      "id": id,
      "imageUrl": imageUrl,
      "name": name,
      "description": description,
      "price": price,
      "totalQuantity": totalQuantity
    };
  }

  add() {
    totalQuantity += 1;
    return true;
  }

  remove() {
    if (totalQuantity > 1) {
      totalQuantity -= 1;
      return true;
    }
    return false;
  }
}
