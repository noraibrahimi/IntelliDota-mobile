// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kaggleColumns.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KaggleColumns _$KaggleColumnsFromJson(Map<String, dynamic> json) {
  return KaggleColumns(
    gold: json['gold'] as double,
    goldPerMin: json['gold_per_min'] as double,
    xpPerMin: json['xp_per_min'] as double,
    kills: json['kills'] as double,
    deaths: json['deaths'] as double,
    assists: json['assists'] as double,
    denies: json['denies'] as double,
    lastHits: json['last_hits'] as double,
    heroDamage: json['hero_damage'] as double,
    heroHealing: json['hero_healing'] as double,
    towerDamage: json['tower_damage'] as double,
    level: json['level'] as double,
  );
}

Map<String, dynamic> _$KaggleColumnsToJson(KaggleColumns instance) =>
    <String, dynamic>{
      'gold': instance.gold,
      'gold_per_min': instance.goldPerMin,
      'xp_per_min': instance.xpPerMin,
      'kills': instance.kills,
      'deaths': instance.deaths,
      'assists': instance.assists,
      'denies': instance.denies,
      'last_hits': instance.lastHits,
      'hero_damage': instance.heroDamage,
      'hero_healing': instance.heroHealing,
      'tower_damage': instance.towerDamage,
      'level': instance.level,
    };
