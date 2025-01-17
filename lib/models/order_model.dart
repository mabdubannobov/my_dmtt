class OrderModel {
  final int id;
  final List<Item> items;
  final String orderDate;

  OrderModel({
    required this.id,
    required this.items,
    required this.orderDate,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['id'],
      orderDate: json['datetime'],
      items: (json['items'] as List).map((item) => Item.fromJson(item)).toList(),
    );
  }
}

class Item {
  final String productName;
  final double count;

  Item({
    required this.productName,
    required this.count,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      productName: json['product_name'],
      count: json['count'].toDouble(),
    );
  }
}
