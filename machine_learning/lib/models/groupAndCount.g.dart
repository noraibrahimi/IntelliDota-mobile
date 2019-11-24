// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'groupAndCount.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GroupAndCount _$GroupAndCountFromJson(Map<String, dynamic> json) {
  return GroupAndCount(
    bucket: double.parse(json['bucket'] as String),
    count: double.parse(json['count'] as String),
    lowerBound: json['lowerBound'],
    upperBound: json['upperBound'],
  );
}

Map<String, dynamic> _$GroupAndCountToJson(GroupAndCount instance) =>
    <String, dynamic>{
      'bucket': instance.bucket,
      'count': instance.count,
      'lowerBound': instance.lowerBound,
      'upperBound': instance.upperBound,
    };
