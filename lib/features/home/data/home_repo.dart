import 'package:chat_app/core/network/response_result.dart';
import 'package:chat_app/core/shared/models/user_model.dart';
import 'package:chat_app/features/home/data/models/chat_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeRepo {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<ResponseResult<List<ChatModel>>> getMyChats() async {
    try {
      final response = await _firestore.collection("chats").where("participants", arrayContains: _auth.currentUser?.uid).orderBy("lastTimeStamp", descending: true).get();
      List<Future<ChatModel>> chatsFutures = response.docs.map((chat) async {
        SuccessResponse<UserModel> otherUser = await getOtherUser(List<String>.from(chat.data()["participants"]).firstWhere((participant) => participant != _auth.currentUser?.uid));
        return ChatModel.fromJson(chat.data(), otherUser.data);
      }).toList();
      List<ChatModel> chats = await Future.wait(chatsFutures);
      return SuccessResponse(chats);
    } catch (error) {
      return FailureResponse(error.toString());
    }
  }

  Future<SuccessResponse<UserModel>> getOtherUser(String otherUserId) async {
    try {
      final response = await _firestore.collection("users").doc(otherUserId).get();
      if (response.exists && response.data() != null) {
        Map<String, dynamic> data = response.data()!;
        return SuccessResponse(UserModel.fromJson(data));
      }
      return SuccessResponse(UserModel(name: "User Not Found", email: "User Not Found", imageUrl: ""));
    } catch (error) {
      return SuccessResponse(UserModel(name: "User Not Found", email: "User Not Found", imageUrl: ""));
    }
  }

  Future<ResponseResult<List<UserModel>>> searchForUser(String name) async {
    try {
      final response = await _firestore.collection("users").where("name", isEqualTo: name).where("uid", isNotEqualTo: _auth.currentUser?.uid ?? "").get();
      List<UserModel> users = response.docs.map((user) => UserModel.fromJson(user.data())).toList();
      return SuccessResponse(users);
    } catch (error) {
      return FailureResponse(error.toString());
    }
  }
}
