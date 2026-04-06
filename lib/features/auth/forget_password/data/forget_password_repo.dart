import 'package:chat_app/core/network/response_result.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ForgetPasswordRepo {
  Future<ResponseResult<bool>> sentResetPassword(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email.trim());
      return SuccessResponse(true);
    } on FirebaseAuthException catch (error) {
      return FailureResponse(error.code);
    } catch (error) {
      return FailureResponse(error.toString());
    }
  }
}
