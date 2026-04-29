class CartItemModel {
  String productId;
  String title;
  double price;
  String? image;
  int quantity;
  String? variationId;
  String? brand;
  Map<String, String>? selectedAttributes;

  CartItemModel({
    required this.productId,
    required this.quantity,
    this.variationId,
    this.image,
    this.price = 0.0,
    this.title = '',
    this.brand = '',
    this.selectedAttributes,
  });

  static CartItemModel empty() => CartItemModel(productId: '', quantity: 0);

  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'title': title,
      'price': price,
      'image': image,
      'quantity': quantity,
      'brand': brand,
      'variationId': variationId,
      'selectedAttributes': selectedAttributes,
    };
  }

  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      productId: json['productId'],
      title: json['title'],
      price: json['price']?.toDouble() ?? 0.0,
      image: json['image'],
      quantity: json['quantity'],
      brand: json['brand'],
      variationId: json['variationId'],
      selectedAttributes: json['selectedAttributes'] != null ? Map<String, String>.from(json['selectedAttributes']) : null,
    );
  }
}
