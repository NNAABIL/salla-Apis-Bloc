// To parse this JSON data, do
//
//     final homeModel = homeModelFromJson(jsonString);

import 'dart:convert';

HomeModel homeModelFromJson(String str) => HomeModel.fromJson(json.decode(str));

String homeModelToJson(HomeModel data) => json.encode(data.toJson());

class HomeModel {
  HomeModel({
    this.status,
    this.message,
    this.data,
  });

  bool status;
  dynamic message;
  HomeDataModel data;

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
    status: json["status"] == null ? null : json["status"],
    message: json["message"],
    data: json["data"] == null ? null : HomeDataModel.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status == null ? null : status,
    "message": message,
    "data": data == null ? null : data.toJson(),
  };
}

class HomeDataModel {
  HomeDataModel({
    this.banners,
    this.products,
    this.ad,
  });

  List<Banner> banners;
  List<Product> products;
  String ad;

  factory HomeDataModel.fromJson(Map<String, dynamic> json) => HomeDataModel(
    banners: json["banners"] == null ? null : List<Banner>.from(json["banners"].map((x) => Banner.fromJson(x))),
    products: json["products"] == null ? null : List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
    ad: json["ad"] == null ? null : json["ad"],
  );

  Map<String, dynamic> toJson() => {
    "banners": banners == null ? null : List<dynamic>.from(banners.map((x) => x.toJson())),
    "products": products == null ? null : List<dynamic>.from(products.map((x) => x.toJson())),
    "ad": ad == null ? null : ad,
  };
}

class Banner {
  Banner({
    this.id,
    this.image,
    this.category,
    this.product,
  });

  int id;
  String image;
  Category category;
  dynamic product;

  factory Banner.fromJson(Map<String, dynamic> json) => Banner(
    id: json["id"] == null ? null : json["id"],
    image: json["image"] == null ? null : json["image"],
    category: json["category"] == null ? null : Category.fromJson(json["category"]),
    product: json["product"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "image": image == null ? null : image,
    "category": category == null ? null : category.toJson(),
    "product": product,
  };
}

class Category {
  Category({
    this.id,
    this.image,
    this.name,
  });

  int id;
  String image;
  String name;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"] == null ? null : json["id"],
    image: json["image"] == null ? null : json["image"],
    name: json["name"] == null ? null : json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "image": image == null ? null : image,
    "name": name == null ? null : name,
  };
}

class Product {
  Product({
    this.id,
    this.price,
    this.oldPrice,
    this.discount,
    this.image,
    this.name,
    this.description,
    this.images,
    this.inFavorites,
    this.inCart,
  });

  int id;
  double price;
  double oldPrice;
  int discount;
  String image;
  String name;
  String description;
  List<String> images;
  bool inFavorites;
  bool inCart;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"] == null ? null : json["id"],
    price: json["price"] == null ? null : json["price"].toDouble(),
    oldPrice: json["old_price"] == null ? null : json["old_price"].toDouble(),
    discount: json["discount"] == null ? null : json["discount"],
    image: json["image"] == null ? null : json["image"],
    name: json["name"] == null ? null : json["name"],
    description: json["description"] == null ? null : json["description"],
    images: json["images"] == null ? null : List<String>.from(json["images"].map((x) => x)),
    inFavorites: json["in_favorites"] == null ? null : json["in_favorites"],
    inCart: json["in_cart"] == null ? null : json["in_cart"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "price": price == null ? null : price,
    "old_price": oldPrice == null ? null : oldPrice,
    "discount": discount == null ? null : discount,
    "image": image == null ? null : image,
    "name": name == null ? null : name,
    "description": description == null ? null : description,
    "images": images == null ? null : List<dynamic>.from(images.map((x) => x)),
    "in_favorites": inFavorites == null ? null : inFavorites,
    "in_cart": inCart == null ? null : inCart,
  };
}
