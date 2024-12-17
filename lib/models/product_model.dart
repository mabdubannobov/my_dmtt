class ProductModel {
  String name;
  String measure;
  String? limit;
  String? count;
  double? value;
  String? imageUrl;
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
