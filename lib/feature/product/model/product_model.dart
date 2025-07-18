class ProductResponse {
  List<ItemsModel>? items;

  ProductResponse({this.items});

  ProductResponse.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <ItemsModel>[];
      json['items'].forEach((v) {
        items!.add(new ItemsModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.items != null) {
      data['items'] = this.items?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ItemsModel {
  int? itemId;
  String? itemName;
  String? itemDescription;
  double? itemPrice;
  String? itemImage;
  int? itemQuantity;

  ItemsModel(
      {this.itemId,
      this.itemName,
      this.itemDescription,
      this.itemPrice,
      this.itemImage,
      this.itemQuantity});

  ItemsModel.fromJson(Map<String, dynamic> json) {
    itemId = json['item_id'];
    itemName = json['item_name'];
    itemDescription = json['item_description'];
    itemPrice = json['item_price'];
    itemImage = json['item_image'];
    itemQuantity = json['item_quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['item_id'] = this.itemId;
    data['item_name'] = this.itemName;
    data['item_description'] = this.itemDescription;
    data['item_price'] = this.itemPrice;
    data['item_image'] = this.itemImage;
    data['item_quantity'] = this.itemQuantity;
    return data;
  }

  ItemsModel copyWith({
    int? itemId,
    String? itemName,
    String? itemDescription,
    double? itemPrice,
    String? itemImage,
    int? itemQuantity,
  }) {
    return ItemsModel(
      itemId: itemId ?? this.itemId,
      itemName: itemName ?? this.itemName,
      itemDescription: itemDescription ?? this.itemDescription,
      itemPrice: itemPrice ?? this.itemPrice,
      itemImage: itemImage ?? this.itemImage,
      itemQuantity: itemQuantity ?? this.itemQuantity,
    );
  }
}
