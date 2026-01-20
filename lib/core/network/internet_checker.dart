import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract interface class InternetChecker {
  Future<bool> get hasInternet;
}

@LazySingleton(as: InternetChecker)
class InternetCheckerImpl implements InternetChecker {
  final InternetConnectionChecker _internetConnectionChecker;
  InternetCheckerImpl(this._internetConnectionChecker);

  @override
  Future<bool> get hasInternet => _internetConnectionChecker.hasConnection;
}
