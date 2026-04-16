part of 'chat_cubit.dart';

abstract class ChatState {}

final class ChatLoading extends ChatState {}

final class ChatSuccess extends ChatState {
  List<MessageModel> messages;

  ChatSuccess(this.messages);
}

final class ChatFailure extends ChatState {
  String message;

  ChatFailure(this.message);
}
