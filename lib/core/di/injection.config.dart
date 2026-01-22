// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i974;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i973;

import '../../features/stats/blocs/cups_cubit.dart' as _i632;
import '../../features/stats/datasources/portfolio_remote.dart' as _i56;
import '../../features/stats/repositories/portfolio_repo.dart' as _i759;
import '../network/internet_checker.dart' as _i175;
import 'app_module.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final appModule = _$AppModule();
    gh.lazySingleton<_i973.InternetConnectionChecker>(
      () => appModule.internetConnectionChecker,
    );
    gh.lazySingleton<_i974.FirebaseFirestore>(() => appModule.firestore);
    gh.lazySingleton<_i175.InternetChecker>(
      () => _i175.InternetCheckerImpl(gh<_i973.InternetConnectionChecker>()),
    );
    gh.lazySingleton<_i56.PortfolioRemoteDataSource>(
      () => _i56.PortfolioRemoteDataSourceFirebaseImpl(
        gh<_i974.FirebaseFirestore>(),
      ),
    );
    gh.lazySingleton<_i759.PortfolioRepo>(
      () => _i759.PortfolioRepoImpl(
        gh<_i175.InternetChecker>(),
        gh<_i56.PortfolioRemoteDataSource>(),
      ),
    );
    gh.factory<_i632.CupsCubit>(
      () => _i632.CupsCubit(gh<_i759.PortfolioRepo>()),
    );
    return this;
  }
}

class _$AppModule extends _i460.AppModule {}
