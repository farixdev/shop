import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:shop/features/shop/models/product_attribute_model.dart';
import 'package:shop/features/shop/models/product_variation_model.dart';

class ProductModel {
  String id;
  String title;
  String brand;
  double price;
  double salePrice;
  String thumbnail;
  bool isFeatured;
  String categoryId;
  String description;
  String productType; // 'single' or 'variable'
  List<ProductAttributeModel>? productAttributes;
  List<ProductVariationModel>? productVariations;

  ProductModel({
    required this.id,
    required this.title,
    required this.brand,
    required this.price,
    this.salePrice = 0.0,
    required this.thumbnail,
    this.isFeatured = false,
    this.categoryId = '',
    this.description = '',
    this.productType = 'single',
    this.productAttributes,
    this.productVariations,
  });

  static ProductModel empty() => ProductModel(id: '', title: '', brand: '', price: 0.0, thumbnail: '');

  Map<String, dynamic> toJson() {
    return {
      'Title': title,
      'Brand': brand,
      'Price': price,
      'SalePrice': salePrice,
      'Thumbnail': thumbnail,
      'IsFeatured': isFeatured,
      'CategoryId': categoryId,
      'Description': description,
      'ProductType': productType,
      'ProductAttributes': productAttributes != null ? productAttributes!.map((e) => e.toJson()).toList() : [],
      'ProductVariations': productVariations != null ? productVariations!.map((e) => e.toJson()).toList() : [],
    };
  }

  factory ProductModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() == null) return ProductModel.empty();
    final data = document.data()!;
    return ProductModel(
      id: document.id,
      title: data['Title'] ?? '',
      brand: data['Brand'] ?? '',
      price: double.parse((data['Price'] ?? 0.0).toString()),
      salePrice: double.parse((data['SalePrice'] ?? 0.0).toString()),
      thumbnail: data['Thumbnail'] ?? '',
      isFeatured: data['IsFeatured'] ?? false,
      categoryId: data['CategoryId'] ?? '',
      description: data['Description'] ?? '',
      productType: data['ProductType'] ?? 'single',
      productAttributes: (data['ProductAttributes'] as List<dynamic>?)?.map((e) => ProductAttributeModel.fromJson(e)).toList(),
      productVariations: (data['ProductVariations'] as List<dynamic>?)?.map((e) => ProductVariationModel.fromJson(e)).toList(),
    );
  }
}
