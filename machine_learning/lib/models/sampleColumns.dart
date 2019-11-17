import 'package:json_annotation/json_annotation.dart';
part 'sampleColumns.g.dart';

@JsonSerializable()
class SampleColumns {
Map<String,dynamic> sampleElements;

SampleColumns({
 this.sampleElements
  });

  factory SampleColumns.fromMappedJson(Map<String, dynamic> json) =>
      _$SampleColumnsFromJson(json);

  Map<String, dynamic> toJson() => _$SampleColumnsToJson(this);
}
