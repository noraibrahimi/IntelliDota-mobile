// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stage.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Stage _$StageFromJson(Map<String, dynamic> json) {
  return Stage(
    bucket: (json['bucket'] as num)?.toDouble(),
    count: (json['count'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$StageToJson(Stage instance) => <String, dynamic>{
      'bucket': instance.bucket,
      'count': instance.count,
    };
