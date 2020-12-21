// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Category _$CategoryFromJson(Map<String, dynamic> json) {
  return Category(
    name: json['name'] as String,
    color: json['color'] as String,
    todo: (json['todo'] as List)
        ?.map(
            (e) => e == null ? null : Todo.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'name': instance.name,
      'color': instance.color,
      'todo': instance.todo?.map((e) => e?.toJson())?.toList(),
    };

Todo _$TodoFromJson(Map<String, dynamic> json) {
  return Todo(
    name: json['name'] as String,
    descrip: json['descrip'] as String,
    isDone: json['isDone'] as bool,
    dateTime: json['dateTime'] as String,
  );
}

Map<String, dynamic> _$TodoToJson(Todo instance) => <String, dynamic>{
      'name': instance.name,
      'descrip': instance.descrip,
      'isDone': instance.isDone,
      'dateTime': instance.dateTime,
    };
