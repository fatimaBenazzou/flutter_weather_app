import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/forecast_modal.dart';

class WeatherApiForecast {
  Future<List> getCurrentweatherForecast(String? location) async {
    var appid = ''; // add app id
    var endpoint = Uri.parse(
        "https://api.openweathermap.org/data/2.5/forecast?q=$location&appid=$appid&units=metric");
    var response = await http.get(endpoint);
    var body = jsonDecode(response.body);

    List<Forecast> days = [];

    // l'api contient les infos de 5 jours, par interval de 3h
    //5 jrs * 24h/3h => 5*8 = 40
    for (int i = 0; i < 40; i += 8) {
      days.add(Forecast(
          date: Forecast.fromJson(body, i).date,
          icon: Forecast.fromJson(body, i).icon,
          minTemp: Forecast.fromJson(body, i).minTemp,
          maxTemp: Forecast.fromJson(body, i).maxTemp));
    }

    return days;
  }
}
