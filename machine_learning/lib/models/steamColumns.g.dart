// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'steamColumns.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SteamColumns _$SteamColumnsFromJson(Map<String, dynamic> json) {
  return SteamColumns(
    duration: json['duration'] as int,
    radiantWin: json['radiant_win'] as int,
    goldSpent: json['gold_spent'] as int,
    radiantScore: json['radiant_score'] as int,
    leaverStatus: json['leaver_status'] as int,
    level: json['level'] as int,
    heroHealing: json['hero_healing'] as int,
    lastHits: json['last_hits'] as int,
    towerDamage: json['tower_damage'] as int,
    heroDamage: json['hero_damage'] as int,
    denies: json['denies'] as int,
    deaths: json['deaths'] as int,
    xpPerMin: json['xp_per_min'] as int,
    goldPerMin: json['gold_per_min'] as int,
  );
}

Map<String, dynamic> _$SteamColumnsToJson(SteamColumns instance) =>
    <String, dynamic>{
      'duration': instance.duration,
      'gold_spent': instance.goldSpent,
      'deaths': instance.deaths,
      'radiant_score': instance.radiantScore,
      'gold_per_min': instance.goldPerMin,
      'xp_per_min': instance.xpPerMin,
      'denies': instance.denies,
      'tower_damage': instance.towerDamage,
      'leaver_status': instance.leaverStatus,
      'radiant_win': instance.radiantWin,
      'hero_healing': instance.heroHealing,
      'hero_damage': instance.heroDamage,
      'last_hits': instance.lastHits,
      'level': instance.level,
    };
