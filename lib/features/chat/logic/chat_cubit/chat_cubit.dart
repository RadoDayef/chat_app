import 'package:chat_app/core/network/response_result.dart';
import 'package:chat_app/core/shared/models/message_model.dart';
import 'package:chat_app/features/chat/data/chat_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  final String chatId;
  final ChatRepo _repo;

  ChatCubit(this._repo, this.chatId) : super(ChatLoading()) {
    getMessages(chatId);
  }

  void getMessages(String chatId) async {
    ResponseResult<List<MessageModel>> chats = await _repo.getChatMessages(chatId);
    if (chats is SuccessResponse<List<MessageModel>>) {
      emit(ChatSuccess(chats.data));
    } else {
      emit(ChatFailure((chats as FailureResponse).message));
    }
  }
}
