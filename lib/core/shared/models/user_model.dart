import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  DateTime? createdAt;
  String? uid, fcmToken;
  String name, email, imageUrl;

  UserModel({this.uid, this.createdAt, required this.name, required this.email, required this.imageUrl, this.fcmToken});

  UserModel copyWith({String? uid, String? name, String? email, String? imageUrl, String? fcmToken, DateTime? createdAt}) {
    return UserModel(
      uid: uid ?? this.uid,
      name: name ?? this.name,
      email: email ?? this.email,
      imageUrl: imageUrl ?? this.imageUrl,
      fcmToken: fcmToken ?? this.fcmToken,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toJson() {
    return {"uid": uid, "name": name, "email": email, "createdAt": createdAt?.toIso8601String(), "imageUrl": imageUrl, "fcmToken": fcmToken};
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json["uid"] ?? "",
      name: json["name"] ?? "",
      email: json["email"] ?? "",
      imageUrl: json["imageUrl"] ?? "",
      fcmToken: json["fcmToken"] ?? "",
      createdAt: json["createdAt"] != null ? (json["createdAt"] is Timestamp ? (json["createdAt"] as Timestamp).toDate() : DateTime.tryParse(json["createdAt"])) : null,
    );
  }
}
