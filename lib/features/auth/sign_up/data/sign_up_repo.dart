import 'package:chat_app/core/network/response_result.dart';
import 'package:chat_app/core/shared/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpRepo {
  Future<ResponseResult<bool>> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      return SuccessResponse(true);
    } on FirebaseAuthException catch (error) {
      return FailureResponse(error.code);
    } catch (error) {
      return FailureResponse(error.toString());
    }
  }

  Future<ResponseResult<User>> signUpWithEmail(String email, String password) async {
    try {
      final UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email.trim(), password: password.trim());
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

  Future<ResponseResult<bool>> saveUserData(UserModel user) async {
    try {
      await FirebaseFirestore.instance.collection("users").doc(user.uid).set({...user.toJson(), "createdAt": FieldValue.serverTimestamp()});
      return SuccessResponse(true);
    } catch (error) {
      return FailureResponse(error.toString());
    }
  }

  Future<ResponseResult<UserModel>> signUpAndSaveUser(UserModel user, String password) async {
    ResponseResult<User> response = await signUpWithEmail(user.email, password);
    if (response is SuccessResponse<User>) {
      User userFromFireAuth = response.data;
      UserModel userModel = user.copyWith(uid: userFromFireAuth.uid);
      ResponseResult<bool> saveResponse = await saveUserData(userModel);
      if (saveResponse is SuccessResponse<bool>) {
        return SuccessResponse(userModel);
      }
      return FailureResponse((saveResponse as FailureResponse).message);
    }
    return FailureResponse((response as FailureResponse).message);
  }
}
