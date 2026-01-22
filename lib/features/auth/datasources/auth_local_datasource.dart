import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract interface class AuthLocalDatasource {
  Future<void> markUserAsLoggedIn();
}

@LazySingleton(as: AuthLocalDatasource)
class AuthLocalDatasourceSharedPrefImpl implements AuthLocalDatasource {
  AuthLocalDatasourceSharedPrefImpl();

  @override
  Future<void> markUserAsLoggedIn() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setBool('isLoggedIn', true);
  }
}
