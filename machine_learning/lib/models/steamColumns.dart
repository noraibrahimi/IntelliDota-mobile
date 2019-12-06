import 'package:json_annotation/json_annotation.dart';

part 'steamColumns.g.dart';

@JsonSerializable()
class SteamColumns {
  final int duration;
  @JsonKey(name: "gold_spent")
  final int goldSpent;
  final int deaths;
  @JsonKey(name: "radiant_score")
  final int radiantScore;
  @JsonKey(name: "gold_per_min")
  final int goldPerMin;
  @JsonKey(name: "xp_per_min")
  final int xpPerMin;
  final int denies;
  @JsonKey(name: "tower_damage")
  final int towerDamage;
  @JsonKey(name: "leaver_status")
  final int leaverStatus;
  @JsonKey(name: "radiant_win")
  final int radiantWin;
  @JsonKey(name: "hero_healing")
  final int heroHealing;
  @JsonKey(name: "hero_damage")
  final int heroDamage;
  @JsonKey(name: "last_hits")
  final int lastHits;
  final int level;

  SteamColumns(
      {this.duration,
      this.radiantWin,
      this.goldSpent,
      this.radiantScore,
      this.leaverStatus,
      this.level,
      this.heroHealing,
      this.lastHits,
      this.towerDamage,
      this.heroDamage,
      this.denies,
      this.deaths,
      this.xpPerMin,
      this.goldPerMin});

  factory SteamColumns.fromMappedJson(Map<String, dynamic> json) =>
      _$SteamColumnsFromJson(json);

  Map<String, dynamic> toJson() => _$SteamColumnsToJson(this);
}
