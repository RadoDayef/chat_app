import 'package:chat_app/core/network/response_result.dart';
import 'package:chat_app/features/home/data/home_repo.dart';
import 'package:chat_app/features/home/data/models/chat_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _repo;

  HomeCubit(this._repo) : super(HomeLoading()) {
    getChats();
  }

  void getChats() async {
    ResponseResult<List<ChatModel>> chats = await _repo.getMyChats();
    if (chats is SuccessResponse<List<ChatModel>>) {
      emit(HomeSuccess(chats.data));
    } else {
      emit(HomeFailure((chats as FailureResponse).message));
    }
  }
}
