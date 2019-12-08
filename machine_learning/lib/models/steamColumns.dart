import 'package:json_annotation/json_annotation.dart';

part 'steamColumns.g.dart';

@JsonSerializable()
class SteamColumns {
  @JsonKey(name: "gold_per_min")
  final int goldPerMin;
  final int level;
  @JsonKey(name: "leaver_status")
  final int leaverStatus;
  @JsonKey(name: "xp_per_min")
  final int xpPerMin;
  @JsonKey(name: "radiant_score")
  final int radiantScore;
  @JsonKey(name: "gold_spent")
  final int goldSpent;
  final int deaths;
  final int denies;
  @JsonKey(name: "hero_damage")
  final int heroDamage;
  @JsonKey(name: "tower_damage")
  final int towerDamage;
  @JsonKey(name: "last_hits")
  final int lastHits;
  @JsonKey(name: "hero_healing")
  final int heroHealing;
  final int duration;

  SteamColumns(
      {this.goldPerMin,
      this.level,
      this.leaverStatus,
      this.xpPerMin,
      this.radiantScore,
      this.goldSpent,
      this.deaths,
      this.denies,
      this.heroDamage,
      this.towerDamage,
      this.lastHits,
      this.heroHealing,
      this.duration});

  factory SteamColumns.fromMappedJson(Map<String, dynamic> json) =>
      _$SteamColumnsFromJson(json);

  Map<String, dynamic> toJson() => _$SteamColumnsToJson(this);
}
