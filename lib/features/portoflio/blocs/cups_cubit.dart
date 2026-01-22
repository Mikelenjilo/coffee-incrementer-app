import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../repositories/portfolio_repo.dart';

part 'cups_state.dart';
part 'cups_cubit.freezed.dart';

@injectable
class CupsCubit extends Cubit<CupsState> {
  final PortfolioRepo _portfolioRepo;

  CupsCubit(this._portfolioRepo) : super(const CupsState.initial());

  int _count = 0;
  int get count => _count;

  Future<void> getCount() async {
    emit(const CupsState.loading());

    final res = await _portfolioRepo.getCoffeeCount();

    res.fold(
      (l) {
        emit(CupsState.error(l.toString()));
      },
      (r) {
        _count = r;
        emit(const CupsState.loaded());
      },
    );
  }

  Future<void> increment() async {
    emit(const CupsState.incrementing());

    final res = await _portfolioRepo.incrementCoffeeCount();

    res.fold(
      (l) {
        emit(CupsState.error(l.toString()));
      },
      (r) {
        _count++;
        emit(const CupsState.incremented());
      },
    );
  }
}
