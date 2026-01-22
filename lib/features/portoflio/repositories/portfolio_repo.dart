import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../core/network/internet_checker.dart';
import '../datasources/portfolio_remote_datasource.dart';

abstract interface class PortfolioRepo {
  Future<Either<Exception, int>> getCoffeeCount();
  Future<Either<Exception, Unit>> incrementCoffeeCount();
}

@LazySingleton(as: PortfolioRepo)
class PortfolioRepoImpl implements PortfolioRepo {
  final InternetChecker _internetChecker;
  final PortfolioRemoteDataSource _remoteDataSource;

  PortfolioRepoImpl(this._internetChecker, this._remoteDataSource);

  @override
  Future<Either<Exception, int>> getCoffeeCount() async {
    try {
      if (await _internetChecker.hasInternet) {
        final count = await _remoteDataSource.getCoffeeCount();
        return Right(count);
      } else {
        return Left(Exception('No internet connection'));
      }
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }

  @override
  Future<Either<Exception, Unit>> incrementCoffeeCount() async {
    try {
      if (await _internetChecker.hasInternet) {
        await _remoteDataSource.incrementCoffeeCount();
        return const Right(unit);
      } else {
        return Left(Exception('No internet connection'));
      }
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }
}
