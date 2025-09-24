import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_template/app/l10n/l10n.dart';
import 'package:flutter_template/app/router/app_router.dart';
import 'package:flutter_template/core/presentation/mixin/failure_message_handler.dart';
import 'package:flutter_template/core/presentation/theme/app_theme.dart';

class App extends StatelessWidget with FailureMessageHandler {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: MaterialApp.router(
        theme: lightTheme,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
        routerConfig: appRouter,
        builder: (context, widget) =>
            widget ?? const SizedBox.expand(child: Center(child: CircularProgressIndicator())),
      ),
    );
  }
}
