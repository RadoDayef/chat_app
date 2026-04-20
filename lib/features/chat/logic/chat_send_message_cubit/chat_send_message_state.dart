part of 'chat_send_message_cubit.dart';

abstract class ChatSendMessageState {}

final class ChatSendMessageInitial extends ChatSendMessageState {}

final class ChatSendMessageLoading extends ChatSendMessageState {}

final class ChatSendMessageSuccess extends ChatSendMessageState {}

final class ChatSendMessageFailure extends ChatSendMessageState {
  String message;

  ChatSendMessageFailure(this.message);
}
