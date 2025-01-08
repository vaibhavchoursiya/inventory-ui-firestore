class OrderModel {
  final String id;
  final String name;
  final String description;
  int totalQuantity;
  final double price;

  OrderModel(
      {required this.id,
      required this.name,
      required this.description,
      this.totalQuantity = 1,
      required this.price});

  factory OrderModel.fromJson(Map model) {
    return OrderModel(
        id: model["id"],
        name: model["name"],
        description: model["description"],
        price: model["price"],
        totalQuantity: 1);
  }

  add() {
    totalQuantity += 1;
  }

  remove() {
    if (totalQuantity > 1) {
      totalQuantity -= 1;
    }
  }
}