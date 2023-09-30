// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import '../models/weather_model.dart';
//
// class WeatherServices {
//   String baseUrl = "http://api.weatherapi.com/v1";
//   String apiKey = "9aa495a935a94ef09cf151241231308";
//
//   Future<WeatherModel?> getWeather(
//       {required String cityName, required BuildContext context}) async {
//     WeatherModel? weatherModel;
//     try {
//       Uri url =
//           Uri.parse("$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1");
//       http.Response response = await http.get(url);
//
//       Map<String, dynamic> data = jsonDecode(response.body);
//
//       weatherModel = WeatherModel.fromJson(data);
//     } catch (error) {
//       final snackBar = SnackBar(
//         content: const Text('check the city name!'),
//         backgroundColor: Colors.orange.shade600,
//         action: SnackBarAction(
//           label: 'Undo',
//           onPressed: () {},
//         ),
//       );
//       ScaffoldMessenger.of(context).showSnackBar(snackBar);
//     }
//
//     return weatherModel;
//   }
// }
