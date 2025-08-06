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
      items:
          (json['items'] as List).map((item) => Item.fromJson(item)).toList(),
    );
  }
}

class Item {
  final String productName;
  final double count;
  final String productImage;
  final String measure;

  Item({
    required this.productName,
    required this.count,
    required this.productImage,
    required this.measure,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    final product = json['product'] ?? {};
    return Item(
      productName: json['product_name'] ?? '',
      count: (json['count'] ?? 0).toDouble(),
      productImage: product['image_url'] ?? '',
      measure: product['measure'] ?? '',
    );
  }
}
