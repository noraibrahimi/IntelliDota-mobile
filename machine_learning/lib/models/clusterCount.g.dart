// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clusterCount.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClusterCount _$ClusterCountFromJson(Map<String, dynamic> json) {
  return ClusterCount(
    prediction: json['prediction'] as int,
    count: json['count'] as int,
    color: json['color'],
  );
}

Map<String, dynamic> _$ClusterCountToJson(ClusterCount instance) =>
    <String, dynamic>{
      'prediction': instance.prediction,
      'count': instance.count,
      'color': instance.color,
    };
