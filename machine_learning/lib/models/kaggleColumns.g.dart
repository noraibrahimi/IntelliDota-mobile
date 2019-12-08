// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kaggleColumns.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KaggleColumns _$KaggleColumnsFromJson(Map<String, dynamic> json) {
  return KaggleColumns(
    goldPerMin: json['gold_per_min'] as int,
    level: json['level'] as int,
    xpPerMin: json['xp_per_min'] as int,
    deaths: json['deaths'] as int,
    denies: json['denies'] as int,
    heroDamage: json['hero_damage'] as int,
    towerDamage: json['tower_damage'] as int,
    lastHits: json['last_hits'] as int,
    heroHealing: json['hero_healing'] as int,
    assists: json['assists'] as int,
    kills: json['kills'] as int,
    gold: json['gold'] as int,
  );
}

Map<String, dynamic> _$KaggleColumnsToJson(KaggleColumns instance) =>
    <String, dynamic>{
      'kills': instance.kills,
      'gold': instance.gold,
      'deaths': instance.deaths,
      'gold_per_min': instance.goldPerMin,
      'xp_per_min': instance.xpPerMin,
      'assists': instance.assists,
      'denies': instance.denies,
      'tower_damage': instance.towerDamage,
      'hero_healing': instance.heroHealing,
      'hero_damage': instance.heroDamage,
      'last_hits': instance.lastHits,
      'level': instance.level,
    };
