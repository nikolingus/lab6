import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './utils/context_ext.dart';
import '../../domain/repositories/settings_repository.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final fonts = context.fonts;

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.currency_exchange,
                size: 80,
                color: colors.primary,
              ),
              const SizedBox(height: 32),
              Text(
                context.loc.cbrRates,
                style: fonts.headlineMedium.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                context.loc.actualRates,
                style: fonts.bodyMedium.copyWith(
                  color: colors.textSecondary,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 48),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    
                    final token = 'fake_token_${DateTime.now().millisecondsSinceEpoch}';
                    final settingsRepo = Provider.of<SettingsRepository>(context, listen: false);
                    await settingsRepo.setToken(token);
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: colors.primary,
                    foregroundColor: Colors.white,
                  ),
                  child: Text(context.loc.loginToApp),
                ),
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: () {
                  
                  final settingsRepo = Provider.of<SettingsRepository>(context, listen: false);
                  settingsRepo.setToken(null);
                },
                child: Text(
                  context.loc.continueWithoutLogin,
                  style: fonts.bodyMedium.copyWith(
                    color: colors.textSecondary,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}