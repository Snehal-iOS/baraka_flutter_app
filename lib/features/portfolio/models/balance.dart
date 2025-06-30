import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'balance.g.dart';

@JsonSerializable()
class Balance extends Equatable {
  final double netValue;
  final double pnl;
  final double pnlPercentage;

  const Balance(
      {required this.netValue, required this.pnl, required this.pnlPercentage});

  factory Balance.fromJson(Map<String, dynamic> json) =>
      _$BalanceFromJson(json);
  Map<String, dynamic> toJson() => _$BalanceToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => [netValue, pnl, pnlPercentage];
}
