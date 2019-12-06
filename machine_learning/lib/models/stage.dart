import 'package:json_annotation/json_annotation.dart';
import 'package:machine_learning/models/stageElements.dart';

part 'stage.g.dart';

@JsonSerializable()
class Stage {

  final Map<String,List<StageElements>> stage;

  Stage({this.stage});

  factory Stage.fromMappedJson(Map<String, dynamic> json) =>
      _$StageFromJson(json);

  Map<String, dynamic> toJson() => _$StageToJson(this);
}
