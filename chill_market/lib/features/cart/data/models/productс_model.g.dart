// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'productс_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductCModelAdapter extends TypeAdapter<ProductCModel> {
  @override
  final int typeId = 1;

  @override
  ProductCModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductCModel(
      id: fields[0] as int,
      title: fields[1] as String,
      price: fields[2] as int,
      description: fields[3] as String,
      images: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ProductCModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.price)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.images);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductCModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
