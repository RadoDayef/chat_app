import 'package:chat_app/core/network/response_result.dart';
import 'package:chat_app/core/shared/models/message_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatRepo {
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
}
