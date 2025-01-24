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

  ProductModel({
    required this.name,
    required this.measure,
    this.limit,
    this.count,
    this.value,
    this.imageUrl,
    this.companyId,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      name: json['name'],
      measure: json['measure'],
      limit: json['limit'],
      count: json['count'],
      imageUrl: json['image_url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'company_id': companyId,
      'product_name': name,
      'count': value,
      'measure': measure,
      'image_url': imageUrl,
    };
  }
}
