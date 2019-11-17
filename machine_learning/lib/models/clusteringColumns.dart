import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class ClusteringColumns {
  @JsonKey(name: "gold_per_min")
  double goldPerMin;
  int level;
  @JsonKey(name: "leaver_status")
  int leaverStatus;
  @JsonKey(name: "xp_per_min")
  double xpPerMin;
  @JsonKey(name: "radiant_score")
  double radiantScore;
  @JsonKey(name: "gold_spent")
  int goldSpent;
  double deaths;
  double denies;
  @JsonKey(name: "hero_damage")
  double heroDamage;
  @JsonKey(name: "tower_damage")
  double towerDamage;
  @JsonKey(name: "last_hits")
  double lastHits;
  @JsonKey(name: "heroHealing")
  double heroHealing;
  double duration;
  @JsonKey(name: "radiant_win")
  int radiantWin;

  double level;

  ClusteringColumns({
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

  factory ClusteringColumns.fromMappedJson(Map<String, dynamic> json) =>
      _$ClusteringColumnsFromJson(json);

  Map<String, dynamic> toJson() => _$ClusteringColumnsToJson(this);
}
