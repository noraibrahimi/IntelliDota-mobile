// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stage.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Stage _$StageFromJson(Map<String, dynamic> json) {
  return Stage(
    bucket: double.parse(json['bucket']) as double,
    count: double.parse(json['count']) as double,
  );
}

Map<String, dynamic> _$StageToJson(Stage instance) => <String, dynamic>{
      'bucket': instance.bucket,
      'count': instance.count,
    };
