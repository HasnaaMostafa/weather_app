import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:weather_app/Cubit/weather_cubit/weather_cubit.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/pages/result_page.dart';

import '../functions/snack_bar.dart';

class SearchPage extends StatelessWidget {
  SearchPage({super.key});

  var cityController = TextEditingController();
  String? cityName;
  WeatherModel? weatherModel;

  @override
  Widget build(BuildContext context) {
    weatherModel = BlocProvider.of<WeatherCubit>(context).weatherModel;
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            HexColor("#0F48EA"),
            HexColor("#113FC1"),
            HexColor("#060F80"),
            HexColor("#041C5E"),
          ], begin: Alignment.topRight, end: Alignment.bottomLeft)),
        ),
        centerTitle: true,
        title: const Text(
          "Search a City",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      body: BlocListener<WeatherCubit, WeatherState>(
        listener: (context, state) {
          if (state is WeatherSuccessState) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => ResultPage()));
          }
          if (state is WeatherErrorState) {
            showSnackBar(context, "check the city name!");
          }
        },
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                HexColor("#0F48EA"),
                HexColor("#113FC1"),
                HexColor("#041C5E"),
                HexColor("#060F80"),
                HexColor("#3441DD"),
                HexColor("#1450FF"),
                HexColor("#136FA0"),
              ], begin: Alignment.topRight, end: Alignment.bottomLeft)),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  const Image(image: AssetImage("assets/images/search.png")),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextFormField(
                      onFieldSubmitted: (String data) async {
                        cityName = data;
                        // if (cityName == null || cityName!.isEmpty) {
                        //   final snackBar = SnackBar(
                        //     content: const Text('Enter the city Name!'),
                        //     backgroundColor: Colors.orange.shade600,
                        //     action: SnackBarAction(
                        //       label: 'Undo',
                        //       onPressed: () {},
                        //     ),
                        //   );
                        //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        // }
                        BlocProvider.of<WeatherCubit>(context)
                            .getWeatherFromSearch(cityName: data);
                      },
                      controller: cityController,
                      enableSuggestions: true,
                      decoration: InputDecoration(
                        labelText: "Search",
                        hintText: "Enter a city",
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.white,
                            ),
                            borderRadius: BorderRadius.circular(20)),
                        labelStyle: const TextStyle(color: Colors.white),
                        hintStyle: const TextStyle(color: Colors.white),
                        prefixIcon: const Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () async {
                      cityName = cityController.text;
                      // if (cityName == null || cityName!.isEmpty) {
                      //   final snackBar = SnackBar(
                      //     content: const Text('Enter the city Name!'),
                      //     backgroundColor: Colors.orange.shade600,
                      //     action: SnackBarAction(
                      //       label: 'Undo',
                      //       onPressed: () {},
                      //     ),
                      //   );
                      //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      // }
                      BlocProvider.of<WeatherCubit>(context)
                          .getWeatherFromSearch(cityName: cityController.text);
                    },
                    child: Container(
                        width: 150,
                        height: 65,
                        decoration: BoxDecoration(
                            color: HexColor("#478CCC"),
                            borderRadius: BorderRadius.circular(20)),
                        child: const Center(
                          child: Text(
                            "Search",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        )),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  // if(WeatherStates is WeatherLoadingState)
                  // const CupertinoActivityIndicator(
                  //   color: Colors.white,
                  // )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
