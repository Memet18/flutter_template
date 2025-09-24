import 'package:flutter_template/app/app_env.dart';
import 'package:flutter_template/app/di/injector.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

@InjectableInit(generateForDir: ['lib', 'test'])
Future<void> configureDependencies({required String environment}) async =>
    getIt.init(environment: environment);

const prod = Environment(AppEnvironment.kEnvProd);
const dev = Environment(AppEnvironment.kEnvDev);
const stg = Environment(AppEnvironment.kEnvStg);
