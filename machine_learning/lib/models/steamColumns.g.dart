// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'steamColumns.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SteamColumns _$SteamColumnsFromJson(Map<String, dynamic> json) {
  return SteamColumns(
    goldPerMin: json['gold_per_min'] as int,
    level: json['level'] as int,
    leaverStatus: json['leaver_status'] as int,
    xpPerMin: json['xp_per_min'] as int,
    radiantScore: json['radiant_score'] as int,
    goldSpent: json['gold_spent'] as int,
    deaths: json['deaths'] as int,
    denies: json['denies'] as int,
    heroDamage: json['hero_damage'] as int,
    towerDamage: json['tower_damage'] as int,
    lastHits: json['last_hits'] as int,
    heroHealing: json['hero_healing'] as int,
    duration: json['duration'] as int,
  );
}

Map<String, dynamic> _$SteamColumnsToJson(SteamColumns instance) =>
    <String, dynamic>{
      'gold_per_min': instance.goldPerMin,
      'level': instance.level,
      'leaver_status': instance.leaverStatus,
      'xp_per_min': instance.xpPerMin,
      'radiant_score': instance.radiantScore,
      'gold_spent': instance.goldSpent,
      'deaths': instance.deaths,
      'denies': instance.denies,
      'hero_damage': instance.heroDamage,
      'tower_damage': instance.towerDamage,
      'last_hits': instance.lastHits,
      'hero_healing': instance.heroHealing,
      'duration': instance.duration,
    };
