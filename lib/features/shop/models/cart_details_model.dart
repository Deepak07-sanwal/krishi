class CartDetailsModel {
  List<String> itemName;
  List<int> itemQuantity;
  List<int> itemPrice;

  CartDetailsModel({
    required this.itemName,
    required this.itemQuantity,
    required this.itemPrice,
  });

  Map<String, dynamic> toJson() {
    return {
      'itemName': itemName,
      'itemQuantity': itemQuantity,
      'itemPrice': itemPrice,
    };
  }
}
