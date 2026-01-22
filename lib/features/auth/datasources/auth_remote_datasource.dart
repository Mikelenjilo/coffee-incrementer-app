import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

abstract interface class AuthRemoteDataSource {
  Future<void> login({required String email, required String password});
}

@LazySingleton(as: AuthRemoteDataSource)
class AuthRemoteDatasourceFirebaseImpl implements AuthRemoteDataSource {
  final FirebaseAuth _auth;

  AuthRemoteDatasourceFirebaseImpl(this._auth);

  @override
  Future<void> login({required String email, required String password}) async {
    await _auth.signInWithEmailAndPassword(email: email, password: password);
  }
}
