import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:intl/intl.dart';

import '../../../domain/models/currency_model.dart';
import '../../../domain/repositories/currency_repository.dart';
import '../../../domain/repositories/settings_repository.dart';
import '../../app/utils/context_ext.dart';

// Импорты из той же папки widgets
import './widgets/currency_card.dart';
import './widgets/search_view.dart';

class CurrencyListPage extends StatefulWidget {
  const CurrencyListPage({super.key});

  @override
  State<CurrencyListPage> createState() => _CurrencyListPageState();
}

class _CurrencyListPageState extends State<CurrencyListPage> {
  late ValueNotifier<List<CurrencyModel>> _filteredCurrencies;
  
  List<CurrencyModel> _allCurrencies = [];
  bool _isLoading = true;
  String? _error;
  bool _hasInternet = true;
  bool _isRefreshing = false;
  bool _useLocalDataSource = false;

  @override
  void initState() {
    super.initState();
    _filteredCurrencies = ValueNotifier<List<CurrencyModel>>([]);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initData();
    });
  }

  @override
  void dispose() {
    _filteredCurrencies.dispose();
    super.dispose();
  }

  Future<void> _initData() async {
    final settingsRepo = Provider.of<SettingsRepository>(context, listen: false);
    _useLocalDataSource = settingsRepo.useLocalDataSource;
    
    await _loadCurrencies();
  }

  Future<void> _loadCurrencies() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      setState(() {
        _hasInternet = false;
        _error = context.loc.noInternet;
        _isLoading = false;
        _isRefreshing = false;
      });
      return;
    }

    setState(() {
      _hasInternet = true;
      _error = null;
      if (!_isRefreshing) {
        _isLoading = true;
      }
    });

    try {
      final repository = Provider.of<CurrencyRepository>(context, listen: false);
      final currencies = await repository.getCurrencies();
      
      try {
        await repository.saveCurrencyList(currencies);
      } catch (e) {
        print(context.loc.dbSaveError(e.toString()));
      }
      
      setState(() {
        _allCurrencies = currencies;
        _filteredCurrencies.value = currencies;
      });
    } on Exception catch (e) {
      setState(() {
        _error = e.toString();
      });
    } finally {
      setState(() {
        _isLoading = false;
        _isRefreshing = false;
      });
    }
  }

  Future<void> _refreshData() async {
    setState(() {
      _isRefreshing = true;
    });
    await _loadCurrencies();
  }

  void _filterCurrencies(String query) {
    final String lowerQuery = query.toLowerCase();
    final Iterable<CurrencyModel> result = _allCurrencies.where((CurrencyModel currency) {
      return currency.name.toLowerCase().contains(lowerQuery) || 
             currency.symbol.toLowerCase().contains(lowerQuery);
    });

    _filteredCurrencies.value = result.toList(growable: false);
  }

  Widget _buildErrorWidget() {
    final colors = context.colors;
    final fonts = context.fonts;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            _hasInternet ? Icons.error_outline : Icons.wifi_off,
            size: 64,
            color: _hasInternet ? colors.warning : colors.textSecondary,
          ),
          const SizedBox(height: 16),
          Text(
            _error ?? context.loc.errorOccurred,
            style: fonts.titleMedium.copyWith(
              color: colors.text,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          if (!_hasInternet)
            Text(
              context.loc.usingSavedData,
              style: fonts.bodyMedium.copyWith(
                color: colors.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: _loadCurrencies,
            style: ElevatedButton.styleFrom(
              backgroundColor: colors.primary,
              foregroundColor: colors.surface,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
            ),
            child: Text(context.loc.retry),
          ),
        ],
      ),
    );
  }

  Widget _buildLoadingWidget() {
    final colors = context.colors;
    final fonts = context.fonts;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            color: colors.primary,
          ),
          const SizedBox(height: 16),
          Text(
            _useLocalDataSource ? 
              context.loc.loadingFromLocal : 
              context.loc.loadingExchangeRates,
            style: fonts.bodyMedium.copyWith(
              color: colors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCurrencyList() {
    final colors = context.colors;
    final fonts = context.fonts;

    return RefreshIndicator(
      onRefresh: _refreshData,
      color: colors.primary,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 22),
            child: SearchView(
              onChanged: _filterCurrencies,
              hintText: context.loc.searchByNameOrCode,
            ),
          ),
          if (_useLocalDataSource)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 8),
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: colors.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: colors.primary.withOpacity(0.3),
                  ),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.storage,
                      color: colors.primary,
                      size: 16,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      context.loc.usingLocalData,
                      style: TextStyle(
                        fontSize: 12,
                        color: colors.primary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          Expanded(
            child: ValueListenableBuilder<List<CurrencyModel>>(
              valueListenable: _filteredCurrencies,
              builder: (BuildContext context, List<CurrencyModel> data, _) {
                if (data.isEmpty && _allCurrencies.isNotEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.search_off,
                          size: 64,
                          color: colors.textSecondary,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          context.loc.nothingFound,
                          style: fonts.bodyLarge.copyWith(
                            color: colors.textSecondary,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          context.loc.tryDifferentQuery,
                          style: fonts.bodyMedium.copyWith(
                            color: colors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  );
                }
                
                return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (BuildContext context, int index) {
                    final CurrencyModel currency = data[index];
                    return Padding(
                      key: ValueKey(currency.id),
                      padding: EdgeInsets.fromLTRB(
                        22,
                        index == 0 ? 0 : 10,
                        22,
                        index == data.length - 1 ? 40 : 0,
                      ),
                      child: CurrencyCard(
                        model: currency,
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            '/currencyDetail',
                            arguments: {
                              'currencyId': currency.id,
                              'currencyName': currency.name,
                              'currencySymbol': currency.symbol,
                              'currencyValue': currency.value,
                              'currencyPreviousValue': currency.previousValue,
                              'currencyNominal': currency.nominal,
                            },
                          );
                        },
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final fonts = context.fonts;

    return Scaffold(
      appBar: AppBar(
        title: Text(context.loc.cbrRates),
        backgroundColor: colors.surface,
        foregroundColor: colors.text,
        surfaceTintColor: Colors.transparent,
        actions: [
          if (_isRefreshing)
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: colors.primary,
                ),
              ),
            )
          else
            IconButton(
              icon: Icon(Icons.refresh, color: colors.text),
              onPressed: _refreshData,
              tooltip: context.loc.refreshData,
            ),
        ],
      ),
      body: _isLoading && !_isRefreshing
          ? _buildLoadingWidget()
          : _error != null && _allCurrencies.isEmpty
              ? _buildErrorWidget()
              : _buildCurrencyList(),
    );
  }
}