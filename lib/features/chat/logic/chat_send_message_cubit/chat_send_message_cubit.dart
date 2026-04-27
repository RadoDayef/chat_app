import 'package:chat_app/core/network/response_result.dart';
import 'package:chat_app/core/shared/models/user_model.dart';
import 'package:chat_app/features/chat/data/chat_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'chat_send_message_state.dart';

class ChatSendMessageCubit extends Cubit<ChatSendMessageState> {
  final String chatId;
  final ChatRepo _repo;
  final UserModel otherUser;

  ChatSendMessageCubit(this._repo, this.chatId, this.otherUser) : super(ChatSendMessageInitial());

  TextEditingController messageController = TextEditingController();

  void sendMessage() async {
    String messageText = messageController.text.trim();
    if (messageText.isEmpty) return;

    emit(ChatSendMessageLoading());
    ResponseResult<bool> response = await _repo.sendNewMessage(chatId, messageText);
    if (response is SuccessResponse<bool>) {
      emit(ChatSendMessageSuccess());
      messageController.clear();

      emit(ChatSendMessageInitial());
    } else {
      emit(ChatSendMessageFailure((response as FailureResponse).message));
    }
  }
}
