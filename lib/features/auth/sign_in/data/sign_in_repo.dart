import 'package:chat_app/core/network/response_result.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignInRepo {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<ResponseResult<User>> signInWithEmail(String email, String password) async {
    try {
      final UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: email.trim(), password: password.trim());
      if (userCredential.user != null) {
        return SuccessResponse(userCredential.user!);
      }
      return FailureResponse("Something went wrong");
    } on FirebaseAuthException catch (error) {
      return FailureResponse(error.code);
    } catch (error) {
      return FailureResponse(error.toString());
    }
  }
}
