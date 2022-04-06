// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i7;

import '../../../features/auth/data/datasources/auth_api_service.dart' as _i8;
import '../../../features/auth/data/datasources/auth_local_datasource_impl.dart'
    as _i10;
import '../../../features/auth/data/datasources/auth_remote_datasource_impl.dart'
    as _i12;
import '../../../features/auth/data/repositories/auth_repository_impl.dart'
    as _i14;
import '../../../features/auth/domain/datasources/auth_local_datasource.dart'
    as _i9;
import '../../../features/auth/domain/datasources/auth_remote_datasource.dart'
    as _i11;
import '../../../features/auth/domain/repositories/auth_repository.dart'
    as _i13;
import '../../../features/auth/domain/usecases/login_use_case.dart' as _i15;
import '../../../features/auth/domain/usecases/logout_use_case.dart' as _i16;
import '../../../features/auth/domain/usecases/register_use_case.dart' as _i19;
import '../../../features/auth/presentation/bloc/auth_cubit.dart' as _i21;
import '../../../features/profile/data/datasources/profile_api_service.dart'
    as _i4;
import '../../../features/profile/data/datasources/profile_remote_datasource_impl.dart'
    as _i6;
import '../../../features/profile/data/repositories/profile_repository_impl.dart'
    as _i18;
import '../../../features/profile/domain/datasources/profile_remote_datasource.dart'
    as _i5;
import '../../../features/profile/domain/repositories/profile_repository.dart'
    as _i17;
import '../../../features/profile/domain/usecases/edit_profile_use_case.dart'
    as _i22;
import '../../../features/profile/domain/usecases/view_profile_use_case.dart'
    as _i20;
import '../../../features/profile/presentation/bloc/edit_profile_cubit/edit_profile_cubit.dart'
    as _i24;
import '../../../features/profile/presentation/bloc/view_profile_cubit/view_profile_cubit.dart'
    as _i23;
import 'app_module.dart' as _i25; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final appModule = _$AppModule();
  gh.factory<_i3.Dio>(() => appModule.getDio);
  gh.lazySingleton<_i4.ProfileApiService>(
      () => _i4.ProfileApiService(get<_i3.Dio>()));
  gh.lazySingleton<_i5.ProfileRemoteDataSource>(
      () => _i6.ProfileRemoteDataSourceImpl(get<_i4.ProfileApiService>()));
  await gh.factoryAsync<_i7.SharedPreferences>(
      () => appModule.sharedPreferences,
      preResolve: true);
  gh.lazySingleton<_i8.AuthApiService>(
      () => _i8.AuthApiService(get<_i3.Dio>()));
  gh.factory<_i9.AuthLocalDataSource>(
      () => _i10.AuthLocalDataSourceImpl(get<_i7.SharedPreferences>()));
  gh.lazySingleton<_i11.AuthRemoteDataSource>(
      () => _i12.AuthRemoteDataSourceImpl(get<_i8.AuthApiService>()));
  gh.factory<_i13.AuthRepository>(() => _i14.AuthRepositoryImpl(
      get<_i11.AuthRemoteDataSource>(), get<_i9.AuthLocalDataSource>()));
  gh.factory<_i15.LoginUseCase>(
      () => _i15.LoginUseCase(get<_i13.AuthRepository>()));
  gh.factory<_i16.LogoutUseCase>(
      () => _i16.LogoutUseCase(get<_i13.AuthRepository>()));
  gh.factory<_i17.ProfileRepository>(() => _i18.ProfileRepositoryImpl(
      get<_i5.ProfileRemoteDataSource>(), get<_i9.AuthLocalDataSource>()));
  gh.factory<_i19.RegisterUseCase>(
      () => _i19.RegisterUseCase(get<_i13.AuthRepository>()));
  gh.factory<_i20.ViewProfileUseCase>(
      () => _i20.ViewProfileUseCase(get<_i17.ProfileRepository>()));
  gh.factory<_i21.AuthCubit>(() => _i21.AuthCubit(get<_i19.RegisterUseCase>(),
      get<_i15.LoginUseCase>(), get<_i16.LogoutUseCase>()));
  gh.factory<_i22.EditProfileUseCase>(
      () => _i22.EditProfileUseCase(get<_i17.ProfileRepository>()));
  gh.factory<_i23.ViewProfileCubit>(
      () => _i23.ViewProfileCubit(get<_i20.ViewProfileUseCase>()));
  gh.lazySingleton<_i24.EditProfileCubit>(
      () => _i24.EditProfileCubit(get<_i22.EditProfileUseCase>()));
  return get;
}

class _$AppModule extends _i25.AppModule {}
