import 'package:json_annotation/json_annotation.dart';

part 'kaggleColumns.g.dart';

@JsonSerializable()
class KaggleColumns {
  final double gold;
  @JsonKey(name: "gold_per_min")
  final double goldPerMin;
  @JsonKey(name: "xp_per_min")
  final double xpPerMin;
  final double kills;
  final double deaths;
  final double assists;
  final double denies;
  @JsonKey(name: "last_hits")
  final double lastHits;
  @JsonKey(name: "hero_damage")
  final double heroDamage;
  @JsonKey(name: "hero_healing")
  final double heroHealing;
  @JsonKey(name: "tower_damage")
  final double towerDamage;
  final double level;

  KaggleColumns(
      {this.gold,
      this.goldPerMin,
      this.xpPerMin,
      this.kills,
      this.deaths,
      this.assists,
      this.denies,
      this.lastHits,
      this.heroDamage,
      this.heroHealing,
      this.towerDamage,
      this.level});

  factory KaggleColumns.fromMappedJson(Map<String, dynamic> json) =>
      _$KaggleColumnsFromJson(json);

  Map<String, dynamic> toJson() => _$KaggleColumnsToJson(this);
}
