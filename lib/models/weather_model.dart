import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';

class WeatherModel {
  final String cityName;
  final String date;
  final double temp;
  final double maxTemp;
  final String? image;
  final double minTemp;
  final String weatherStateName;
  final DateTime sunrise;
  final DateTime sunset;

  WeatherModel({
    required this.date,
    required this.temp,
    required this.maxTemp,
    required this.minTemp,
    required this.weatherStateName,
    required this.cityName,
    this.image,
    required this.sunrise,
    required this.sunset,
  });

  factory WeatherModel.fromJson(json) {
    String sunriseTime = json["forecast"]["forecastday"][0]["astro"]["sunrise"];
    String sunsetTime = json["forecast"]["forecastday"][0]["astro"]["sunset"];

    DateTime sunrise = DateFormat('hh:mm a').parse(sunriseTime);
    DateTime sunset = DateFormat('hh:mm a').parse(sunsetTime);
    return WeatherModel(
        date: json["current"]["last_updated"],
        temp: json["forecast"]["forecastday"][0]["day"]["avgtemp_c"],
        maxTemp: json["forecast"]["forecastday"][0]["day"]["maxtemp_c"],
        minTemp: json["forecast"]["forecastday"][0]["day"]["mintemp_c"],
        weatherStateName: json["forecast"]["forecastday"][0]["day"]["condition"]
            ["text"],
        image: json["forecast"]["forecastday"][0]["day"]["condition"]["icon"],
        cityName: json["location"]["name"],
        sunrise: sunrise,
        sunset: sunset);
  }

  Map<String, dynamic> toJson() {
    return {
      "current": {
        "last_updated": date,
      },
      "forecast": {
        "forecastday": [
          {
            "day": {
              "avgtemp_c": temp,
              "maxtemp_c": maxTemp,
              "mintemp_c": minTemp,
              "condition": {
                "text": weatherStateName,
                "icon": image,
              },
            },
            "astro": {
              "sunrise": sunrise.toIso8601String(),
              "sunset": sunset.toIso8601String(),
            },
          },
        ],
      },
      "location": {
        "name": cityName,
      },
    };
  }

  @override
  String toString() {
    return "temp= $temp  mintemp=$minTemp  maxtemp=$maxTemp data=$date ";
  }

  String getMorningImage() {
    if (weatherStateName == 'Sunny' ||
        weatherStateName == 'Clear' ||
        weatherStateName == 'partly cloudy' ||
        weatherStateName.contains('sunny') ||
        weatherStateName.contains('Clear')) {
      return 'assets/images/clear_day.png';
    } else if (weatherStateName == 'Blizzard' ||
        weatherStateName == 'Patchy snow possible' ||
        weatherStateName == 'Patchy sleet possible' ||
        weatherStateName == 'Patchy freezing drizzle possible' ||
        weatherStateName == 'Blowing snow' ||
        weatherStateName.contains('snow')) {
      return 'assets/images/snow_day.png';
    } else if (weatherStateName == 'Freezing fog' ||
        weatherStateName == 'Fog' ||
        weatherStateName == 'Heavy Cloud' ||
        weatherStateName == 'Mist' ||
        weatherStateName == 'Fog' ||
        weatherStateName.contains('cloudy')) {
      return 'assets/images/cloudy_day.png';
    } else if (weatherStateName == 'Patchy rain possible' ||
        weatherStateName == 'Heavy Rain' ||
        weatherStateName == 'Showers	' ||
        weatherStateName.contains('rain')) {
      return 'assets/images/rain_day.png';
    } else if (weatherStateName == 'Thundery outbreaks possible' ||
        weatherStateName == 'Moderate or heavy snow with thunder' ||
        weatherStateName == 'Patchy light snow with thunder' ||
        weatherStateName == 'Moderate or heavy rain with thunder' ||
        weatherStateName == 'Patchy light rain with thunder' ||
        weatherStateName.contains('thunder')) {
      return 'assets/images/thunderstorm_day.png';
    } else {
      return 'assets/images/clear_day.png';
    }
  }

  String getNightImage() {
    if (weatherStateName == 'Sunny' ||
        weatherStateName == 'Clear' ||
        weatherStateName == 'partly cloudy' ||
        weatherStateName.contains('sunny') ||
        weatherStateName.contains('Clear')) {
      return 'assets/images/clear_night.png';
    } else if (weatherStateName == 'Blizzard' ||
        weatherStateName == 'Patchy snow possible' ||
        weatherStateName == 'Patchy sleet possible' ||
        weatherStateName == 'Patchy freezing drizzle possible' ||
        weatherStateName == 'Blowing snow' ||
        weatherStateName.contains('snow')) {
      return 'assets/images/snow_night.png';
    } else if (weatherStateName == 'Freezing fog' ||
        weatherStateName == 'Fog' ||
        weatherStateName == 'Heavy Cloud' ||
        weatherStateName == 'Mist' ||
        weatherStateName == 'Fog' ||
        weatherStateName.contains('cloudy')) {
      return 'assets/images/cloudy_night.png';
    } else if (weatherStateName == 'Patchy rain possible' ||
        weatherStateName == 'Heavy Rain' ||
        weatherStateName == 'Showers	' ||
        weatherStateName.contains('rain')) {
      return 'assets/images/rain_night.png';
    } else if (weatherStateName == 'Thundery outbreaks possible' ||
        weatherStateName == 'Moderate or heavy snow with thunder' ||
        weatherStateName == 'Patchy light snow with thunder' ||
        weatherStateName == 'Moderate or heavy rain with thunder' ||
        weatherStateName == 'Patchy light rain with thunder' ||
        weatherStateName.contains('thunder')) {
      return 'assets/images/thunderstorm_night.png';
    } else {
      return 'assets/images/clear_night.png';
    }
  }

