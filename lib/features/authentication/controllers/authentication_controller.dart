import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../models/user_details_model.dart';
import 'package:google_sign_in/google_sign_in.dart';

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

  Future<void> addUserToFirebase(
      {String? name, String? email, String? phoneNumber, String? uid}) async {
    // devtools.log(
    //     "Inside add User : email : $email,$phoneNumber, $name, uid : $uid");
    CollectionReference users = FirebaseFirestore.instance.collection("users");
    try {
      await users.doc(uid).get().then((docSnapshot) {
        if (!docSnapshot.exists) {
          users.doc(uid).set(UserDetailsModel(
                uid: uid,
                name: name,
                email: email,
                phoneNumber: phoneNumber ?? "",
                avatarUrl: "",
              ).toJson());
        }
      });
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<String?> signInwithGoogle() async {
    String uid = "";
    try {
      GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      GoogleSignInAuthentication googleAuth = await googleUser!.authentication;
      AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      UserCredential user =
          await FirebaseAuth.instance.signInWithCredential(credential);
      uid = user.user!.uid;
    } on FirebaseAuthException catch (e) {
      print(e.message);
      throw e;
    }
    return uid;
  }

  Future<bool> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      return true;
    } catch (e) {
      return false;
    }
  }
  // Future<void> signOutFromGoogle() async {
  //   await _googleSignIn.signOut();
  //   await _auth.signOut();
  // }
}
