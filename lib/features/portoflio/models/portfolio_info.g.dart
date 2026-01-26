// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'portfolio_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PortfolioInfo _$PortfolioInfoFromJson(Map<String, dynamic> json) =>
    _PortfolioInfo(
      name: json['name'] as String,
      coffeeCounter: (json['coffeeCounter'] as num).toInt(),
      description: json['description'] as String,
    );

Map<String, dynamic> _$PortfolioInfoToJson(_PortfolioInfo instance) =>
    <String, dynamic>{
      'name': instance.name,
      'coffeeCounter': instance.coffeeCounter,
      'description': instance.description,
    };
