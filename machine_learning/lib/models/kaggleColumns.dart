import 'package:json_annotation/json_annotation.dart';

part 'kaggleColumns.g.dart';

@JsonSerializable()
class KaggleColumns {
  final int gold;
  @JsonKey(name: "gold_per_min")
  final int goldPerMin;
  @JsonKey(name: "xp_per_min")
  final int xpPerMin;
  final int kills;
  final int deaths;
  final int assists;
  final int denies;
  @JsonKey(name: "last_hits")
  final int lastHits;
  @JsonKey(name: "hero_damage")
  final int heroDamage;
  @JsonKey(name: "hero_healing")
  final int heroHealing;
  @JsonKey(name: "tower_damage")
  final int towerDamage;
  final int level;

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
