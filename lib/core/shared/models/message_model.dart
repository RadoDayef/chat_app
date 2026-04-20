import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
  DateTime? timestamp;
  String text, senderId;

  MessageModel({required this.text, required this.senderId, this.timestamp});

  Map<String, dynamic> toJson() {
    return {"text": text, "senderId": senderId, "timestamp": timestamp?.toIso8601String()};
  }

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      text: json["text"] ?? "",
      senderId: json["senderId"] ?? "",
      timestamp: json["timestamp"] != null ? (json["timestamp"] is Timestamp ? (json["timestamp"] as Timestamp).toDate() : DateTime.tryParse(json["timeStamp"]) ?? DateTime.now()) : DateTime.now(),
    );
  }
}
