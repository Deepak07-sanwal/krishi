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

  bool loginAuthentication(String email, String password) {
    if (email == "admin" && password == "admin") {
      return true;
    } else {
      return false;
    }
  }
}
