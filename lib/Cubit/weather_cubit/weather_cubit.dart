import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:weather_app/Services/weather_services_dio.dart';

import '../../models/weather_model.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherInitialState());

  String? cityName;

  WeatherModel? weatherModel;

  void getWeatherFromSearch({required String cityName}) async {
    emit(WeatherLoadingState());
    try {
      weatherModel =
          await WeatherServices(Dio()).getCurrentWeather(cityName: cityName);
      emit(WeatherSuccessState(weatherModel!));
    } catch (e) {
      emit(WeatherErrorState(e.toString()));
    }
  }
}
