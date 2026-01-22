import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@LazySingleton()
class InitialNavigationController with ChangeNotifier {
  bool _isLoggedIn = false;

  bool get isLoggedIn => _isLoggedIn;

  Future<void> checkIfUserIsLoggedIn() async {
    final sharedPref = await SharedPreferences.getInstance();
    _isLoggedIn = sharedPref.getBool('isLoggedIn') ?? false;

    notifyListeners();
  }
}
