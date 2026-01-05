import 'package:flutter/material.dart';
import '../../utils/context_ext.dart';

class CurrencyInfoCard extends StatelessWidget {
  final String date;
  final String price;
  final bool isUp;

  const CurrencyInfoCard({
    super.key,
    required this.date,
    required this.price,
    required this.isUp,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final fonts = context.fonts;

    return Container(
      padding: const EdgeInsets.fromLTRB(18, 24, 8, 24),
      decoration: BoxDecoration(
        color: colors.card,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: colors.shadow,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: Text(
                date,
                style: fonts.labelLarge.copyWith(
                  fontWeight: FontWeight.w700,
                  color: colors.text,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 6),
            child: Text(
              price,
              style: fonts.labelLarge.copyWith(
                fontWeight: FontWeight.w700,
                color: isUp ? colors.success : colors.error,
              ),
            ),
          ),
          Icon(
            isUp ? Icons.arrow_upward : Icons.arrow_downward,
            size: 16,
            color: isUp ? colors.success : colors.error,
          ),
        ],
      ),
    );
  }
}