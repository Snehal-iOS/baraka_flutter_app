import 'package:equatable/equatable.dart';

import '../../models/portfolio_model.dart';

abstract class PortfolioState extends Equatable {
  @override
  List<Object?> get props => [];
}

class PortfolioInitial extends PortfolioState {}

class PortfolioLoading extends PortfolioState {}

class PortfolioLoaded extends PortfolioState {
  final PortfolioModel portfolio;

  PortfolioLoaded(this.portfolio);
  @override
  List<Object?> get props => [portfolio];
}

class PortfolioError extends PortfolioState {
  final String message;

  PortfolioError(this.message);

  @override
  List<Object?> get props => [message];
}
