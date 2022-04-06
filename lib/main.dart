import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_profile/core/domain/di/injectable.dart';
import 'package:user_profile/core/presentation/bloc/bloc_observer.dart';
import 'package:user_profile/core/presentation/router/app_router.dart';
import 'package:user_profile/core/presentation/theme/my_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  BlocOverrides.runZoned(
    () => runApp(const MyApp()),
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: myTheme,
      onGenerateRoute: onGenerateRoute,
    );
  }
}
