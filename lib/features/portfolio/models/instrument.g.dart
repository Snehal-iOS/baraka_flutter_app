// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'instrument.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Instrument _$InstrumentFromJson(Map<String, dynamic> json) => Instrument(
      ticker: json['ticker'] as String,
      name: json['name'] as String,
      exchange: json['exchange'] as String,
      currency: json['currency'] as String,
      lastTradedPrice: (json['lastTradedPrice'] as num).toDouble(),
    );

Map<String, dynamic> _$InstrumentToJson(Instrument instance) =>
    <String, dynamic>{
      'ticker': instance.ticker,
      'name': instance.name,
      'exchange': instance.exchange,
      'currency': instance.currency,
      'lastTradedPrice': instance.lastTradedPrice,
    };
