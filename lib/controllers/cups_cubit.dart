import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

part 'cups_state.dart';
part 'cups_cubit.freezed.dart';

class CupsCubit extends Cubit<CupsState> {
  CupsCubit() : super(const CupsState.initial());

  int _count = 0;
  int get count => _count;

  Future<void> getCount() async {
    try {
      emit(const CupsState.loading());

      final bool isConnected =
          await InternetConnectionChecker.instance.hasConnection;

      if (isConnected) {
        final collection = FirebaseFirestore.instance.collection('stats');
        final doc = await collection.doc('coffee').get();
        _count = doc.data()!['count'];

        emit(const CupsState.incremented());
      } else {
        emit(const CupsState.noInternet());
      }
    } on Exception catch (err) {
      emit(CupsState.error(err.toString()));
    }
  }

  Future<void> increment() async {
    try {
      emit(const CupsState.incrementing());

      final bool isConnected =
          await InternetConnectionChecker.instance.hasConnection;

      if (isConnected) {
        await FirebaseFirestore.instance
            .collection('stats')
            .doc('coffee')
            .update({'count': FieldValue.increment(1)});

        _count++;

        emit(const CupsState.incremented());
      } else {
        emit(const CupsState.noInternet());
      }
    } on Exception catch (err) {
      emit(CupsState.error(err.toString()));
    }
  }
}
