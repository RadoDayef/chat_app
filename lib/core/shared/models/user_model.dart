import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? uid;
  String name, email, imageUrl;
  DateTime? createdAt;

  UserModel({this.uid, this.createdAt, required this.name, required this.email, required this.imageUrl});

  UserModel copyWith({String? uid, String? name, String? email, String? imageUrl, DateTime? createdAt}) {
    return UserModel(uid: uid ?? this.uid, name: name ?? this.name, email: email ?? this.email, imageUrl: imageUrl ?? this.imageUrl, createdAt: createdAt ?? this.createdAt);
  }

  Map<String, dynamic> toJson() {
    return {"uid": uid, "name": name, "email": email, "createdAt": createdAt?.toIso8601String()};
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json["uid"] ?? "",
      name: json["name"] ?? "",
      email: json["email"] ?? "",
      imageUrl: json["imageUrl"] ?? "",
      createdAt: json["createdAt"] != null ? (json["createdAt"] is Timestamp ? (json["createdAt"] as Timestamp).toDate() : DateTime.tryParse(json["createdAt"])) : null,
    );
  }
}
