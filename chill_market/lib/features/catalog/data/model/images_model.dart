import 'package:chill_market/features/catalog/domain/entity/images.dart';

class ImagesModel {
  final List<String> img;

  ImagesModel({required this.img});

  factory ImagesModel.fromJson(Map<String, dynamic> json) {
    final List<String> imgJson = json['images'];
    return ImagesModel(img: imgJson);
  }

  Images toEntity() {
    return Images(img: img);
  }
}
