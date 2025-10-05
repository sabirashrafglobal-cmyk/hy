import 'package:equatable/equatable.dart';

class SensorState extends Equatable {
  final double temperature;
  final double humidity;
  final double dryBulb;
  final bool loading;
  final String selectedPage;

  const SensorState({
    this.temperature = 0.0,
    this.humidity = 0.0,
    this.dryBulb = 0.0,
    this.loading = false,
    this.selectedPage = "main",
  });

  SensorState copyWith({
    double? temperature,
    double? humidity,
    double? dryBulb,
    bool? loading,
    String? selectedPage,
  }) {
    return SensorState(
      temperature: temperature ?? this.temperature,
      humidity: humidity ?? this.humidity,
      dryBulb: dryBulb ?? this.dryBulb,
      loading: loading ?? this.loading,
      selectedPage: selectedPage ?? this.selectedPage,
    );
  }

  @override
  List<Object> get props => [temperature, humidity, dryBulb, loading, selectedPage];
}