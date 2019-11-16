import 'package:json_annotation/json_annotation.dart';

part 'stageElements.g.dart';

@JsonSerializable()

class StageElements {
  String name;
  String value;

  StageElements({this.name, this.value});
  factory StageElements.fromMappedJson(Map<String, dynamic> json) =>
      _$StageElementsFromJson(json);

  Map<String, dynamic> toJson() => _$StageElementsToJson(this);
}
