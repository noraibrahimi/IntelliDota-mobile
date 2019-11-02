import 'package:json_annotation/json_annotation.dart';

part 'stage.g.dart';

@JsonSerializable()
class Stage {
  final double bucket;
   final double count;

  Stage({this.bucket, this.count});

  factory Stage.fromMappedJson(Map<String, dynamic> json) =>
      _$StageFromJson(json);

  Map<String, dynamic> toJson() => _$StageToJson(this);
}
