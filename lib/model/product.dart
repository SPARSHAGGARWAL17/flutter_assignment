import 'dart:convert';

import 'package:hive/hive.dart';

part 'product.g.dart';

@HiveType(typeId: 0)
class Product extends HiveObject {
  @HiveField(0)
  final String season;
  @HiveField(1)
  final String brand;
  @HiveField(2)
  final String mood;
  @HiveField(3)
  final String gender;
  @HiveField(4)
  final String theme;
  @HiveField(5)
  final String category;
  @HiveField(6)
  final String name;
  @HiveField(7)
  final String color;
  @HiveField(8)
  final String option;
  @HiveField(9)
  final double mrp;
  @HiveField(10)
  final String subCategory;
  @HiveField(11)
  final String collection;
  @HiveField(12)
  final String fit;
  @HiveField(13)
  final String description;
  @HiveField(14)
  final String qrCode;
  @HiveField(15)
  final String looks;
  @HiveField(16)
  final String? looksImageUrl;
  @HiveField(17)
  final String fabric;
  @HiveField(18)
  final Map<String, dynamic> ean;
  @HiveField(19)
  final String finish;
  @HiveField(20)
  final List<String> availableSizes;
  @HiveField(21)
  final String? sizeWiseStock;
  @HiveField(22)
  final List<String> offerMonths;
  @HiveField(23)
  final int productClass;
  @HiveField(24)
  final bool promoted;
  @HiveField(25)
  final bool secondary;
  @HiveField(26)
  final bool deactivated;
  @HiveField(27)
  final dynamic defaultSize;
  @HiveField(28)
  final String material;
  @HiveField(29)
  final String quality;
  @HiveField(30)
  final String qrCode2;
  @HiveField(31)
  final String displayName;
  @HiveField(32)
  final int displayOrder;
  @HiveField(33)
  final int minQuantity;
  @HiveField(34)
  final int maxQuantity;
  @HiveField(35)
  final String qpsCode;
  @HiveField(36)
  final dynamic demandType;
  @HiveField(37)
  final String image;
  @HiveField(38)
  final String imageUrl;
  @HiveField(39)
  final bool adShoot;
  @HiveField(40)
  final String technology;
  @HiveField(41)
  final String imageAlt;
  @HiveField(42)
  final dynamic technologyImage;
  @HiveField(43)
  final String technologyImageUrl;
  @HiveField(44)
  final bool isCore;
  @HiveField(45)
  final int minimumArticleQuantity;
  @HiveField(46)
  final double likeabilty;
  @HiveField(47)
  final String brandRank;
  @HiveField(48)
  bool isExpanded;

  Product({
    required this.season,
    required this.brand,
    required this.mood,
    required this.gender,
    required this.theme,
    required this.category,
    required this.name,
    required this.color,
    required this.option,
    required this.mrp,
    required this.subCategory,
    required this.collection,
    required this.fit,
    required this.qrCode,
    required this.looks,
    required this.looksImageUrl,
    required this.fabric,
    required this.ean,
    required this.finish,
    this.isExpanded = false,
    required this.availableSizes,
    required this.sizeWiseStock,
    required this.offerMonths,
    required this.productClass,
    required this.promoted,
    required this.secondary,
    required this.deactivated,
    required this.defaultSize,
    required this.material,
    required this.quality,
    required this.qrCode2,
    required this.displayName,
    required this.displayOrder,
    required this.minQuantity,
    required this.maxQuantity,
    required this.qpsCode,
    required this.demandType,
    required this.image,
    required this.imageUrl,
    required this.adShoot,
    required this.technology,
    required this.imageAlt,
    required this.technologyImage,
    required this.technologyImageUrl,
    required this.isCore,
    required this.minimumArticleQuantity,
    required this.likeabilty,
    required this.brandRank,
    required this.description,
  });

  Map<String, dynamic> toMap() {
    return {
      'season': season,
      'brand': brand,
      'mood': mood,
      'gender': gender,
      'theme': theme,
      'category': category,
      'name': name,
      'color': color,
      'option': option,
      'mrp': mrp,
      'subCategory': subCategory,
      'collection': collection,
      'fit': fit,
      'description': description,
      'qrCode': qrCode,
      'looks': looks,
      'looksImageUrl': looksImageUrl,
      'fabric': fabric,
      'ean': ean,
      'finish': finish,
      'availableSizes': availableSizes,
      'sizeWiseStock': sizeWiseStock,
      'offerMonths': offerMonths,
      'productClass': productClass,
      'promoted': promoted,
      'secondary': secondary,
      'deactivated': deactivated,
      'defaultSize': defaultSize,
      'material': material,
      'quality': quality,
      'qrCode2': qrCode2,
      'displayName': displayName,
      'displayOrder': displayOrder,
      'minQuantity': minQuantity,
      'maxQuantity': maxQuantity,
      'qpsCode': qpsCode,
      'demandType': demandType,
      'image': image,
      'imageUrl': imageUrl,
      'adShoot': adShoot,
      'technology': technology,
      'imageAlt': imageAlt,
      'technologyImage': technologyImage,
      'technologyImageUrl': technologyImageUrl,
      'isCore': isCore,
      'minimumArticleQuantity': minimumArticleQuantity,
      'likeabilty': likeabilty,
      'brandRand': brandRank,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      season: map['Season'],
      brand: map['Brand'],
      mood: map['Mood'],
      gender: map['Gender'],
      theme: map['Theme'],
      category: map['Category'],
      name: map['Name'],
      color: map['Color'],
      option: map['Option'],
      mrp: map['MRP'],
      subCategory: map['SubCategory'],
      collection: map['Collection'],
      fit: map['Fit'],
      description: map['Description'],
      qrCode: map['QRCode'],
      looks: map['Looks'],
      looksImageUrl: map['LooksImageUrl'] != null ? map['LooksImageUrl'] : null,
      fabric: map['Fabric'],
      ean: map['EAN'],
      finish: map['Finish'],
      availableSizes: List<String>.from(map['AvailableSizes']),
      sizeWiseStock: map['SizeWiseStock'] != null ? map['SizeWiseStock'] : null,
      offerMonths: List<String>.from(map['OfferMonths']),
      productClass: map['ProductClass'],
      promoted: map['Promoted'],
      secondary: map['Secondary'],
      deactivated: map['Deactivated'],
      defaultSize: map['DefaultSize'],
      material: map['Material'],
      quality: map['Quality'],
      qrCode2: map['QRCode2'],
      displayName: map['DisplayName'],
      displayOrder: map['DisplayOrder'],
      minQuantity: map['MinQuantity'],
      maxQuantity: map['MaxQuantity'],
      qpsCode: map['QPSCode'],
      demandType: map['DemandType'],
      image: map['Image'],
      imageUrl: map['ImageUrl'].toString(),
      adShoot: map['AdShoot'],
      technology: map['Technology'],
      imageAlt: map['ImageAlt'],
      technologyImage: map['TechnologyImage'],
      technologyImageUrl: map['TechnologyImageUrl'].toString(),
      isCore: map['IsCore'],
      minimumArticleQuantity: map['MinimumArticleQuantity'],
      likeabilty: map['Likeabilty'],
      brandRank: map['BrandRank'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source));
}
