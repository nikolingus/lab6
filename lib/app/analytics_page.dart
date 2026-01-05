import 'package:flutter/material.dart';
import './utils/context_ext.dart';

class AnalyticsPage extends StatelessWidget {
  const AnalyticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final fonts = context.fonts;

    return Scaffold(
      appBar: AppBar(
        title: Text(context.loc.analyticsTab),
        backgroundColor: colors.surface,
        foregroundColor: colors.text,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        context.loc.analyticsReports,
                        style: fonts.titleLarge.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        context.loc.analyticsDescription,
                        style: fonts.bodyMedium.copyWith(
                          color: colors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              
              Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: _buildAnalyticsCard(
                          context,
                          title: context.loc.analyticsTrends,
                          icon: Icons.trending_up,
                          color: colors.primary,
                          description: context.loc.analyticsTrendsDescription,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _buildAnalyticsCard(
                          context,
                          title: context.loc.analyticsForecasts,
                          icon: Icons.analytics,
                          color: colors.success,
                          description: context.loc.analyticsForecastsDescription,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: _buildAnalyticsCard(
                          context,
                          title: context.loc.analyticsReports,
                          icon: Icons.bar_chart,
                          color: colors.warning,
                          description: context.loc.analyticsReportsDescription,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _buildAnalyticsCard(
                          context,
                          title: context.loc.analyticsComparison,
                          icon: Icons.compare_arrows,
                          color: colors.error,
                          description: context.loc.analyticsComparisonDescription,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: colors.card,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: colors.divider,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      context.loc.analyticsWeeklyStats,
                      style: fonts.titleMedium.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 12),
                    _buildStatItem(
                      context,
                      label: context.loc.analyticsTopGainer,
                      value: context.loc.analyticsTopGainerValue,
                      color: colors.success,
                    ),
                    _buildStatItem(
                      context,
                      label: context.loc.analyticsTopLoser,
                      value: context.loc.analyticsTopLoserValue,
                      color: colors.error,
                    ),
                    _buildStatItem(
                      context,
                      label: context.loc.analyticsVolatility,
                      value: context.loc.analyticsVolatilityValue,
                      color: colors.warning,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, context.loc.analyticsSaveMessage);
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: Text(context.loc.analyticsSaveButton),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAnalyticsCard(
    BuildContext context, {
    required String title,
    required IconData icon,
    required Color color,
    required String description,
  }) {
    final colors = context.colors;
    final fonts = context.fonts;

    return SizedBox(
      height: 150, 
      child: Card(
        color: colors.card,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon,
                  color: color,
                  size: 20,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                title,
                style: fonts.titleSmall.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 4),
              Expanded(
                child: Text(
                  description,
                  style: fonts.bodySmall.copyWith(
                    color: colors.textSecondary,
                    fontSize: 12,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatItem(
    BuildContext context, {
    required String label,
    required String value,
    required Color color,
  }) {
    final fonts = context.fonts;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              label,
              style: fonts.bodyMedium,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(width: 10),
          Text(
            value,
            style: fonts.bodyMedium.copyWith(
              color: color,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}