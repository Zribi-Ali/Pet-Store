import 'package:json_annotation/json_annotation.dart';

part 'Category.g.dart';

@JsonSerializable(explicitToJson: true)
class Category {
  final String id;
  final String name;

  Category(this.id, this.name);

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}
