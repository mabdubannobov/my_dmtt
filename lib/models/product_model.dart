import 'package:hive/hive.dart';

part 'product_model.g.dart';

@HiveType(typeId: 0)
class ProductModel extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  String measure;

  @HiveField(2)
  String? limit;

  @HiveField(3)
  String? count;

  @HiveField(4)
  double? value;

  @HiveField(5)
  String? imageUrl;

  @HiveField(6)
  int? companyId;

  @HiveField(7)
  int? price;

  ProductModel({
    required this.name,
    required this.measure,
    this.limit,
    this.count,
    this.value,
    this.imageUrl,
    this.companyId,
    this.price,
  });

  factory ProductModel.defaultModel() {
    return ProductModel(
      name: 'None',
      measure: 'None',
      count: 'None',
      imageUrl:
          'https://ik.imagekit.io/rjt7sz5ns/noPhoto.png?updatedAt=1714584632953',
    );
  }

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      name: json['name'],
      measure: json['measure'],
      limit: json['limit'],
      count: json['count'],
      imageUrl: json['image_url'],
      price: json['price'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'company_id': companyId,
      'product_name': name,
      'count': value,
      'measure': measure,
      'image_url': imageUrl,
      'price': price,
    };
  }
}
