import 'dart:convert';

import 'package:lojahub/domain/entities/auth/user.dart';

class UserModel extends User {
  const UserModel(
      super.username, super.email, super.accessToken, super.photoUrl);

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'email': email,
      'accessToken': accessToken,
      'photoUrl': photoUrl,
    };
  }

  static UserModel fromMap(Map<String, dynamic> map) {
    return UserModel(
      map['username'],
      map['email'],
      map['accessToken'],
      map['photoUrl'],
    );
  }

  String toJson() => json.encode(toMap());

  static UserModel fromJson(String source) => fromMap(json.decode(source));
}