  List<Color> getBackGroundColor() {
    List<Color> colors = [];
    if (weatherStateName == 'Sunny' ||
        weatherStateName == 'Clear' ||
        weatherStateName == 'partly cloudy' ||
        weatherStateName.contains('sunny') ||
        weatherStateName.contains('Clear')) {
      colors = [
        HexColor("#FFEF00"),
        HexColor("#FF5F1F"),
        HexColor("#FF7722"),
        HexColor("#FF0000"),
        HexColor("#F62217"),
      ];
      return colors;
    } else if (weatherStateName == 'Blizzard' ||
        weatherStateName == 'Patchy snow possible' ||
        weatherStateName == 'Patchy sleet possible' ||
        weatherStateName == 'Patchy freezing drizzle possible' ||
        weatherStateName == 'Blowing snow' ||
        weatherStateName.contains('snow')) {
      colors = [
        HexColor("#77BFC7"),
        HexColor("#78C7C7"),
        HexColor("#92C7C7"),
      ];
      return colors;
    } else if (weatherStateName == 'Freezing fog' ||
        weatherStateName == 'Fog' ||
        weatherStateName == 'Heavy Cloud' ||
        weatherStateName == 'Mist' ||
        weatherStateName == 'Fog' ||
        weatherStateName == 'Cloudy' ||
        weatherStateName.contains('cloudy')) {
      colors = [HexColor("#00BFFF"), HexColor("#C25283")];
      return colors;
    } else if (weatherStateName == 'Patchy rain possible' ||
        weatherStateName == 'Heavy Rain' ||
        weatherStateName == 'Showers	' ||
        weatherStateName.contains('rain')) {
      colors = [Color(0xff3d84ec), HexColor("#87CEEB"), HexColor("#6495ED")];
      return colors;
    } else if (weatherStateName == 'Thundery outbreaks possible' ||
        weatherStateName == 'Moderate or heavy snow with thunder' ||
        weatherStateName == 'Patchy light snow with thunder' ||
        weatherStateName == 'Moderate or heavy rain with thunder' ||
        weatherStateName == 'Patchy light rain with thunder' ||
        weatherStateName.contains('thunder')) {
      colors = [HexColor("#786D5F"), HexColor("#151B54")];
      return colors;
    } else {
      colors = [Color(0xff47c8ff), Color(0xff46b0fe)];
      return colors;
    }
  }

  Color getAppbarColor() {
    Color color;
    if (weatherStateName == 'Sunny' ||
        weatherStateName == 'Clear' ||
        weatherStateName == 'partly cloudy' ||
        weatherStateName.contains('sunny') ||
        weatherStateName.contains('Clear')) {
      color = HexColor("#FFEF00");

      return color;
    } else if (weatherStateName == 'Blizzard' ||
        weatherStateName == 'Patchy snow possible' ||
        weatherStateName == 'Patchy sleet possible' ||
        weatherStateName == 'Patchy freezing drizzle possible' ||
        weatherStateName == 'Blowing snow' ||
        weatherStateName.contains('snow')) {
      color = HexColor("#77BFC7");

      return color;
    } else if (weatherStateName == 'Freezing fog' ||
        weatherStateName == 'Fog' ||
        weatherStateName == 'Heavy Cloud' ||
        weatherStateName == 'Mist' ||
        weatherStateName == 'Fog' ||
        weatherStateName == 'Cloudy' ||
        weatherStateName.contains('cloudy')) {
      color = HexColor("#00BFFF");
      return color;
    } else if (weatherStateName == 'Patchy rain possible' ||
        weatherStateName == 'Heavy Rain' ||
        weatherStateName == 'Showers	' ||
        weatherStateName.contains('rain')) {
      color = Color(0xff3d84ec);
      return color;
    } else if (weatherStateName == 'Thundery outbreaks possible' ||
        weatherStateName == 'Moderate or heavy snow with thunder' ||
        weatherStateName == 'Patchy light snow with thunder' ||
        weatherStateName == 'Moderate or heavy rain with thunder' ||
        weatherStateName == 'Patchy light rain with thunder' ||
        weatherStateName.contains('thunder')) {
      color = HexColor("#786D5F");
      return color;
    } else {
      color = Color(0xff47c8ff);
      return color;
    }
  }
}
