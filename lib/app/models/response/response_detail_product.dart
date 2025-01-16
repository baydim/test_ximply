// To parse this JSON data, do
//
//     final responseDetailProduct = responseDetailProductFromJson(jsonString);

import 'dart:convert';

ResponseDetailProduct responseDetailProductFromJson(String str) =>
    ResponseDetailProduct.fromJson(json.decode(str));

String responseDetailProductToJson(ResponseDetailProduct data) =>
    json.encode(data.toJson());

class ResponseDetailProduct {
  bool? status;
  String? message;
  dynamic errors;
  Data? data;

  ResponseDetailProduct({
    this.status,
    this.message,
    this.errors,
    this.data,
  });

  factory ResponseDetailProduct.fromJson(Map<String, dynamic> json) =>
      ResponseDetailProduct(
        status: json["status"],
        message: json["message"],
        errors: json["errors"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "errors": errors,
        "data": data?.toJson(),
      };
}

class Data {
  String? id;
  Category? category;
  String? sku;
  String? name;
  String? description;
  String? price;
  String? priceMember;
  int? stock;
  List<dynamic>? variants;
  List<ImageProd>? images;
  Shipping? shipping;
  List<Shipper>? shippers;
  List<dynamic>? options;

  Data({
    this.id,
    this.category,
    this.sku,
    this.name,
    this.description,
    this.price,
    this.priceMember,
    this.stock,
    this.variants,
    this.images,
    this.shipping,
    this.shippers,
    this.options,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        category: json["category"] == null
            ? null
            : Category.fromJson(json["category"]),
        sku: json["sku"],
        name: json["name"],
        description: json["description"],
        price: json["price"],
        priceMember: json["price_member"],
        stock: json["stock"],
        variants: json["variants"] == null
            ? []
            : List<dynamic>.from(json["variants"]!.map((x) => x)),
        images: json["images"] == null
            ? []
            : List<ImageProd>.from(
                json["images"]!.map((x) => ImageProd.fromJson(x))),
        shipping: json["shipping"] == null
            ? null
            : Shipping.fromJson(json["shipping"]),
        shippers: json["shippers"] == null
            ? []
            : List<Shipper>.from(
                json["shippers"]!.map((x) => Shipper.fromJson(x))),
        options: json["options"] == null
            ? []
            : List<dynamic>.from(json["options"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category": category?.toJson(),
        "sku": sku,
        "name": name,
        "description": description,
        "price": price,
        "price_member": priceMember,
        "stock": stock,
        "variants":
            variants == null ? [] : List<dynamic>.from(variants!.map((x) => x)),
        "images": images == null
            ? []
            : List<dynamic>.from(images!.map((x) => x.toJson())),
        "shipping": shipping?.toJson(),
        "shippers": shippers == null
            ? []
            : List<dynamic>.from(shippers!.map((x) => x.toJson())),
        "options":
            options == null ? [] : List<dynamic>.from(options!.map((x) => x)),
      };
}

class Category {
  String? id;
  String? name;
  DateTime? createdAt;

  Category({
    this.id,
    this.name,
    this.createdAt,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "created_at": createdAt?.toIso8601String(),
      };
}

class ImageProd {
  String? id;
  String? productId;
  String? imagePath;

  ImageProd({
    this.id,
    this.productId,
    this.imagePath,
  });

  factory ImageProd.fromJson(Map<String, dynamic> json) => ImageProd(
        id: json["id"],
        productId: json["product_id"],
        imagePath: json["image_path"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_id": productId,
        "image_path": imagePath,
      };
}

class Shipper {
  int? id;
  String? name;
  String? code;

  Shipper({
    this.id,
    this.name,
    this.code,
  });

  factory Shipper.fromJson(Map<String, dynamic> json) => Shipper(
        id: json["id"],
        name: json["name"],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "code": code,
      };
}

class Shipping {
  int? weight;
  int? length;
  int? width;
  int? height;

  Shipping({
    this.weight,
    this.length,
    this.width,
    this.height,
  });

  factory Shipping.fromJson(Map<String, dynamic> json) => Shipping(
        weight: json["weight"],
        length: json["length"],
        width: json["width"],
        height: json["height"],
      );

  Map<String, dynamic> toJson() => {
        "weight": weight,
        "length": length,
        "width": width,
        "height": height,
      };
}
