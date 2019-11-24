import 'package:json_annotation/json_annotation.dart';

part 'groupAndCount.g.dart';

@JsonSerializable()
class GroupAndCount {
  final double bucket;
  final double count;
  final String lowerBound;
  final String upperBound;

  GroupAndCount({this.bucket, this.count,this.lowerBound,this.upperBound});

  factory GroupAndCount.fromMappedJson(Map<String, dynamic> json) =>
      _$GroupAndCountFromJson(json);

  Map<String, dynamic> toJson() => _$GroupAndCountToJson(this);
}
