import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthenticationController extends GetxController {
  // final Rx<String> _name = "".obs;
  // final Rx<String> _email = "".obs;
  // final Rx<String> _password = "".obs;

  // String get name => _name.value;
  // String get email => _email.value;
  // String get password => _password.value;

  // set name(String value) {
  //   _name.value = value;
  // }

  // set email(String value) {
  //   _email.value = value;
  // }

  // set password(String value) {
  //   _password.value = value;
  // }

  Future<String> loginAuthentication(String email, String password) async {
    String uid = "";
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      uid = credential.user!.uid;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw Exception('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        throw Exception('Wrong password provided for that user.');
      }
    }
    return uid;
  }

  Future<String> signUpAuthentication(String email, String password) async {
    String uid = "";
    try {
      // devtools.log("$email,  $password");
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      uid = credential.user!.uid;
      // devtools.log(credential.toString());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw Exception('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw Exception('The account already exists for that email.');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
    return uid;
  }
}
