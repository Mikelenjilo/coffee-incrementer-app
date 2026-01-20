part of 'cups_cubit.dart';

@freezed
class CupsState with _$CupsState {
  const factory CupsState.initial() = _Initial;
  const factory CupsState.incrementing() = _Incrementing;
  const factory CupsState.loading() = _Loading;
  const factory CupsState.loaded() = _Loaded;
  const factory CupsState.incremented() = _Incremented;
  const factory CupsState.noInternet() = _NoInternet;
  const factory CupsState.error(String message) = _Error;
}
