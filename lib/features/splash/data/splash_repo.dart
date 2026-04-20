import 'package:chat_app/core/network/response_result.dart';
import 'package:chat_app/core/shared/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SplashRepo {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<ResponseResult<UserModel>> getCurrentUserData(String userId) async {
    try {
      final response = await _firestore.collection('users').doc(userId).get();
      if (response.exists && response.data() != null) {
        Map<String, dynamic> data = response.data()!;
        return SuccessResponse(UserModel.fromJson(data));
      }
      return FailureResponse("Something went wrong");
    } catch (error) {
      return FailureResponse(error.toString());
    }
  }
}
