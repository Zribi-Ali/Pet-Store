import 'package:json_annotation/json_annotation.dart';

part 'Tages.g.dart';

@JsonSerializable(explicitToJson: true)
class Tages {
  final String id;
  final String name;

  Tages(this.id, this.name);

  factory Tages.fromJson(Map<String, dynamic> json) => _$TagesFromJson(json);
  Map<String, dynamic> toJson() => _$TagesToJson(this);
}
