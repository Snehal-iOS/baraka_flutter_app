import 'package:baraka_flutter_app/features/portfolio/presentation/pages/widgets/balance_header.dart';
import 'package:baraka_flutter_app/features/portfolio/presentation/pages/widgets/position_cell.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../l10n/app_localizations.dart';
import '../bloc/portfolio_bloc.dart';
import '../bloc/portfolio_state.dart';

class PortfolioScreen extends StatefulWidget {
  final VoidCallback onToggleLanguage;
  const PortfolioScreen({super.key, required this.onToggleLanguage});

  @override
  State<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<PortfolioBloc, PortfolioState>(
          builder: (context, state) {
            if (state is PortfolioLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is PortfolioError) {
              return Center(child: Text(state.message));
            } else if (state is PortfolioLoaded) {
              final portfolio = state.portfolio;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BalanceHeader(
                    balance: portfolio.balance,
                    onToggleLanguage: widget.onToggleLanguage,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 14.0, top: 16, right: 18),
                    child: Text(
                      "${AppLocalizations.of(context)!.yourHoldings}:",
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54),
                    ),
                  ),
                  Expanded(
                    child: ListView.separated(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12),
                      itemCount: portfolio.positions.length,
                      itemBuilder: (context, index) {
                        return PositionCell(
                            position: portfolio.positions[index]);
                      },
                      separatorBuilder: (_, __) => const SizedBox(height: 12),
                    ),
                  ),
                ],
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
