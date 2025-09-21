class UserModel {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String address;
  final String image;

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.address,
    required this.image,

  });

  // Factory constructor to parse JSON
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json["_id"] ?? "",
      firstName: json["firstName"] ?? "",
      lastName: json["lastName"] ?? "",
      email: json["email"] ?? "",
      address: json["address"] ?? "",
      image: json["image"] ?? "",

    );
  }

  // Convert back to JSON
  Map<String, dynamic> toJson() {
    return {
      "_id": id,
      "firstName": firstName,
      "lastName": lastName,
      "email": email,
      "address": address,
      "image": image,
    };
  }
}
