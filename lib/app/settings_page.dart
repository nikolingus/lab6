import 'package:flutter/material.dart';
import 'package:dart_lab1/app/utils/context_ext.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.loc.settings),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.palette),
            title: Text(context.loc.theme),
            subtitle: Text(context.loc.themeSelection),
            onTap: () {
              _showThemeDialog(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.language),
            title: Text(context.loc.language),
            subtitle: Text(context.loc.languageSelection),
            onTap: () {
              Navigator.pushNamed(
                context,
                '/language',
              ).then((value) {
                if (value != null) {
                  _showSnackBar(context, context.loc.languageSelected(value));
                }
              });
            },
          ),
          ListTile(
            leading: const Icon(Icons.notifications),
            title: Text(context.loc.notifications),
            subtitle: Text(context.loc.notificationsSettings),
            onTap: () {
              Navigator.pushNamed(
                context,
                '/notifications',
              ).then((value) {
                if (value != null) {
                  _showSnackBar(context, context.loc.notificationsSaved);
                }
              });
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.info),
            title: Text(context.loc.aboutApp),
            onTap: () {
              _showAboutDialog(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: Text(context.loc.logout),
            onTap: () {
              Navigator.pop(context, context.loc.userLoggedOut);
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context, context.loc.settingsSaved);
        },
        child: const Icon(Icons.save),
      ),
    );
  }

  void _showThemeDialog(BuildContext context) async {
    final result = await showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(context.loc.theme),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: Text(context.loc.light),
              onTap: () => Navigator.pop(context, context.loc.light),
            ),
            ListTile(
              title: Text(context.loc.dark),
              onTap: () => Navigator.pop(context, context.loc.dark),
            ),
            ListTile(
              title: Text(context.loc.system),
              onTap: () => Navigator.pop(context, context.loc.system),
            ),
          ],
        ),
      ),
    );
    
    if (result != null) {
      _showSnackBar(context, context.loc.themeSelected(result));
    }
  }

  void _showAboutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(context.loc.aboutApp),
        content: Text(context.loc.aboutAppVersion),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(context.loc.close),
          ),
        ],
      ),
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}