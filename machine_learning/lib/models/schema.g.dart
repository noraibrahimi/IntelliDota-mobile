// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Schema _$SchemaFromJson(Map<String, dynamic> json) {
  return Schema(
    column: json['column'] as String,
    type: json['type'] as String,
  );
}

Map<String, dynamic> _$SchemaToJson(Schema instance) => <String, dynamic>{
      'column': instance.column,
      'type': instance.type,
    };
