import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_template/app/di/injector.dart';
import 'package:talker_bloc_logger/talker_bloc_logger.dart';
import 'package:talker_flutter/talker_flutter.dart';

Future<void> bootstrap(FutureOr<Widget> Function() builder, {required String environment}) async {
  return runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await configureDependencies(environment: environment);
      final talker = getIt.get<Talker>();

      PlatformDispatcher.instance.onError = (error, stack) {
        talker.log(error.toString(), stackTrace: stack);
        return true;
      };
      FlutterError.onError = (details) {
        talker.log(details.exceptionAsString(), stackTrace: details.stack);
      };
      Bloc.observer = TalkerBlocObserver(
        talker: talker,
        settings: const TalkerBlocLoggerSettings(printCreations: true, printClosings: true),
      );

      await SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]).then((_) async {
        runApp(await builder());
      });
    },
    (error, stackTrace) {
      getIt.get<Talker>().log(error.toString(), stackTrace: stackTrace);
    },
  );
}
