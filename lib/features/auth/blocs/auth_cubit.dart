import 'package:bloc/bloc.dart';
import 'package:coffee_inctrementer/features/auth/repositories/auth_repo.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'auth_state.dart';
part 'auth_cubit.freezed.dart';

@LazySingleton()
class AuthCubit extends Cubit<AuthState> {
  final AuthRepo _authRepo;

  AuthCubit(this._authRepo) : super(const AuthState.initial());

  Future<void> login({required String email, required String password}) async {
    emit(const AuthState.loading());

    final res = await _authRepo.login(email: email, password: password);

    res.fold(
      (l) => emit(AuthState.error(l.toString())),
      (r) => emit(const AuthState.success()),
    );
  }
}
