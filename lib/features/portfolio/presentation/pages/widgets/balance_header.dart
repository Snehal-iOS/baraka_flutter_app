import 'package:baraka_flutter_app/core/app_constants.dart';
import 'package:baraka_flutter_app/core/theme/ColorPalette.dart';
import 'package:flutter/material.dart';

import '../../../../../l10n/app_localizations.dart';
import '../../../models/balance.dart';

class BalanceHeader extends StatelessWidget {
  final Balance balance;
  final VoidCallback onToggleLanguage;

  const BalanceHeader({
    super.key,
    required this.balance,
    required this.onToggleLanguage,
  });

  @override
  Widget build(BuildContext context) {
    final pnlColor = balance.pnl >= 0
        ? ColorPalette.pnlPlusColor
        : ColorPalette.pnlMinusColor;
    final pnlSign =
        balance.pnl >= 0 ? AppConstants.pnlPlusSign : AppConstants.emptyString;

    return GestureDetector(
      onDoubleTap: () {
        // Handle double tap if needed
        // context.read<PortfolioBloc>().close();
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        color: const Color(0xFFE6F7FB),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const CircleAvatar(
                    radius: 20,
                    backgroundColor: ColorPalette.whiteColor,
                    child: Icon(Icons.person,
                        size: 24, color: ColorPalette.userColor)),
                const SizedBox(width: 10),
                const Text("John Doe",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                const Spacer(),
                TextButton(
                  onPressed: onToggleLanguage,
                  child: Text(AppLocalizations.of(context)!.selectedLocale,
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Text(
                  balance.netValue.toStringAsFixed(2),
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Row(
                  children: [
                    Text(
                      balance.pnl.toStringAsFixed(2),
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: pnlColor),
                    ),
                    const SizedBox(width: 4),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: pnlColor.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Text(
                        "$pnlSign${balance.pnlPercentage.toStringAsFixed(2)}%",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: pnlColor),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Text(AppLocalizations.of(context)!.netValue,
                    style: const TextStyle(fontSize: 12)),
                const Spacer(),
                Text(
                    "${AppLocalizations.of(context)!.pnl}${AppLocalizations.of(context)!.pnl} %)",
                    style: const TextStyle(fontSize: 12)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
