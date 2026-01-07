class DmttModel {
  String? name;
  String? address;
  String? stir;
  int? childCount;
  bool? isActive;

  DmttModel({
    this.name,
    this.address,
    this.stir,
    this.childCount,
    this.isActive,
  });

  factory DmttModel.defaultModel() {
    return DmttModel(name: '?');
  }

  DmttModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    address = json['address'];
    stir = json['stir'];
    childCount = json['child_count'];
    isActive = json['is_active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['address'] = address;
    data['stir'] = stir;
    data['child_count'] = childCount;
    data['is_active'] = isActive;

    return data;
  }
}
