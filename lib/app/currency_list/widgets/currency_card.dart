import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../domain/models/currency_model.dart';
import '../../utils/context_ext.dart';

class CurrencyCard extends StatelessWidget {
  const CurrencyCard({
    super.key,
    required this.model,
    this.onTap,
  });

  final CurrencyModel model;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final valuePerUnit = model.value / model.nominal;
    final previousValuePerUnit = model.previousValue / model.nominal;
    final change = valuePerUnit - previousValuePerUnit;
    final changePercent = model.previousValue != 0 
        ? ((model.value - model.previousValue) / model.previousValue) * 100 
        : 0;
    
    final currencyFormatter = NumberFormat.currency(
      symbol: context.loc.rubleSymbol,
      decimalDigits: 4,
      locale: Localizations.localeOf(context).toString(),
    );

    final colors = context.colors;
    final fonts = context.fonts;

    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: colors.card,
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: colors.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    model.symbol,
                    style: TextStyle(
                      color: colors.primary,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      model.name,
                      style: fonts.titleMedium.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      context.loc.nominalCount(model.nominal.toString()),
                      style: fonts.bodySmall.copyWith(
                        color: colors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    currencyFormatter.format(valuePerUnit),
                    style: fonts.titleMedium.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Text(
                        change >= 0 
                            ? '+${currencyFormatter.format(change)}'
                            : '${currencyFormatter.format(change)}',
                        style: fonts.bodySmall.copyWith(
                          color: change > 0
                              ? colors.success
                              : change < 0
                                  ? colors.error
                                  : colors.textSecondary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Icon(
                        change > 0 
                            ? Icons.arrow_upward 
                            : change < 0 
                                ? Icons.arrow_downward 
                                : Icons.remove,
                        size: 14,
                        color: change > 0
                            ? colors.success
                            : change < 0
                                ? colors.error
                                : colors.textSecondary,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}