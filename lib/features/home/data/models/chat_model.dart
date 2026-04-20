import 'package:chat_app/core/shared/models/message_model.dart';
import 'package:chat_app/core/shared/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatModel {
  String? id;
  int nonSeenCount;
  UserModel otherUser;
  DateTime lastTimeStamp;
  MessageModel lastMessage;
  List<String> participants;

  ChatModel({this.id, required this.otherUser, required this.lastMessage, required this.participants, required this.lastTimeStamp, required this.nonSeenCount});

  ChatModel copyWith({String? id, int? nonSeenCount, UserModel? otherUser, DateTime? lastTimeStamp, MessageModel? lastMessage, List<String>? participants}) {
    return ChatModel(
      id: id ?? this.id,
      otherUser: otherUser ?? this.otherUser,
      lastMessage: lastMessage ?? this.lastMessage,
      participants: participants ?? this.participants,
      nonSeenCount: nonSeenCount ?? this.nonSeenCount,
      lastTimeStamp: lastTimeStamp ?? this.lastTimeStamp,
    );
  }

  Map<String, dynamic> toJson() {
    return {"lastMessage": lastMessage.toJson(), "participants": participants, "lastTimeStamp": lastTimeStamp.toIso8601String(), "nonSeenCount": nonSeenCount};
  }

  factory ChatModel.fromJson(Map<String, dynamic> json, UserModel otherUser) {
    return ChatModel(
      id: json["id"] ?? "",
      otherUser: otherUser,
      nonSeenCount: json["nonSeenCount"] ?? 0,
      lastMessage: MessageModel.fromJson(json["lastMessage"]),
      participants: List<String>.from(json["participants"] ?? []),
      lastTimeStamp: json["lastTimeStamp"] != null
          ? (json["lastTimeStamp"] is Timestamp ? (json["lastTimeStamp"] as Timestamp).toDate() : DateTime.tryParse(json["lastTimeStamp"]) ?? DateTime.now())
          : DateTime.now(),
    );
  }
}
