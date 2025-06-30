import 'package:flutter/material.dart';

import '../../../../../core/app_constants.dart';
import '../../../../../core/theme/ColorPalette.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../../models/position.dart';

class PositionCell extends StatelessWidget {
  final Position position;

  const PositionCell({super.key, required this.position});

  @override
  Widget build(BuildContext context) {
    final instrument = position.instrument;

    final pnlColor = position.pnl >= 0
        ? ColorPalette.pnlPlusColor
        : ColorPalette.pnlMinusColor;
    final pnlSign =
        position.pnl >= 0 ? AppConstants.pnlPlusSign : AppConstants.emptyString;

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade200, width: 1.0)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(instrument.ticker,
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87)),
              Row(
                children: [
                  Text("$pnlSign${position.pnl.toStringAsFixed(2)}",
                      style: TextStyle(
                          fontSize: 15,
                          color: pnlColor,
                          fontWeight: FontWeight.w600)),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("${instrument.name}${instrument.exchange}",
                  style: const TextStyle(fontSize: 12, color: Colors.black54)),
              const SizedBox(
                width: 4,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                    color: pnlColor.withValues(alpha: (0.1)),
                    borderRadius: BorderRadius.circular(12)),
                child: Text(
                    "$pnlSign${position.pnlPercentage.toStringAsFixed(2)}%",
                    style: TextStyle(
                        fontSize: 12,
                        color: pnlColor,
                        fontWeight: FontWeight.w600)),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                  "${AppLocalizations.of(context)!.qty} ${position.quantity} ${AppLocalizations.of(context)!.avg}. ${position.averagePrice.toStringAsFixed(2)}",
                  style: const TextStyle(fontSize: 12)),
              Text(
                  "${AppLocalizations.of(context)!.invested}: ${instrument.currency.toUpperCase()} ${position.cost.toStringAsFixed(2)}",
                  style: const TextStyle(fontSize: 12, color: Colors.black87)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                  "${AppLocalizations.of(context)!.ltp.toUpperCase()}: ${instrument.currency.toUpperCase()} ${instrument.lastTradedPrice.toStringAsFixed(2)}",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black87)),
              Text(
                  "${AppLocalizations.of(context)!.marketValue}: ${position.marketValue.toStringAsFixed(2)}",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.black87)),
            ],
          ),
        ],
      ),
    );
  }
}
