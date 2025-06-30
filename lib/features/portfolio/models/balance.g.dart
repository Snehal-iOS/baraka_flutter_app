// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'balance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Balance _$BalanceFromJson(Map<String, dynamic> json) => Balance(
      netValue: (json['netValue'] as num).toDouble(),
      pnl: (json['pnl'] as num).toDouble(),
      pnlPercentage: (json['pnlPercentage'] as num).toDouble(),
    );

Map<String, dynamic> _$BalanceToJson(Balance instance) => <String, dynamic>{
      'netValue': instance.netValue,
      'pnl': instance.pnl,
      'pnlPercentage': instance.pnlPercentage,
    };
