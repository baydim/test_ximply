// To parse this JSON data, do
//
//     final responseProduct = responseProductFromJson(jsonString);

import 'dart:convert';

ResponseProduct responseProductFromJson(String str) =>
    ResponseProduct.fromJson(json.decode(str));

String responseProductToJson(ResponseProduct data) =>
    json.encode(data.toJson());

class ResponseProduct {
  bool? status;
  String? message;
  dynamic errors;
  Data? data;

  ResponseProduct({
    this.status,
    this.message,
    this.errors,
    this.data,
  });

  factory ResponseProduct.fromJson(Map<String, dynamic> json) =>
      ResponseProduct(
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
  int? currentPage;
  List<Product>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Link>? links;
  String? nextPageUrl;
  String? path;
  int? perPage;
  dynamic prevPageUrl;
  int? to;
  int? total;

  Data({
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.links,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        currentPage: json["current_page"],
        data: json["data"] == null
            ? []
            : List<Product>.from(json["data"]!.map((x) => Product.fromJson(x))),
        firstPageUrl: json["first_page_url"],
        from: json["from"],
        lastPage: json["last_page"],
        lastPageUrl: json["last_page_url"],
        links: json["links"] == null
            ? []
            : List<Link>.from(json["links"]!.map((x) => Link.fromJson(x))),
        nextPageUrl: json["next_page_url"],
        path: json["path"],
        perPage: json["per_page"],
        prevPageUrl: json["prev_page_url"],
        to: json["to"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "first_page_url": firstPageUrl,
        "from": from,
        "last_page": lastPage,
        "last_page_url": lastPageUrl,
        "links": links == null
            ? []
            : List<dynamic>.from(links!.map((x) => x.toJson())),
        "next_page_url": nextPageUrl,
        "path": path,
        "per_page": perPage,
        "prev_page_url": prevPageUrl,
        "to": to,
        "total": total,
      };
}

class Product {
  String? id;
  String? sku;
  String? name;
  String? description;
  String? price;
  String? priceMember;
  int? stock;
  String? categoryId;
  Category? category;
  List<dynamic>? variants;
  List<Image>? images;
  Shipping? shipping;
  List<dynamic>? options;
  List<Shipper>? shippers;

  Product({
    this.id,
    this.sku,
    this.name,
    this.description,
    this.price,
    this.priceMember,
    this.stock,
    this.categoryId,
    this.category,
    this.variants,
    this.images,
    this.shipping,
    this.options,
    this.shippers,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        sku: json["sku"],
        name: json["name"],
        description: json["description"],
        price: json["price"],
        priceMember: json["price_member"],
        stock: json["stock"],
        categoryId: json["category_id"],
        category: json["category"] == null
            ? null
            : Category.fromJson(json["category"]),
        variants: json["variants"] == null
            ? []
            : List<dynamic>.from(json["variants"]!.map((x) => x)),
        images: json["images"] == null
            ? []
            : List<Image>.from(json["images"]!.map((x) => Image.fromJson(x))),
        shipping: json["shipping"] == null
            ? null
            : Shipping.fromJson(json["shipping"]),
        options: json["options"] == null
            ? []
            : List<dynamic>.from(json["options"]!.map((x) => x)),
        shippers: json["shippers"] == null
            ? []
            : List<Shipper>.from(
                json["shippers"]!.map((x) => Shipper.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "sku": sku,
        "name": name,
        "description": description,
        "price": price,
        "price_member": priceMember,
        "stock": stock,
        "category_id": categoryId,
        "category": category?.toJson(),
        "variants":
            variants == null ? [] : List<dynamic>.from(variants!.map((x) => x)),
        "images": images == null
            ? []
            : List<dynamic>.from(images!.map((x) => x.toJson())),
        "shipping": shipping?.toJson(),
        "options":
            options == null ? [] : List<dynamic>.from(options!.map((x) => x)),
        "shippers": shippers == null
            ? []
            : List<dynamic>.from(shippers!.map((x) => x.toJson())),
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

class Image {
  String? id;
  String? productId;
  String? imagePath;

  Image({
    this.id,
    this.productId,
    this.imagePath,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
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

class Link {
  String? url;
  String? label;
  bool? active;

  Link({
    this.url,
    this.label,
    this.active,
  });

  factory Link.fromJson(Map<String, dynamic> json) => Link(
        url: json["url"],
        label: json["label"],
        active: json["active"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "label": label,
        "active": active,
      };
}
