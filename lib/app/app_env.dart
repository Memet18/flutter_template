const String _envKey = 'env';
const String _baseUrlKey = 'baseUrl';
const String _baseApi = 'https://api.example.com';

enum Env { dev, stg, prod, test }

class AppEnvironment {
  static const String kEnvProd = 'prod';
  static const String kEnvDev = 'dev';
  static const String kEnvStg = 'stg';
  static const String kEnvTest = 'test';

  static const String _environment = String.fromEnvironment(_envKey, defaultValue: kEnvProd);

  static const String baseUrl = String.fromEnvironment(_baseUrlKey, defaultValue: _baseApi);

  static bool get isProd => currentEnvironment == Env.prod;
  static bool get isDev => currentEnvironment == Env.dev;
  static bool get isStg => currentEnvironment == Env.stg;
  static bool get isTest => currentEnvironment == Env.test;

  static Env get currentEnvironment => switch (_environment) {
    kEnvProd => Env.prod,
    kEnvDev => Env.dev,
    kEnvStg => Env.stg,
    kEnvTest => Env.test,
    _ => Env.prod,
  };
}
