import 'package:chat_app/core/network/response_result.dart';
import 'package:chat_app/features/home/data/models/chat_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeRepo {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<ResponseResult<List<ChatModel>>> getMyChats() async {
    try {
      final response = await _firestore.collection("chats").where("participants", arrayContains: _auth.currentUser?.uid).orderBy("lastTimeStamp", descending: true).get();
      List<ChatModel> chats = response.docs.map((chat) => ChatModel.fromJson(chat.data())).toList();
      return SuccessResponse(chats);
    } catch (error) {
      return FailureResponse(error.toString());
    }
  }
}
