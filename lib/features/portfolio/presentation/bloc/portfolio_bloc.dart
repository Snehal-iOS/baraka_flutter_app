import 'dart:async';
import 'dart:math';

import 'package:baraka_flutter_app/features/portfolio/presentation/bloc/portfolio_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/portfolio_repository.dart';
import '../../models/balance.dart';
import '../../models/portfolio_model.dart';
import '../../models/position.dart';

part 'portfolio_event.dart';

@injectable
class PortfolioBloc extends Bloc<PortfolioEvent, PortfolioState> {
  final PortfolioRepository repository;
  Timer? _priceUpdateTimer;

  PortfolioBloc(this.repository) : super(PortfolioInitial()) {
    on<LoadPortfolio>(_onLoadPortfolio);
    on<UpdatePortfolioPrices>(_onUpdatePortfolioPrices);
  }

  Future<void> _onLoadPortfolio(
    LoadPortfolio event,
    Emitter<PortfolioState> emit,
  ) async {
    emit(PortfolioLoading());
    try {
      final portfolio = await repository.getPortfolio();
      emit(PortfolioLoaded(portfolio));
      _startPriceSimulation(portfolio);
    } catch (e) {
      emit(PortfolioError('Failed to load portfolio: ${e.toString()}'));
    }
  }

  void _startPriceSimulation(PortfolioModel initialPortfolio) {
    // Cancel any existing timer first
    _priceUpdateTimer?.cancel();

    _priceUpdateTimer = Timer.periodic(const Duration(seconds: 1), (_) {
      // Instead of directly emitting in the timer, add an event to the bloc
      add(UpdatePortfolioPrices(initialPortfolio));
    });
  }

  Future<void> _onUpdatePortfolioPrices(
    UpdatePortfolioPrices event,
    Emitter<PortfolioState> emit,
  ) async {
    final currentState = state;
    if (currentState is PortfolioLoaded) {
      final currentPortfolio = currentState.portfolio;

      final updatedPortfolio = simulatePortfolioUpdate(currentPortfolio);
      emit(PortfolioLoaded(updatedPortfolio));
    }
  }

  PortfolioModel simulatePortfolioUpdate(PortfolioModel currentPortfolio) {
    final updatedPositions = currentPortfolio.positions.map((position) {
      final basePrice = position.instrument.lastTradedPrice;
      final newPrice = basePrice * _randomFactor();

      final marketValue = newPrice * position.quantity;
      final pnl = marketValue - position.cost;
      final pnlPercentage =
          position.cost != 0 ? (pnl * 100) / position.cost : 0;

      return Position(
        instrument: position.instrument.copyWith(lastTradedPrice: newPrice),
        quantity: position.quantity,
        averagePrice: position.averagePrice,
        cost: position.cost,
        marketValue: marketValue,
        pnl: pnl,
        pnlPercentage: pnlPercentage.toDouble(),
      );
    }).toList();

    final newNetValue =
        updatedPositions.fold<double>(0.0, (sum, p) => sum + p.marketValue);
    final newPnl = updatedPositions.fold<double>(0.0, (sum, p) => sum + p.pnl);
    final newCost =
        updatedPositions.fold<double>(0.0, (sum, p) => sum + p.cost);
    final newPnlPercentage = newCost != 0 ? (newPnl * 100) / newCost : 0;

    return PortfolioModel(
      balance: Balance(
        netValue: newNetValue,
        pnl: newPnl,
        pnlPercentage: newPnlPercentage.toDouble(),
      ),
      positions: updatedPositions,
    );
  }

  double _randomFactor() {
    // final now = DateTime.now().millisecondsSinceEpoch;
    // return (now % 1000) / 1000; // 0.0 to 1.0

    double randomFactor;
    final random = Random();
    randomFactor = 0.9 + random.nextDouble() * 0.2; // Range: 0.9 to 1.1
    return randomFactor;
  }

  @override
  Future<void> close() {
    _priceUpdateTimer?.cancel();
    return super.close();
  }
}
