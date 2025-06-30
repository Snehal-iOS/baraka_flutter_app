// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'position.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Position _$PositionFromJson(Map<String, dynamic> json) => Position(
      instrument:
          Instrument.fromJson(json['instrument'] as Map<String, dynamic>),
      quantity: (json['quantity'] as num).toDouble(),
      averagePrice: (json['averagePrice'] as num).toDouble(),
      cost: (json['cost'] as num).toDouble(),
      marketValue: (json['marketValue'] as num).toDouble(),
      pnl: (json['pnl'] as num).toDouble(),
      pnlPercentage: (json['pnlPercentage'] as num).toDouble(),
    );

Map<String, dynamic> _$PositionToJson(Position instance) => <String, dynamic>{
      'instrument': instance.instrument,
      'quantity': instance.quantity,
      'averagePrice': instance.averagePrice,
      'cost': instance.cost,
      'marketValue': instance.marketValue,
      'pnl': instance.pnl,
      'pnlPercentage': instance.pnlPercentage,
    };
