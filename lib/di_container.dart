import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<AppConfig>(AppConfig(title: 'Практическая работа 9'));
}

class AppConfig {
  final String title;

  AppConfig({required this.title});
}