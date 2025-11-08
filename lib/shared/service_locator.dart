import 'package:get_it/get_it.dart';
import '../features/polls/state/history_service.dart';

final GetIt getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerLazySingleton<HistoryService>(() => HistoryService());
}