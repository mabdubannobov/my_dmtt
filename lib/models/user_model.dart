class UserModel {
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? username;
  String? district;
  String? imageUrl;
  String? role; // YANGI QO'SHILDI

  UserModel({
    this.firstName,
    this.lastName,
    this.phoneNumber,
    this.username,
    this.district,
    this.imageUrl,
    this.role, // YANGI QO'SHILDI
  });

  factory UserModel.defaultModel() {
    return UserModel(
      firstName: 'None',
      lastName: 'None',
      district: 'None',
      imageUrl:
          'https://ik.imagekit.io/rjt7sz5ns/noPhoto.png?updatedAt=1714584632953',
      phoneNumber: '+998000000000',
      role: 'user', // Default rol
    );
  }

  UserModel.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    phoneNumber = json['phone_number'];
    username = json['username'];
    district = json['district'];
    imageUrl = json['image_url'];
    role = json['role']; // JSON dan o'qish
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['phone_number'] = phoneNumber;
    data['username'] = username;
    data['district'] = district;
    data['image_url'] = imageUrl;
    data['role'] = role; // JSON ga yozish
    return data;
  }
}
