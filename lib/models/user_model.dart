

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.accessToken,
    this.refreshToken,
    this.accessTokenExpiration,
    this.refreshTokenExpiration,
    this.user,
  });

  final String? accessToken;
  final String? refreshToken;
  final int? accessTokenExpiration;
  final int? refreshTokenExpiration;
  final UserClass? user;

  factory User.fromJson(Map<String, dynamic> json) => User(
    accessToken: json["accessToken"],
    refreshToken: json["refreshToken"],
    accessTokenExpiration: json["accessTokenExpiration"],
    refreshTokenExpiration: json["refreshTokenExpiration"],
    user: UserClass.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "accessToken": accessToken,
    "refreshToken": refreshToken,
    "accessTokenExpiration": accessTokenExpiration,
    "refreshTokenExpiration": refreshTokenExpiration,
    "user": user?.toJson(),
  };
}

class UserClass {
  UserClass({
    this.userId,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.imageUrl,
    this.documentUrl,
    this.gender,
    this.street,
    this.zipCode,
    this.city,
    this.country,
    this.bonuses,
    this.fcmToken,
    this.birthdate,
  });

  final String? userId;
  final String? firstName;
  final String? lastName;
  final String? email;
  final dynamic phone;
  final String? imageUrl;
  final dynamic documentUrl;
  final dynamic gender;
  final dynamic street;
  final dynamic zipCode;
  final dynamic city;
  final dynamic country;
  final dynamic bonuses;
  final String? fcmToken;
  final dynamic birthdate;

  factory UserClass.fromJson(Map<String, dynamic> json) => UserClass(
    userId: json["userId"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    email: json["email"],
    phone: json["phone"],
    imageUrl: json["imageUrl"],
    documentUrl: json["documentUrl"],
    gender: json["gender"],
    street: json["street"],
    zipCode: json["zipCode"],
    city: json["city"],
    country: json["country"],
    bonuses: json["bonuses"],
    fcmToken: json["fcmToken"],
    birthdate: json["birthdate"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "firstName": firstName,
    "lastName": lastName,
    "email": email,
    "phone": phone,
    "imageUrl": imageUrl,
    "documentUrl": documentUrl,
    "gender": gender,
    "street": street,
    "zipCode": zipCode,
    "city": city,
    "country": country,
    "bonuses": bonuses,
    "fcmToken": fcmToken,
    "birthdate": birthdate,
  };
}
