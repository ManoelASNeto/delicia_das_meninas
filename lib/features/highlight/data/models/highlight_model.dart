import 'package:equatable/equatable.dart';
import 'package:loja_delicia_das_meninas/features/highlight/domain/entities/highlight_entity.dart';

class HighLightModel extends Equatable {
  final String? title;
  final String? image;

  const HighLightModel({
    this.title,
    this.image,
  });

  @override
  List<Object?> get props => [
        title,
        image,
      ];

  factory HighLightModel.fromJson(Map<String, dynamic> json) => HighLightModel(
        title: json['title'],
        image: json['image'],
      );

  factory HighLightModel.fromEntity(HighLight entity) => HighLightModel(
        title: entity.title,
        image: entity.image,
      );

  HighLight toEntity() => HighLight(
        title: title,
        image: image,
      );
}
