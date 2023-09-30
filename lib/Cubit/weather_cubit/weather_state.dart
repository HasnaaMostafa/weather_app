part of 'weather_cubit.dart';

abstract class WeatherState {}

class WeatherInitialState extends WeatherState {}

class WeatherLoadingState extends WeatherState {}

class WeatherSuccessState extends WeatherState {
  WeatherModel weatherModel;
  WeatherSuccessState(this.weatherModel);
}

class WeatherErrorState extends WeatherState {
  String error;
  WeatherErrorState(this.error);
}
