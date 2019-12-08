import 'package:json_annotation/json_annotation.dart';

part 'kaggleColumns.g.dart';

@JsonSerializable()
class KaggleColumns {
  final int kills;
  final int gold;
  final int deaths;
  @JsonKey(name: "gold_per_min")
  final int goldPerMin;
  @JsonKey(name: "xp_per_min")
  final int xpPerMin;
  final int assists;
  final int denies;
  @JsonKey(name: "tower_damage")
  final int towerDamage;
  @JsonKey(name: "hero_healing")
  final int heroHealing;
  @JsonKey(name: "hero_damage")
  final int heroDamage;
  @JsonKey(name: "last_hits")
  final int lastHits;
  final int level;

  KaggleColumns(
      {this.goldPerMin,
        this.level,
        this.xpPerMin,
        this.deaths,
        this.denies,
        this.heroDamage,
        this.towerDamage,
        this.lastHits,
        this.heroHealing,
        this.assists,
        this.kills,
        this.gold
       });

  factory KaggleColumns.fromMappedJson(Map<String, dynamic> json) =>
      _$KaggleColumnsFromJson(json);

  Map<String, dynamic> toJson() => _$KaggleColumnsToJson(this);
}
