// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coffee.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Coffee _$$_CoffeeFromJson(Map<String, dynamic> json) => _$_Coffee(
      title: json['title'] as String?,
      description: json['description'] as String?,
      ingredients: (json['ingredients'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      image: json['image'] as String?,
      id: json['id'] as int,
    );

Map<String, dynamic> _$$_CoffeeToJson(_$_Coffee instance) => <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'ingredients': instance.ingredients,
      'image': instance.image,
      'id': instance.id,
    };
