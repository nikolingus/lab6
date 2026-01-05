import 'package:flutter/material.dart';
import '../utils/context_ext.dart';

class CurrencyDetailPage extends StatefulWidget {
  const CurrencyDetailPage({super.key, required this.arguments});

  final Map<String, dynamic> arguments;

  @override
  State<CurrencyDetailPage> createState() => _CurrencyDetailPageState();
}

class _CurrencyDetailPageState extends State<CurrencyDetailPage> {
  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final fonts = context.fonts;
    
    final String currencyId = widget.arguments['currencyId'] ?? '';
    final String currencyName = widget.arguments['currencyName'] ?? '';
    final String currencySymbol = widget.arguments['currencySymbol'] ?? '';
    final double currencyValue = (widget.arguments['currencyValue'] as num?)?.toDouble() ?? 0.0;
    final double currencyPreviousValue = (widget.arguments['currencyPreviousValue'] as num?)?.toDouble() ?? 0.0;
    final int currencyNominal = (widget.arguments['currencyNominal'] as int?) ?? 1;

    final change = currencyValue - currencyPreviousValue;
    final changePercent = currencyPreviousValue != 0
        ? (change / currencyPreviousValue) * 100
        : 0;

    final valuePerUnit = currencyValue / currencyNominal;
    final unitsText = _getNominalWord(currencyNominal, context);

    return Scaffold(
      appBar: AppBar(
        title: Text(currencyName),
        surfaceTintColor: Colors.transparent,
        backgroundColor: colors.surface,
        foregroundColor: colors.text,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            Padding(
              padding: const EdgeInsets.all(16.0), 
              child: Card(
                color: colors.card,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        currencySymbol,
                        style: fonts.headlineMedium.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        currencyName,
                        style: fonts.bodyLarge.copyWith(
                          color: colors.textSecondary,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        '${valuePerUnit.toStringAsFixed(4)} ${context.loc.rubleSymbol}',
                        style: fonts.headlineLarge.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        
                        context.loc.forNominal(
                          currencyNominal.toString(),
                          unitsText,
                        ),
                        style: fonts.bodyMedium.copyWith(
                          color: colors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                    color: colors.card,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            context.loc.rateChange,
                            style: fonts.titleLarge.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(context.loc.currentRate),
                              Text(
                                '${currencyValue.toStringAsFixed(4)} ${context.loc.rubleSymbol}',
                                style: fonts.bodyLarge.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(context.loc.previousRate),
                              Text(
                                '${currencyPreviousValue.toStringAsFixed(4)} ${context.loc.rubleSymbol}',
                                style: fonts.bodyMedium.copyWith(
                                  color: colors.textSecondary,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(context.loc.change),
                              Text(
                                '${change >= 0 ? '+' : ''}${change.toStringAsFixed(4)} ${context.loc.rubleSymbol}',
                                style: TextStyle(
                                  color: change > 0
                                      ? colors.success
                                      : change < 0
                                          ? colors.error
                                          : colors.textSecondary,
                                  fontWeight: FontWeight.bold,
                                  fontSize: fonts.bodyLarge.fontSize,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(context.loc.changePercent),
                              Text(
                                '${changePercent >= 0 ? '+' : ''}${changePercent.toStringAsFixed(2)}%',
                                style: TextStyle(
                                  color: changePercent > 0
                                      ? colors.success
                                      : changePercent < 0
                                          ? colors.error
                                          : colors.textSecondary,
                                  fontWeight: FontWeight.bold,
                                  fontSize: fonts.bodyLarge.fontSize,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Card(
                    color: colors.card,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            context.loc.information,
                            style: fonts.titleLarge.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(context.loc.currencyCode),
                              Text(
                                currencyId,
                                style: fonts.bodyLarge.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(context.loc.symbol),
                              Text(
                                currencySymbol,
                                style: fonts.bodyLarge.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(context.loc.nominal),
                              Text(
                                context.loc.nominalCount(currencyNominal.toString()),
                                style: fonts.bodyLarge.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16), 
          ],
        ),
      ),
    );
  }

  String _getNominalWord(int nominal, BuildContext context) {
    if (nominal % 10 == 1 && nominal % 100 != 11) {
      return context.loc.unit;
    } else if (nominal % 10 >= 2 &&
        nominal % 10 <= 4 &&
        (nominal % 100 < 10 || nominal % 100 >= 20)) {
      return context.loc.unitsFew;
    } else {
      return context.loc.unitsMany;
    }
  }
}