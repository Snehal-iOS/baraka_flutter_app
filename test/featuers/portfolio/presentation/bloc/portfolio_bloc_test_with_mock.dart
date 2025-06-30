import 'package:baraka_flutter_app/features/portfolio/domain/portfolio_repository.dart';
import 'package:baraka_flutter_app/features/portfolio/models/balance.dart';
import 'package:baraka_flutter_app/features/portfolio/models/instrument.dart';
import 'package:baraka_flutter_app/features/portfolio/models/portfolio_model.dart';
import 'package:baraka_flutter_app/features/portfolio/models/position.dart';
import 'package:baraka_flutter_app/features/portfolio/presentation/bloc/portfolio_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockPortfolioRepository extends Mock implements PortfolioRepository {}

void main() {
  group('PortfolioBloc Simulation Logic', () {
    late PortfolioBloc bloc;
    late MockPortfolioRepository mockRepository;

    setUp(() {
      mockRepository = MockPortfolioRepository();
      bloc = PortfolioBloc(mockRepository);
    });

    test('simulatePortfolioUpdate updates prices within expected range', () {
      const instrument = Instrument(
        ticker: 'AAPL',
        name: 'Apple Inc.',
        exchange: 'NASDAQ',
        currency: 'USD',
        lastTradedPrice: 100.0,
      );

      const position = Position(
        instrument: instrument,
        quantity: 10,
        averagePrice: 100.0,
        cost: 1000.0,
        marketValue: 1000.0,
        pnl: 0.0,
        pnlPercentage: 0.0,
      );

      const portfolio = PortfolioModel(
        balance: const Balance(
          netValue: 1000.0,
          pnl: 0.0,
          pnlPercentage: 0.0,
        ),
        positions: [position],
      );

      final updated = bloc.simulatePortfolioUpdate(portfolio);

      expect(updated.positions.length, 1);

      final newPrice = updated.positions.first.instrument.lastTradedPrice;
      expect(newPrice, inInclusiveRange(90.0, 110.0));

      final newMarketValue = updated.positions.first.marketValue;
      expect(newMarketValue, closeTo(newPrice * 10, 0.001));
    });
  });
}
