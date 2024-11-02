import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:krishi/features/shop/models/cart_details_model.dart';

class CartDetailsController extends GetxController {
  final RxList<String> _cardItem = <String>[].obs;
  final RxList<int> _itemQuantity = <int>[].obs;
  final RxList<int> _itemPrice = <int>[].obs;
  final RxList<String> _productId = <String>[].obs;

  RxList<String> get cardItem => _cardItem;

  set cardItem(List<String> item) {
    _cardItem.addAll(item);
    update();
  }

  RxList<int> get itemQuantity => _itemQuantity;

  set itemQuantity(List<int> item) {
    _itemQuantity.addAll(item);
    update();
  }

  RxList<int> get itemPrice => _itemPrice;

  set itemPrice(List<int> item) {
    _itemPrice.addAll(item);
    update();
  }

  RxList<String> get productId => _productId;

  set productId(List<String> item) {
    _productId.addAll(item);
    update();
  }

  void deleteItem(index) {
    _itemPrice.removeAt(index);
    _itemQuantity.removeAt(index);
    _cardItem.removeAt(index);
    _productId.removeAt(index);
    update();
  }

  void deleteAllItems() {
    _itemPrice.clear();
    _itemQuantity.clear();
    _cardItem.clear();
    _productId.clear();
    update();
  }

  Future<void> addProductsToFirebase({String? uid}) async {
    CollectionReference users =
        FirebaseFirestore.instance.collection("products");
    try {
      users.doc(uid).set(CartDetailsModel(
              itemName: _cardItem,
              itemQuantity: _itemQuantity,
              itemPrice: _itemPrice)
          .toJson());
    } catch (e) {
      throw Exception(e);
    }
  }
}
