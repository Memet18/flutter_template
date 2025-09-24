import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:talker_flutter/talker_flutter.dart';

@module
abstract class AppModule {
  @lazySingleton
  Talker get talker => TalkerFlutter.init();

  @injectable
  Dio get dio => Dio();
}
