import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/get_weather_cubit/get_weather_cubit.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search City'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Center(
          child: TextFormField(
            onFieldSubmitted: (value) async {
              BlocProvider.of<GetWeatherCubit>(context)
                  .getWeather(cityName: value);
              Navigator.pop(context);
            },
            decoration: const InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue),
              ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 32.0,
              ),
              hintText: 'Enter City Name',
              suffixIcon: Icon(Icons.search),
              labelText: 'Search',
              labelStyle: TextStyle(
                color: Colors.black,
              ),
              border: OutlineInputBorder(),
            ),
          ),
          // TextFromField(
          //   onSubmitted: (value) async {
          //     BlocProvider.of<GetWeatherCubit>(context)
          //         .getWeather(cityName: value);
          //     Navigator.pop(context);
          //   },
          //   decoration: InputDecoration(
          //     contentPadding: EdgeInsets.symmetric(
          //       horizontal: 16.0,
          //       vertical: 32.0,
          //     ),
          //     hintText: 'Enter City Name',
          //     suffixIcon: Icon(Icons.search),
          //     label: Text('Search'),
          //   ),
          // ),
        ),
      ),
    );
  }
}
