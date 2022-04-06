import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:user_profile/core/domain/di/injectable.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() async => $initGetIt(getIt);
