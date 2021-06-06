// To parse this JSON data, do
//
//     final favoritesModel = favoritesModelFromJson(jsonString);

import 'dart:convert';


class FavoritesModel {
  FavoritesModel({
    this.status,
    this.message,
    this.data,
  });

  bool status;
  dynamic message;
  FavoriteData data;

  factory FavoritesModel.fromJson(Map<String, dynamic> json) => FavoritesModel(
    status: json["status"] == null ? null : json["status"],
    message: json["message"],
    data: json["data"] == null ? null : FavoriteData.fromJson(json["data"]),
  );

}

class FavoriteData {
  FavoriteData({
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  int currentPage;
  List<FavoriteItem> data;
  String firstPageUrl;
  int from;
  int lastPage;
  String lastPageUrl;
  dynamic nextPageUrl;
  String path;
  int perPage;
  dynamic prevPageUrl;
  int to;
  int total;

  factory FavoriteData.fromJson(Map<String, dynamic> json) => FavoriteData(
    currentPage: json["current_page"] == null ? null : json["current_page"],
    data: json["data"] == null ? null : List<FavoriteItem>.from(json["data"].map((x) => FavoriteItem.fromJson(x))),
    firstPageUrl: json["first_page_url"] == null ? null : json["first_page_url"],
    from: json["from"] == null ? null : json["from"],
    lastPage: json["last_page"] == null ? null : json["last_page"],
    lastPageUrl: json["last_page_url"] == null ? null : json["last_page_url"],
    nextPageUrl: json["next_page_url"],
    path: json["path"] == null ? null : json["path"],
    perPage: json["per_page"] == null ? null : json["per_page"],
    prevPageUrl: json["prev_page_url"],
    to: json["to"] == null ? null : json["to"],
    total: json["total"] == null ? null : json["total"],
  );

}

class FavoriteItem {
  FavoriteItem({
    this.id,
    this.product,
  });

  int id;
  Product product;

  factory FavoriteItem.fromJson(Map<String, dynamic> json) => FavoriteItem(
    id: json["id"] == null ? null : json["id"],
    product: json["product"] == null ? null : Product.fromJson(json["product"]),
  );

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
  });

  int id;
  int price;
  int oldPrice;
  int discount;
  String image;
  String name;
  String description;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"] == null ? null : json["id"],
    price: json["price"] == null ? null : json["price"],
    oldPrice: json["old_price"] == null ? null : json["old_price"],
    discount: json["discount"] == null ? null : json["discount"],
    image: json["image"] == null ? null : json["image"],
    name: json["name"] == null ? null : json["name"],
    description: json["description"] == null ? null : json["description"],
  );


}
