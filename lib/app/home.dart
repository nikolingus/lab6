import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './routes.dart';
import './bottom_nav_visibility.dart';
import './home_state.dart';
import './currency_list/currency_list_page.dart';
import './news_list/news_list_page.dart';
import './portfolio_page.dart';    
import './analytics_page.dart';    
import './profile_page.dart';
import './utils/context_ext.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _HomePageContent();
  }
}

class _HomePageContent extends StatelessWidget {
  const _HomePageContent();

  final List<Widget> _pages = const [
    CurrencyListPage(),
    NewsListPage(),
    PortfolioPage(),   
    AnalyticsPage(),    
  ];

  @override
  Widget build(BuildContext context) {
    final homeState = context.watch<HomeState>();
    final navVisibility = context.watch<BottomNavVisibility>();
    final colors = context.colors;
    final fonts = context.fonts;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.loc.exchangeRates,
          style: fonts.titleMedium.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: colors.surface,
        foregroundColor: colors.text,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.person, color: colors.text),
            onPressed: () {
              Navigator.pushNamed(
                context,
                AppRoutes.profile,
                arguments: ProfileArguments(
                  userName: 'Иван Иванов',
                  userId: 123,
                  email: 'ivan@example.com',
                ),
              ).then((result) {
                if (result != null && result is ProfileArguments) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(context.loc.profileUpdated(result.userName)),
                      duration: const Duration(seconds: 2),
                    ),
                  );
                }
              });
            },
          ),
        ],
      ),
      body: _pages[homeState.currentIndex],
      bottomNavigationBar: navVisibility.isVisible
          ? Container(
              decoration: BoxDecoration(
                color: colors.surface,
                boxShadow: [
                  BoxShadow(
                    color: colors.shadow,
                    blurRadius: 8,
                    offset: const Offset(0, -2),
                  ),
                ],
              ),
              child: BottomNavigationBar(
                currentIndex: homeState.currentIndex,
                onTap: (index) => homeState.changeTab(index),
                backgroundColor: colors.surface,
                selectedItemColor: colors.primary,
                unselectedItemColor: colors.textSecondary,
                selectedLabelStyle: fonts.labelMedium,
                unselectedLabelStyle: fonts.labelMedium,
                items: [
                  BottomNavigationBarItem(
                    icon: const Icon(Icons.currency_exchange),
                    label: context.loc.currenciesTab,
                  ),
                  BottomNavigationBarItem(
                    icon: const Icon(Icons.article),
                    label: context.loc.newsTab,
                  ),
                  BottomNavigationBarItem(
                    icon: const Icon(Icons.account_balance_wallet),
                    label: context.loc.portfolioTab,
                  ),
                  BottomNavigationBarItem(
                    icon: const Icon(Icons.analytics),
                    label: context.loc.analyticsTab,
                  ),
                ],
              ),
            )
          : null,
    );
  }
}