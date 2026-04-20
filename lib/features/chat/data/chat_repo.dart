import 'package:chat_app/core/network/response_result.dart';
import 'package:chat_app/core/shared/models/message_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatRepo {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<ResponseResult<List<MessageModel>>> getChatMessages(String chatId) async {
    try {
      final response = await _firestore.collection("chats").doc(chatId).collection("messages").orderBy("timestamp", descending: true).get();
      List<MessageModel> chats = response.docs.map((chat) => MessageModel.fromJson(chat.data())).toList();
      return SuccessResponse(chats);
    } catch (error) {
      return FailureResponse(error.toString());
    }
  }

  Future<ResponseResult<bool>> sendNewMessage(String chatId, String text) async {
    try {
      final chatDoc = _firestore.collection("chats").doc(chatId);
      final MessageModel newMessageModel = MessageModel(text: text, senderId: _auth.currentUser?.uid ?? "");
      chatDoc.set({...newMessageModel.toJson(), "lastTimeStamp": FieldValue.serverTimestamp()}, SetOptions(merge: true));
      chatDoc.collection("messages").add({...newMessageModel.toJson(), "timestamp": FieldValue.serverTimestamp()});
      return SuccessResponse(true);
    } catch (error) {
      return FailureResponse(error.toString());
    }
  }
}
