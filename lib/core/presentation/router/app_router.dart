import 'package:final_project/core/domain/di/injectable.dart';
import 'package:final_project/features/auth/presentation/bloc/auth_cubit.dart';
import 'package:final_project/features/auth/presentation/screens/login_screen.dart';
import 'package:final_project/features/auth/presentation/screens/register_screen.dart';
import 'package:final_project/features/profile/presentation/bloc/edit_profile_cubit/edit_profile_cubit.dart';
import 'package:final_project/features/profile/presentation/bloc/view_profile_cubit/view_profile_cubit.dart';
import 'package:final_project/features/profile/presentation/screens/edit_profile_screen.dart';
import 'package:final_project/features/profile/presentation/screens/view_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

mixin AppRouter {
  static Route<MaterialPageRoute>? onGenerateRoute(
    RouteSettings routeSettings,
  ) {
    switch (routeSettings.name) {
      case LoginScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<AuthCubit>(),
            child: LoginScreen(),
          ),
        );
      case RegisterScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<AuthCubit>(),
            child: RegisterScreen(),
          ),
        );
      case ViewProfileScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => getIt<AuthCubit>(),
              ),
              BlocProvider(
                create: (context) => getIt<ViewProfileCubit>(),
              )
            ],
            child: const ViewProfileScreen(),
          ),
        );
      case EditProfileScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<EditProfileCubit>(),
            child: const EditProfileScreen(),
          ),
          settings: routeSettings,
        );
      default:
        return null;
    }
  }
}
