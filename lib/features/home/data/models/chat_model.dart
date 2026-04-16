import 'package:chat_app/core/shared/models/message_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatModel {
  DateTime? lastTimeStamp;
  MessageModel? lastMessage;
  List<String> participants;

  ChatModel({required this.lastMessage, required this.participants, required this.lastTimeStamp});

  Map<String, dynamic> toJson() {
    return {"lastMessage": lastMessage?.toJson(), "participants": participants, "lastTimeStamp": lastTimeStamp?.toIso8601String()};
  }

  factory ChatModel.fromJson(Map<String, dynamic> json) {
    return ChatModel(
      lastMessage: MessageModel.fromJson(json["lastMessage"]),
      participants: List<String>.from(json["participants"] ?? []),
      lastTimeStamp: json["lastTimeStamp"] != null ? (json["lastTimeStamp"] is Timestamp ? (json["lastTimeStamp"] as Timestamp).toDate() : DateTime.tryParse(json["lastTimeStamp"])) : null,
    );
  }
}
