import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'instrument.dart';

part 'position.g.dart';

@JsonSerializable()
class Position extends Equatable {
  final Instrument instrument;
  final double quantity;
  final double averagePrice;
  final double cost;
  final double marketValue;
  final double pnl;
  final double pnlPercentage;

  const Position({
    required this.instrument,
    required this.quantity,
    required this.averagePrice,
    required this.cost,
    required this.marketValue,
    required this.pnl,
    required this.pnlPercentage,
  });

  factory Position.fromJson(Map<String, dynamic> json) =>
      _$PositionFromJson(json);
  Map<String, dynamic> toJson() => _$PositionToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => [
        instrument,
        quantity,
        averagePrice,
        cost,
        marketValue,
        pnl,
        pnlPercentage,
      ];
}
