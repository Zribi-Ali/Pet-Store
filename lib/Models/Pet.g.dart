// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Pet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pets _$PetsFromJson(Map<String, dynamic> json) => Pets(
      json['id'] as String,
      json['name'] as String,
      (json['photoUrls'] as List<dynamic>)
          .map((e) => Tages.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['status'] as List<dynamic>,
      Category.fromJson(json['category'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PetsToJson(Pets instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'photoUrls': instance.photoUrls.map((e) => e.toJson()).toList(),
      'status': instance.status,
      'category': instance.category.toJson(),
    };
