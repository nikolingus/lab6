import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './utils/context_ext.dart';
import './profile/theme_mode_selector_bs.dart';
import '../../domain/models/app_theme_mode.dart';
import '../../domain/repositories/settings_repository.dart';
import '../../domain/datasources/db_datasource.dart';
import '../../domain/repositories/currency_repository.dart';
import '../../domain/repositories/news_repository.dart';

class ProfileArguments {
  final String userName;
  final int userId;
  final String email;
  
  ProfileArguments({
    required this.userName,
    required this.userId,
    required this.email,
  });
}

class ProfilePage extends StatefulWidget {
  final ProfileArguments? initialData;
  
  const ProfilePage({super.key, this.initialData});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late int _userId;
  bool _initialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_initialized) {
      _userId = widget.initialData?.userId ?? 0;
      _nameController = TextEditingController(
        text: widget.initialData?.userName ?? 'Гость' // Временно жестко
      );
      _emailController = TextEditingController(
        text: widget.initialData?.email ?? 'email@example.com'
      );
      _initialized = true;
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final fonts = context.fonts;

    return Scaffold(
      appBar: AppBar(
        title: Text(context.loc.profile),
        backgroundColor: colors.surface,
        foregroundColor: colors.text,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context, ProfileArguments(
                userName: _nameController.text,
                userId: _userId,
                email: _emailController.text,
              ));
            },
            icon: Icon(Icons.save, color: colors.primary),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Секция информации о пользователе
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: colors.primary.withOpacity(0.1),
                      child: Icon(
                        Icons.person,
                        size: 40,
                        color: colors.primary,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextField(
                            controller: _nameController,
                            style: fonts.titleMedium.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                            decoration: InputDecoration(
                              labelText: context.loc.name,
                              labelStyle: fonts.bodyMedium.copyWith(
                                color: colors.textSecondary,
                              ),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.zero,
                            ),
                          ),
                          const SizedBox(height: 4),
                          TextField(
                            controller: _emailController,
                            style: fonts.bodyMedium.copyWith(
                              color: colors.textSecondary,
                            ),
                            decoration: InputDecoration(
                              labelText: context.loc.email,
                              labelStyle: fonts.bodySmall.copyWith(
                                color: colors.textSecondary,
                              ),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.zero,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            '${context.loc.id}: $_userId',
                            style: fonts.bodySmall.copyWith(
                              color: colors.textSecondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Секция темы
            _buildThemeSection(context),

            const SizedBox(height: 24),

            // Секция данных
            _buildDataSection(context),

            const SizedBox(height: 24),

            // Кнопки действий
            _buildActionButtons(context),
          ],
        ),
      ),
    );
  }

  Widget _buildThemeSection(BuildContext context) {
    final settingsRepo = context.watch<SettingsRepository>();
    final colors = context.colors;
    final fonts = context.fonts;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              context.loc.appearance,
              style: fonts.titleMedium.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 12),
            ListTile(
              leading: Icon(
                Icons.color_lens,
                color: colors.primary,
              ),
              title: Text(
                context.loc.theme,
                style: fonts.bodyLarge,
              ),
              subtitle: Text(
                _getThemeModeLabel(settingsRepo.currentThemeMode, context),
                style: fonts.bodySmall.copyWith(
                  color: colors.textSecondary,
                ),
              ),
              trailing: Icon(
                Icons.chevron_right,
                color: colors.textSecondary,
              ),
              onTap: () {
                _showThemeSelector(context, settingsRepo);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDataSection(BuildContext context) {
    final settingsRepo = context.watch<SettingsRepository>();
    final colors = context.colors;
    final fonts = context.fonts;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              context.loc.data,
              style: fonts.titleMedium.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 12),
            SwitchListTile(
              title: Text(
                context.loc.useLocalData,
                style: fonts.bodyLarge,
              ),
              subtitle: Text(
                context.loc.loadFromCache,
                style: fonts.bodySmall.copyWith(
                  color: colors.textSecondary,
                ),
              ),
              value: settingsRepo.useLocalDataSource,
              activeColor: colors.primary,
              onChanged: (value) {
                settingsRepo.setUseLocalDataSource(value);
              },
            ),
            const SizedBox(height: 8),
            ListTile(
              leading: Icon(
                Icons.delete,
                color: colors.error,
              ),
              title: Text(
                context.loc.clearCache,
                style: fonts.bodyLarge,
              ),
              subtitle: Text(
                context.loc.deleteAllData,
                style: fonts.bodySmall.copyWith(
                  color: colors.textSecondary,
                ),
              ),
              onTap: () {
                _clearCache(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    final settingsRepo = context.read<SettingsRepository>();
    final colors = context.colors;

    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              _logout(context, settingsRepo);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: colors.error,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
            child: Text(context.loc.logout),
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () async {
                  final result = await showDialog<String>(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text(context.loc.dialog),
                      content: Text(context.loc.exampleDialog),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context, context.loc.cancel),
                          child: Text(context.loc.cancel),
                        ),
                        TextButton(
                          onPressed: () => Navigator.pop(context, context.loc.ok),
                          child: Text(context.loc.ok),
                        ),
                      ],
                    ),
                  );
                  if (result != null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(context.loc.result(result))),
                    );
                  }
                },
                child: Text(context.loc.dialog),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: ElevatedButton(
                onPressed: () async {
                  final result = await showModalBottomSheet<String>(
                    context: context,
                    builder: (context) => Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(
                          leading: const Icon(Icons.edit),
                          title: Text(context.loc.edit),
                          onTap: () => Navigator.pop(context, context.loc.edit),
                        ),
                        ListTile(
                          leading: const Icon(Icons.delete),
                          title: Text(context.loc.delete),
                          onTap: () => Navigator.pop(context, context.loc.delete),
                        ),
                      ],
                    ),
                  );
                  if (result != null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(context.loc.selected(result))),
                    );
                  }
                },
                child: const Text('BottomSheet'),
              ),
            ),
          ],
        ),
      ],
    );
  }

  void _showThemeSelector(BuildContext context, SettingsRepository settingsRepo) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return ThemeModeSelectorBS(
          currentThemeMode: settingsRepo.currentThemeMode,
          onThemeModeChanged: (mode) {
            settingsRepo.setThemeMode(mode);
          },
        );
      },
    );
  }

  void _clearCache(BuildContext context) {
    final dbDatasource = context.read<DbDatasource>();
    final currencyRepo = context.read<CurrencyRepository>();
    final newsRepo = context.read<NewsRepository>();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(context.loc.clearCacheQuestion),
          content: Text(context.loc.cacheWillBeDeleted),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(context.loc.cancel),
            ),
            TextButton(
              onPressed: () async {
                Navigator.pop(context);
                try {
                  await dbDatasource.clearCurrencies();
                  await dbDatasource.clearNews();
                  
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(context.loc.cacheCleared),
                      duration: const Duration(seconds: 2),
                    ),
                  );
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(context.loc.cacheError(e.toString())),
                      duration: const Duration(seconds: 2),
                    ),
                  );
                }
              },
              child: Text(context.loc.clear),
            ),
          ],
        );
      },
    );
  }

  void _logout(BuildContext context, SettingsRepository settingsRepo) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(context.loc.logout),
          content: Text(context.loc.confirmLogout),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(context.loc.cancel),
            ),
            TextButton(
              onPressed: () async {
                Navigator.pop(context);
                await settingsRepo.clearToken();
              },
              child: Text(context.loc.logout),
            ),
          ],
        );
      },
    );
  }

  String _getThemeModeLabel(AppThemeMode mode, BuildContext context) {
    switch (mode) {
      case AppThemeMode.light:
        return context.loc.light;
      case AppThemeMode.dark:
        return context.loc.dark;
      case AppThemeMode.system:
        return context.loc.system;
    }
  }
}