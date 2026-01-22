part of 'name_cubit.dart';

@freezed
class NameState with _$NameState {
  const factory NameState.initial() = _Initial;
  const factory NameState.loading() = _Loading;
  const factory NameState.success() = _Success;
  const factory NameState.error(String errMsg) = Error;
}
