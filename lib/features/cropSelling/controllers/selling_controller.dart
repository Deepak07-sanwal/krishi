import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class SellingController extends GetxController {
  final Rx<String> _cropName = "".obs;
  final Rx<int> _cropPrice = 0.obs;
  final Rx<int> _cropQuantity = 0.obs;

  String get cropName => _cropName.value;
  int get cropPrice => _cropPrice.value;
  int get cropQuantity => _cropQuantity.value;

  set cropName(String value) {
    _cropName.value = value;
    update();
  }

  set cropPrice(int value) {
    _cropPrice.value = value;
    update();
  }

  set cropQuantity(int value) {
    _cropQuantity.value = value;
    update();
  }

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void addValueToList(String? uid) async {
    final String documentId = uid ?? "default";
    const String fieldName = 'products';
    // Replace 'new_value' with the value you want to add
    final newValue = {
      'cropName': cropName,
      'cropPrice': cropPrice,
      'cropQuantity': cropQuantity,
    };

    DocumentReference documentReference =
        _firestore.collection('selling').doc(documentId);

    await _firestore.runTransaction((transaction) async {
      DocumentSnapshot snapshot = await transaction.get(documentReference);

      if (snapshot.exists) {
        List<dynamic> currentList = snapshot.get(fieldName);
        currentList.add(newValue);
        transaction.update(documentReference, {fieldName: currentList});
      } else {
        // If the document does not exist, create it with the new value in the list
        transaction.set(documentReference, {
          fieldName: [newValue],
        });
      }
    });

    print("Value added to list");
  }
}
