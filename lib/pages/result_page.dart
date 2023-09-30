import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:weather_app/Cubit/weather_cubit/weather_cubit.dart';
import 'package:weather_app/functions/parse_date_time.dart';
import 'package:weather_app/models/weather_model.dart';

class ResultPage extends StatelessWidget {
  ResultPage({super.key});

  WeatherModel? weatherModel;

  @override
  Widget build(BuildContext context) {
    DateTime currentTime = DateTime.now();

    DateTime nightStartTime =
        DateTime(currentTime.year, currentTime.month, currentTime.day, 19);
    DateTime nightEndTime =
        DateTime(currentTime.year, currentTime.month, currentTime.day, 6);
    bool isNightTime = currentTime.isAfter(nightStartTime) ||
        currentTime.isBefore(nightEndTime);
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        if (state is WeatherSuccessState) {
          weatherModel = state.weatherModel;
          return Scaffold(
              appBar: AppBar(
                backgroundColor: isNightTime
                    ? HexColor("#151B54")
                    : weatherModel!.getAppbarColor(),
                elevation: 0,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarIconBrightness: Brightness.light,
                  statusBarColor: HexColor("#FFEF00"),
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.location_on_outlined,
                      color: Colors.white54,
                    ),
                    Text(
                      weatherModel!.cityName,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                actions: const [
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Icon(Icons.search),
                  )
                ],
              ),
              body: Stack(
                children: [
                  if (!isNightTime)
                    Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                        colors: weatherModel!.getBackGroundColor(),
                        // [
                        //   HexColor("#FFEF00"),
                        //   HexColor("#FF5F1F"),
                        //   HexColor("#FF7722"),
                        //   HexColor("#FF0000"),
                        //   HexColor("#F62217"),
                        // ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      )),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(12.0),
                            child: Text(
                              "Today's Weather",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 27,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Center(
                            child: Image.asset(weatherModel!.getMorningImage()),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Center(
                            child: Column(
                              children: [
                                Text(
                                  "it's ${weatherModel!.weatherStateName}",
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 26,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  "${weatherModel!.temp}°C",
                                  style: TextStyle(
                                      color: Colors.grey[300],
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                    height: 50,
                                    decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          const Row(
                                            children: [
                                              Icon(
                                                Icons.nightlight_outlined,
                                                size: 12,
                                              ),
                                              Text(
                                                "MinTemp",
                                                style: TextStyle(
                                                    fontSize: 12, height: 1.2),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            "${weatherModel!.minTemp}22°C",
                                            style: const TextStyle(
                                                height: 1.2, fontSize: 12),
                                          )
                                        ],
                                      ),
                                    )),
                                Container(
                                    height: 50,
                                    decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          const Row(
                                            children: [
                                              Icon(
                                                Icons.wb_sunny_outlined,
                                                size: 12,
                                              ),
                                              Text(
                                                "MaxTemp",
                                                style: TextStyle(
                                                    fontSize: 12, height: 1.2),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            "${weatherModel!.maxTemp}°C",
                                            style: const TextStyle(
                                                height: 1.2, fontSize: 12),
                                          )
                                        ],
                                      ),
                                    )),
                              ]),
                          const SizedBox(
                            height: 30,
                          ),
                          Center(
                            child: Text(
                              "updated at : ${stringToDateTime(weatherModel!.date).hour} : ${stringToDateTime(weatherModel!.date).minute}",
                              style: TextStyle(
                                  color: Colors.grey[200],
                                  fontSize: 21,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  if (isNightTime)
                    Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                        colors: [
                          HexColor("#151B54"),
                          HexColor("#191970"),
                          HexColor("#000080"),
                          HexColor("#2B3856"),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      )),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(12.0),
                            child: Text(
                              "Today's Weather",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 27,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Center(
                            child: Image.asset(weatherModel!.getNightImage()),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Center(
                            child: Column(
                              children: [
                                if (isNightTime &&
                                    weatherModel!.weatherStateName.toString() ==
                                        "Sunny")
                                  const Text(
                                    "it's Clear",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 26,
                                        fontWeight: FontWeight.bold),
                                  ),
                                if (isNightTime &&
                                    weatherModel!.weatherStateName.toString() !=
                                        "Sunny")
                                  Text(
                                    "it's ${weatherModel!.weatherStateName.toString()}",
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 26,
                                        fontWeight: FontWeight.bold),
                                  ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  "${weatherModel!.temp}°C",
                                  style: TextStyle(
                                      color: Colors.grey[300],
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                    height: 50,
                                    decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          const Row(
                                            children: [
                                              Icon(
                                                Icons.nightlight_outlined,
                                                size: 12,
                                              ),
                                              Text(
                                                "MinTemp",
                                                style: TextStyle(
                                                    fontSize: 12, height: 1.2),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            "${weatherModel!.minTemp}°C",
                                            style: const TextStyle(
                                                height: 1.2, fontSize: 12),
                                          )
                                        ],
                                      ),
                                    )),
                                Container(
                                    height: 50,
                                    decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          const Row(
                                            children: [
                                              Icon(
                                                Icons.wb_sunny_outlined,
                                                size: 12,
                                              ),
                                              Text(
                                                "MaxTemp",
                                                style: TextStyle(
                                                    fontSize: 12, height: 1.2),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            "${weatherModel!.maxTemp}°C",
                                            style: const TextStyle(
                                                height: 1.2, fontSize: 12),
                                          )
                                        ],
                                      ),
                                    )),
                              ]),
                          const SizedBox(
                            height: 30,
                          ),
                          Center(
                            child: Text(
                              "updated at : ${stringToDateTime(weatherModel!.date).hour} : ${stringToDateTime(weatherModel!.date).minute} ",
                              style: TextStyle(
                                  color: Colors.grey[200],
                                  fontSize: 21,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ));
        } else if (state is WeatherLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is WeatherErrorState) {
          Navigator.pop(context);
          return Container();
        } else {
          Navigator.pop(context);
          return Container(
            color: Colors.greenAccent,
          );
        }
      },
    );
  }
}
