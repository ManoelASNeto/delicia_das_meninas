import 'package:equatable/equatable.dart';

class HighLight extends Equatable {
  final String? image;
  final String? title;

  const HighLight({this.image, this.title});

  @override
  List<Object?> get props => [
        image,
        title,
      ];

  get highlightType => null;
}
