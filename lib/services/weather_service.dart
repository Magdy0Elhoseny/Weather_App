import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  final Dio dio;

  final String baseUrl = 'http://api.weatherapi.com/v1';
  final String apiKey = '3712c97014e44814b1a112534241504';
  WeatherService(this.dio);
  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
      Response response = await dio.get(
        '$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1',
      );
      WeatherModel weatherModel = WeatherModel.fromJson(
        response.data,
      );
      return weatherModel;
    } on DioException catch (e) {
      final errMassage = e.response?.data['error']['message'] ??
          'oops! there was an error, please try later';
      throw Exception(errMassage);
    } catch (e) {
      log(e.toString());
      throw Exception('oops! there was an error, please try later');
    }
  }
}
