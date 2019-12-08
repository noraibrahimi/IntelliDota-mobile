import 'package:json_annotation/json_annotation.dart';

part 'clusterCount.g.dart';

@JsonSerializable()
class ClusterCount {
  final int prediction;
  final int count;

  ClusterCount({this.prediction,this.count});

  factory ClusterCount.fromMappedJson(Map<String, dynamic> json) =>
      _$ClusterCountFromJson(json);

  Map<String, dynamic> toJson() => _$ClusterCountToJson(this);
}