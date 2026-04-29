class ProductAttributeModel {
  String? name;
  List<String>? values;

  ProductAttributeModel({this.name, this.values});

  toJson() {
    return {
      'Name': name,
      'Values': values,
    };
  }

  factory ProductAttributeModel.fromJson(Map<String, dynamic> data) {
    if (data.isEmpty) return ProductAttributeModel();
    return ProductAttributeModel(
      name: data['Name'],
      values: List<String>.from(data['Values'] ?? []),
    );
  }
}
