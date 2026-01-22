import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../repositories/portfolio_repo.dart';

part 'name_state.dart';
part 'name_cubit.freezed.dart';

@LazySingleton()
class NameCubit extends Cubit<NameState> {
  final PortfolioRepo _portfolioRepo;

  NameCubit(this._portfolioRepo) : super(const NameState.initial());

  Future<void> changeName(String name) async {
    emit(const NameState.loading());

    final res = await _portfolioRepo.changeName(name);

    res.fold(
      (l) => emit(NameState.error(l.toString())),
      (r) => emit(const NameState.success()),
    );
  }
}
