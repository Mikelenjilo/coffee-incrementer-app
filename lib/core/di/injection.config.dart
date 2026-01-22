// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i974;
import 'package:firebase_auth/firebase_auth.dart' as _i59;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i973;

import '../../features/auth/blocs/auth_cubit.dart' as _i974;
import '../../features/auth/datasources/auth_local_datasource.dart' as _i556;
import '../../features/auth/datasources/auth_remote_datasource.dart' as _i573;
import '../../features/auth/repositories/auth_repo.dart' as _i22;
import '../../features/portoflio/blocs/cups/cups_cubit.dart' as _i246;
import '../../features/portoflio/blocs/name/name_cubit.dart' as _i50;
import '../../features/portoflio/datasources/portfolio_remote_datasource.dart'
    as _i116;
import '../../features/portoflio/repositories/portfolio_repo.dart' as _i663;
import '../controllers/initial_navigation_controller.dart' as _i103;
import '../network/internet_checker.dart' as _i175;
import 'register_module.dart' as _i291;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    gh.lazySingleton<_i103.InitialNavigationController>(
      () => _i103.InitialNavigationController(),
    );
    gh.lazySingleton<_i973.InternetConnectionChecker>(
      () => registerModule.internetConnectionChecker,
    );
    gh.lazySingleton<_i974.FirebaseFirestore>(() => registerModule.firestore);
    gh.lazySingleton<_i59.FirebaseAuth>(() => registerModule.auth);
    gh.lazySingleton<_i556.AuthLocalDatasource>(
      () => _i556.AuthLocalDatasourceSharedPrefImpl(),
    );
    gh.lazySingleton<_i175.InternetChecker>(
      () => _i175.InternetCheckerImpl(gh<_i973.InternetConnectionChecker>()),
    );
    gh.lazySingleton<_i116.PortfolioRemoteDataSource>(
      () => _i116.PortfolioRemoteDataSourceFirebaseImpl(
        gh<_i974.FirebaseFirestore>(),
      ),
    );
    gh.lazySingleton<_i573.AuthRemoteDataSource>(
      () => _i573.AuthRemoteDatasourceFirebaseImpl(gh<_i59.FirebaseAuth>()),
    );
    gh.lazySingleton<_i22.AuthRepo>(
      () => _i22.AuthRepoImpl(
        gh<_i175.InternetChecker>(),
        gh<_i573.AuthRemoteDataSource>(),
        gh<_i556.AuthLocalDatasource>(),
      ),
    );
    gh.lazySingleton<_i974.AuthCubit>(
      () => _i974.AuthCubit(gh<_i22.AuthRepo>()),
    );
    gh.lazySingleton<_i663.PortfolioRepo>(
      () => _i663.PortfolioRepoImpl(
        gh<_i175.InternetChecker>(),
        gh<_i116.PortfolioRemoteDataSource>(),
      ),
    );
    gh.factory<_i246.CupsCubit>(
      () => _i246.CupsCubit(gh<_i663.PortfolioRepo>()),
    );
    gh.lazySingleton<_i50.NameCubit>(
      () => _i50.NameCubit(gh<_i663.PortfolioRepo>()),
    );
    return this;
  }
}

class _$RegisterModule extends _i291.RegisterModule {}
