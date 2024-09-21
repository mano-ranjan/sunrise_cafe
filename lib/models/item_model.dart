class ItemModel {
  int? id;
  String? imageUrl;
  String? name;
  int? price;

  ItemModel({this.id, this.imageUrl, this.name, this.price});

  ItemModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imageUrl = json['image_url'];
    name = json['name'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['image_url'] = imageUrl;
    data['name'] = name;
    data['price'] = price;
    return data;
  }

  // Override equality based on 'id'
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ItemModel && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}
