import 'package:flutter_template/app/app_env.dart';
import 'package:flutter_template/app/app_main.dart';
import 'package:flutter_template/app/bootstrap.dart';

Future<void> main() async =>
    bootstrap(() => const App(), environment: AppEnvironment.currentEnvironment.name);
