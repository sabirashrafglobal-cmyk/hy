import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'sensor_state.dart';

class SensorCubit extends Cubit<SensorState> {
  SensorCubit() : super(const SensorState());

  Future<void> fetchData() async {
    emit(state.copyWith(loading: true));
    try {
      final response = await http.get(Uri.parse('http://10.26.173.167/data'));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        emit(state.copyWith(
          temperature: data['temperature'] ?? 0.0,
          humidity: data['humidity'] ?? 0.0,
          dryBulb: data['dry_bulb'] ?? 0.0,
          loading: false,
        ));
      } else {
        emit(state.copyWith(loading: false));
      }
    } catch (_) {
      emit(state.copyWith(loading: false));
    }
  }

  void changePage(String page) {
    emit(state.copyWith(selectedPage: page));
  }
}