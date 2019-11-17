import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class ClassificationColumns {
  double gold;
  @JsonKey(name: "gold_per_min")
  double goldPerMin;
  @JsonKey(name: "xp_per_min")
  double xpPerMin;
  double kills;
  double deaths;
  double assists;
  double denies;
  @JsonKey(name: "last_hits")
  double lastHits;
  @JsonKey(name: "hero_damage")
  double heroDamage;
  @JsonKey(name: "hero_healing")
  double heroHealing;
  @JsonKey(name: "tower_damage")
  double towerDamage;

  double level;

  ClassificationColumns({
    this.gold,
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
    this.level,
  });

  factory ClassificationColumns.fromMappedJson(Map<String, dynamic> json) =>
      _$ClassificationColumnsFromJson(json);

  Map<String, dynamic> toJson() => _$ClassificationColumnsToJson(this);
}
