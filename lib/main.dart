import 'package:baraka_flutter_app/core/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/di/injector.dart';
import 'features/portfolio/presentation/bloc/portfolio_bloc.dart';
import 'features/portfolio/presentation/pages/portfolio_screen.dart';
import 'l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const BarakaApp());
}

class BarakaApp extends StatefulWidget {
  const BarakaApp({super.key});

  @override
  State<BarakaApp> createState() => _BarakaAppState();
}

class _BarakaAppState extends State<BarakaApp> {
  Locale _locale = const Locale('en');

  void _toggleLanguage() {
    setState(() {
      _locale = _locale.languageCode == 'en'
          ? const Locale('ar')
          : const Locale('en');
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: AppConstants.barakaPortFolio,
        locale: _locale,
        supportedLocales: const [
          Locale('en'), // English
          Locale('ar'), // Arabic
        ],
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        theme: ThemeData(
          useMaterial3: true,
          colorSchemeSeed: Colors.teal,
          brightness: Brightness.light,
        ),
        darkTheme: ThemeData(
          useMaterial3: true,
          colorSchemeSeed: Colors.teal,
          brightness: Brightness.dark,
        ),
        home: BlocProvider(
            create: (_) => getIt<PortfolioBloc>()..add(LoadPortfolio()),
            child: PortfolioScreen(onToggleLanguage: _toggleLanguage),
        ),
    );
  }
}
