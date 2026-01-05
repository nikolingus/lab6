import 'package:flutter/material.dart';
import 'context_ext.dart';

class SearchView extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final String hintText;

  const SearchView({
    super.key,
    required this.onChanged,
    this.hintText = 'Поиск...',
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final fonts = context.fonts;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: fonts.bodyMedium.copyWith(
            color: colors.textSecondary,
          ),
          prefixIcon: Icon(
            Icons.search,
            color: colors.textSecondary,
          ),
          filled: true,
          fillColor: colors.surface,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
        ),
        style: fonts.bodyMedium.copyWith(
          color: colors.text,
        ),
      ),
    );
  }
}