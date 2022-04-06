// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i5;

import '../../../features/auth/data/datasources/auth_api_service.dart' as _i6;
import '../../../features/auth/data/datasources/auth_local_datasource_impl.dart'
    as _i8;
import '../../../features/auth/data/repositories/auth_repository_impl.dart'
    as _i10;
import '../../../features/auth/domain/datasources/auth_local_datasource.dart'
    as _i7;
import '../../../features/auth/domain/datasources/auth_remote_datasource.dart'
    as _i11;
import '../../../features/auth/domain/repositories/auth_repository.dart' as _i9;
import '../../../features/auth/domain/usecases/login_use_case.dart' as _i12;
import '../../../features/auth/domain/usecases/logout_use_case.dart' as _i13;
import '../../../features/auth/domain/usecases/register_use_case.dart' as _i17;
import '../../../features/auth/presentation/bloc/auth_cubit.dart' as _i19;
import '../../../features/profile/data/datasources/profile_api_service.dart'
    as _i4;
import '../../../features/profile/data/repositories/profile_repository_impl.dart'
    as _i15;
import '../../../features/profile/domain/datasources/profile_remote_datasource.dart'
    as _i16;
import '../../../features/profile/domain/repositories/profile_repository.dart'
    as _i14;
import '../../../features/profile/domain/usecases/edit_profile_use_case.dart'
    as _i20;
import '../../../features/profile/domain/usecases/view_profile_use_case.dart'
    as _i18;
import '../../../features/profile/presentation/bloc/edit_profile_cubit/edit_profile_cubit.dart'
    as _i22;
import '../../../features/profile/presentation/bloc/view_profile_cubit/view_profile_cubit.dart'
    as _i21;
import 'app_module.dart' as _i23; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final appModule = _$AppModule();
  gh.factory<_i3.Dio>(() => appModule.getDio);
  gh.lazySingleton<_i4.ProfileApiService>(
      () => _i4.ProfileApiService(get<_i3.Dio>()));
  await gh.factoryAsync<_i5.SharedPreferences>(
      () => appModule.sharedPreferences,
      preResolve: true);
  gh.lazySingleton<_i6.AuthApiService>(
      () => _i6.AuthApiService(get<_i3.Dio>()));
  gh.factory<_i7.AuthLocalDataSource>(
      () => _i8.AuthLocalDataSourceImpl(get<_i5.SharedPreferences>()));
  gh.factory<_i9.AuthRepository>(() => _i10.AuthRepositoryImpl(
      get<_i11.AuthRemoteDataSource>(), get<_i7.AuthLocalDataSource>()));
  gh.factory<_i12.LoginUseCase>(
      () => _i12.LoginUseCase(get<_i9.AuthRepository>()));
  gh.factory<_i13.LogoutUseCase>(
      () => _i13.LogoutUseCase(get<_i9.AuthRepository>()));
  gh.factory<_i14.ProfileRepository>(() => _i15.ProfileRepositoryImpl(
      get<_i16.ProfileRemoteDataSource>(), get<_i7.AuthLocalDataSource>()));
  gh.factory<_i17.RegisterUseCase>(
      () => _i17.RegisterUseCase(get<_i9.AuthRepository>()));
  gh.factory<_i18.ViewProfileUseCase>(
      () => _i18.ViewProfileUseCase(get<_i14.ProfileRepository>()));
  gh.factory<_i19.AuthCubit>(() => _i19.AuthCubit(get<_i17.RegisterUseCase>(),
      get<_i12.LoginUseCase>(), get<_i13.LogoutUseCase>()));
  gh.factory<_i20.EditProfileUseCase>(
      () => _i20.EditProfileUseCase(get<_i14.ProfileRepository>()));
  gh.lazySingleton<_i21.ViewProfileCubit>(
      () => _i21.ViewProfileCubit(get<_i18.ViewProfileUseCase>()));
  gh.lazySingleton<_i22.EditProfileCubit>(
      () => _i22.EditProfileCubit(get<_i20.EditProfileUseCase>()));
  return get;
}

class _$AppModule extends _i23.AppModule {}
