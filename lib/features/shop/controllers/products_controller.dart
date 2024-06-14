import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:krishi/features/shop/models/products_model.dart';

class ProductsController extends GetxController {
  List<ProductsModel> products = [];
  Future<List<ProductsModel>> getAllSeedsData() async {
    final snapshot = await FirebaseFirestore.instance.collection("seeds").get();
    final userDetails = snapshot.docs
        .map((e) => ProductsModel.fromSnapshot(
            e as DocumentSnapshot<Map<String, dynamic>>))
        .toList();
    return userDetails;
  }

  Future<List<ProductsModel>> getAllPesticideData() async {
    final snapshot =
        await FirebaseFirestore.instance.collection("pesticide").get();
    final userDetails = snapshot.docs
        .map((e) => ProductsModel.fromSnapshot(
            e as DocumentSnapshot<Map<String, dynamic>>))
        .toList();
    return userDetails;
  }

  Future<List<ProductsModel>> getAllFertilizerData() async {
    final snapshot =
        await FirebaseFirestore.instance.collection("pesticide").get();
    final userDetails = snapshot.docs
        .map((e) => ProductsModel.fromSnapshot(
            e as DocumentSnapshot<Map<String, dynamic>>))
        .toList();
    return userDetails;
  }
}
