class CompanyModel {
  String? name;
  String? address;
  String? phoneNumber;
  String? stir;
  bool? isActive;
  String? imageUrl;
  int? id;

  CompanyModel({
    this.name,
    this.address,
    this.phoneNumber,
    this.stir,
    this.isActive,
    this.imageUrl,
    this.id,
  });

  CompanyModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    address = json['address'];
    phoneNumber = json['phone_number'];
    stir = json['stir'];
    isActive = json['is_active'];
    imageUrl = json['image_url'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['address'] = address;
    data['phone_number'] = phoneNumber;
    data['stir'] = stir;
    data['is_active'] = isActive;
    data['image_url'] = imageUrl;
    data['id'] = id;

    return data;
  }
}
