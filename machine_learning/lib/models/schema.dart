import 'package:json_annotation/json_annotation.dart';

part 'schema.g.dart';

@JsonSerializable()
class Schema {
  String column;
  String type;

  Schema({this.column, this.type});


  factory Schema.fromMappedJson(Map<String, dynamic> json) =>
      _$SchemaFromJson(json);

  Map<String, dynamic> toJson() => _$SchemaToJson(this);
}
