// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductAdapter extends TypeAdapter<Product> {
  @override
  final int typeId = 0;

  @override
  Product read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Product(
      season: fields[0] as String,
      brand: fields[1] as String,
      mood: fields[2] as String,
      gender: fields[3] as String,
      theme: fields[4] as String,
      category: fields[5] as String,
      name: fields[6] as String,
      color: fields[7] as String,
      option: fields[8] as String,
      mrp: fields[9] as double,
      subCategory: fields[10] as String,
      collection: fields[11] as String,
      fit: fields[12] as String,
      qrCode: fields[14] as String,
      looks: fields[15] as String,
      looksImageUrl: fields[16] as String?,
      fabric: fields[17] as String,
      ean: (fields[18] as Map).cast<String, dynamic>(),
      finish: fields[19] as String,
      availableSizes: (fields[20] as List).cast<String>(),
      sizeWiseStock: fields[21] as String?,
      offerMonths: (fields[22] as List).cast<String>(),
      productClass: fields[23] as int,
      promoted: fields[24] as bool,
      secondary: fields[25] as bool,
      deactivated: fields[26] as bool,
      defaultSize: fields[27] as dynamic,
      material: fields[28] as String,
      quality: fields[29] as String,
      qrCode2: fields[30] as String,
      displayName: fields[31] as String,
      displayOrder: fields[32] as int,
      minQuantity: fields[33] as int,
      maxQuantity: fields[34] as int,
      qpsCode: fields[35] as String,
      demandType: fields[36] as dynamic,
      image: fields[37] as String,
      imageUrl: fields[38] as String,
      adShoot: fields[39] as bool,
      technology: fields[40] as String,
      imageAlt: fields[41] as String,
      technologyImage: fields[42] as dynamic,
      technologyImageUrl: fields[43] as String,
      isCore: fields[44] as bool,
      minimumArticleQuantity: fields[45] as int,
      likeabilty: fields[46] as double,
      brandRank: fields[47] as String,
      description: fields[13] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Product obj) {
    writer
      ..writeByte(48)
      ..writeByte(0)
      ..write(obj.season)
      ..writeByte(1)
      ..write(obj.brand)
      ..writeByte(2)
      ..write(obj.mood)
      ..writeByte(3)
      ..write(obj.gender)
      ..writeByte(4)
      ..write(obj.theme)
      ..writeByte(5)
      ..write(obj.category)
      ..writeByte(6)
      ..write(obj.name)
      ..writeByte(7)
      ..write(obj.color)
      ..writeByte(8)
      ..write(obj.option)
      ..writeByte(9)
      ..write(obj.mrp)
      ..writeByte(10)
      ..write(obj.subCategory)
      ..writeByte(11)
      ..write(obj.collection)
      ..writeByte(12)
      ..write(obj.fit)
      ..writeByte(13)
      ..write(obj.description)
      ..writeByte(14)
      ..write(obj.qrCode)
      ..writeByte(15)
      ..write(obj.looks)
      ..writeByte(16)
      ..write(obj.looksImageUrl)
      ..writeByte(17)
      ..write(obj.fabric)
      ..writeByte(18)
      ..write(obj.ean)
      ..writeByte(19)
      ..write(obj.finish)
      ..writeByte(20)
      ..write(obj.availableSizes)
      ..writeByte(21)
      ..write(obj.sizeWiseStock)
      ..writeByte(22)
      ..write(obj.offerMonths)
      ..writeByte(23)
      ..write(obj.productClass)
      ..writeByte(24)
      ..write(obj.promoted)
      ..writeByte(25)
      ..write(obj.secondary)
      ..writeByte(26)
      ..write(obj.deactivated)
      ..writeByte(27)
      ..write(obj.defaultSize)
      ..writeByte(28)
      ..write(obj.material)
      ..writeByte(29)
      ..write(obj.quality)
      ..writeByte(30)
      ..write(obj.qrCode2)
      ..writeByte(31)
      ..write(obj.displayName)
      ..writeByte(32)
      ..write(obj.displayOrder)
      ..writeByte(33)
      ..write(obj.minQuantity)
      ..writeByte(34)
      ..write(obj.maxQuantity)
      ..writeByte(35)
      ..write(obj.qpsCode)
      ..writeByte(36)
      ..write(obj.demandType)
      ..writeByte(37)
      ..write(obj.image)
      ..writeByte(38)
      ..write(obj.imageUrl)
      ..writeByte(39)
      ..write(obj.adShoot)
      ..writeByte(40)
      ..write(obj.technology)
      ..writeByte(41)
      ..write(obj.imageAlt)
      ..writeByte(42)
      ..write(obj.technologyImage)
      ..writeByte(43)
      ..write(obj.technologyImageUrl)
      ..writeByte(44)
      ..write(obj.isCore)
      ..writeByte(45)
      ..write(obj.minimumArticleQuantity)
      ..writeByte(46)
      ..write(obj.likeabilty)
      ..writeByte(47)
      ..write(obj.brandRank);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
