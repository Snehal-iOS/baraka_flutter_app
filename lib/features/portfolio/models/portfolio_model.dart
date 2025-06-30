import 'package:baraka_flutter_app/features/portfolio/models/balance.dart';
import 'package:baraka_flutter_app/features/portfolio/models/position.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'portfolio_model.g.dart';

@JsonSerializable()
class PortfolioModel extends Equatable {
  final Balance balance;
  final List<Position> positions;

  const PortfolioModel({
    required this.balance,
    required this.positions,
  });

  PortfolioModel copyWithUpdatedAt() {
    return PortfolioModel(
      balance: balance,
      positions: positions,
    );
  }

  factory PortfolioModel.fromJson(Map<String, dynamic> json) =>
      _$PortfolioModelFromJson(json);

  Map<String, dynamic> toJson() => _$PortfolioModelToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => [balance, positions];
}
