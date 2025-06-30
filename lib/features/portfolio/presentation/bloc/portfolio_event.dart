part of 'portfolio_bloc.dart';

abstract class PortfolioEvent {}

class LoadPortfolio extends PortfolioEvent {}

class SimulateLivePrices extends PortfolioEvent {}

class UpdatePortfolioPrices extends PortfolioEvent {
  final PortfolioModel portfolio;

  UpdatePortfolioPrices(this.portfolio);
}
