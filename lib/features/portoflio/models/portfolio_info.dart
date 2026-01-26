import 'package:freezed_annotation/freezed_annotation.dart';


part 'portfolio_info.freezed.dart';
part 'portfolio_info.g.dart';


@freezed
abstract class PortfolioInfo with _$PortfolioInfo {
  const factory PortfolioInfo({
    required String name,
    required int coffeeCounter,
    required String description,
  }) = _PortfolioInfo;

  factory PortfolioInfo.fromJson(Map<String, dynamic> json) => _$PortfolioInfoFromJson(json);
}
