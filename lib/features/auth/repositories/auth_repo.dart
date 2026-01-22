import 'package:coffee_inctrementer/features/auth/datasources/auth_remote_datasource.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../core/network/internet_checker.dart';
import '../datasources/auth_local_datasource.dart';

abstract interface class AuthRepo {
  Future<Either<Exception, Unit>> login({
    required String email,
    required String password,
  });
}

@LazySingleton(as: AuthRepo)
class AuthRepoImpl implements AuthRepo {
  final InternetChecker _internetChecker;
  final AuthRemoteDataSource _authRemoteDataSource;
  final AuthLocalDatasource _authLocalDatasource;

  AuthRepoImpl(
    this._internetChecker,
    this._authRemoteDataSource,
    this._authLocalDatasource,
  );

  @override
  Future<Either<Exception, Unit>> login({
    required String email,
    required String password,
  }) async {
    try {
      if (await _internetChecker.hasInternet) {
        await _authRemoteDataSource.login(email: email, password: password);
        await _authLocalDatasource.markUserAsLoggedIn();
        return Right(unit);
      } else {
        return Left(Exception('No internet connection'));
      }
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }
}
