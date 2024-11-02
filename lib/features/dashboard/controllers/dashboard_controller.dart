import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:krishi/features/dashboard/models/user_model.dart';

class DashboardController extends GetxController {
  final Rx<UserModel> _userInfo = UserModel(
    uid: '',
    name: '',
    email: '',
  ).obs;

  UserModel get userInfo => _userInfo.value;
  set userInfo(UserModel value) {
    _userInfo.value = value;
    update();
  }

  Future<UserModel> getUserData(String uid) async {
    final snapshot = await FirebaseFirestore.instance
        .collection("users")
        .where(
          "uid",
          isEqualTo: uid,
        )
        .get();
    final userDetails = snapshot.docs
        .map((e) =>
            UserModel.fromSnapshot(e as DocumentSnapshot<Map<String, dynamic>>))
        .single;
    _userInfo.value = userDetails;
    update();
    return userDetails;
  }
}
