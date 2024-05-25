import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class CartDetailsController extends GetxController {
  final RxList<String> _cardItem = ["Red Orange", "Test"].obs;
  final RxList<int> _itemQuantity = [10, 20].obs;
  final RxList<int> _itemPrice = [50, 100].obs;

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

  void deleteItem(index) {
    _itemPrice.removeAt(index);
    _itemQuantity.removeAt(index);
    _cardItem.removeAt(index);
  }
}
