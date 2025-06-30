import 'package:baraka_flutter_app/features/portfolio/domain/portfolio_repository.dart';
import 'package:baraka_flutter_app/features/portfolio/models/balance.dart';
import 'package:baraka_flutter_app/features/portfolio/models/instrument.dart';
import 'package:baraka_flutter_app/features/portfolio/models/portfolio_model.dart';
import 'package:baraka_flutter_app/features/portfolio/models/position.dart';
import 'package:baraka_flutter_app/features/portfolio/presentation/bloc/portfolio_bloc.dart';
import 'package:baraka_flutter_app/features/portfolio/presentation/bloc/portfolio_state.dart';
import 'package:baraka_flutter_app/features/portfolio/presentation/pages/portfolio_screen.dart';
import 'package:baraka_flutter_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';

class FakePortfolioRepository implements PortfolioRepository {
  @override
  Future<PortfolioModel> getPortfolio() async {
    return const PortfolioModel(
      balance: Balance(
        netValue: 1234.56,
        pnl: 78.9,
        pnlPercentage: 6.3,
      ),
      positions: [
        Position(
          instrument: Instrument(
            ticker: 'AAPL',
            name: 'Apple Inc.',
            exchange: 'NASDAQ',
            currency: 'USD',
            lastTradedPrice: 145.3,
          ),
          quantity: 10,
          averagePrice: 120.0,
          cost: 1200.0,
          marketValue: 1453.0,
          pnl: 253.0,
          pnlPercentage: 21.1,
        ),
      ],
    );
  }
}

void main() {
  testWidgets('PortfolioScreen UI renders from loaded state',
      (WidgetTester tester) async {
    final fakeRepository = FakePortfolioRepository();
    final fakePortfolio = await fakeRepository.getPortfolio();

    final testBloc = PortfolioBloc(fakeRepository);
    testBloc.emit(PortfolioLoaded(fakePortfolio));

    await tester.pumpWidget(
      MaterialApp(
        locale: const Locale('en'),
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [Locale('en'), Locale('ar')],
        home: BlocProvider.value(
          value: testBloc,
          child: PortfolioScreen(onToggleLanguage: () {}),
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.text('John Doe'), findsOneWidget);
    expect(find.text('AAPL'), findsOneWidget);
    expect(find.text('Net Value'), findsOneWidget);
    // expect(find.textContaining('PnL'), findsWidgets);
    expect(find.textContaining('Your Holdings'), findsOneWidget);
    expect(find.textContaining('Qty'), findsWidgets);
    expect(
        find.textContaining(fakePortfolio.positions[0].cost.toStringAsFixed(2)),
        findsWidgets);
    expect(
        find.textContaining(
            fakePortfolio.positions[0].pnlPercentage.toStringAsFixed(2)),
        findsWidgets);
    // expect(find.textContaining('Market value:'), findsOneWidget);
  });
}
