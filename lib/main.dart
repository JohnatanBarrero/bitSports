import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'config/module.dart';
import 'config/start_preferences.dart';
import 'generated/l10n.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = StrarPreferences();
  await prefs.initPrefs();

  runApp(
    ModularApp(
      module: AppModule(),
      child: const NavigationApp(),
    ),
  );
}

class NavigationApp extends StatelessWidget {
  const NavigationApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    @override
    final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
    Intl.defaultLocale = 'es';

    return MaterialApp(
      title: 'StarW App',
      initialRoute: Modular.initialRoute,
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
    ).modular();
  }
}