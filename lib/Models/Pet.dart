import 'package:json_annotation/json_annotation.dart';
import 'package:pettore/Models/Category.dart';
import 'package:pettore/Models/Tages.dart';

part 'Pet.g.dart';

@JsonSerializable(explicitToJson: true)
class Pets {
  final String id;
  final String name;
  final List<Tages> photoUrls;
  final List status;
  final Category category;

  Pets(this.id, this.name, this.photoUrls, this.status, this.category);

  factory Pets.fromJson(Map<String, dynamic> json) => _$PetsFromJson(json);

  Map<String, dynamic> toJson() => _$PetsToJson(this);
}
