import 'package:intl/intl.dart';

class Forecast {
  int? dt;
  String? date;
  var minTemp;
  var maxTemp;
  String? icon;

  Forecast({
    this.dt,
    this.date,
    this.minTemp,
    this.maxTemp,
    this.icon,
  });

//function to parse the JSON file into the model
  Forecast.fromJson(Map<String, dynamic> json,int i) {
    dt = json["list"][i]["dt"];
    date = DateFormat('EEEE').format(DateTime.parse(json['list'][i]["dt_txt"]));
    minTemp = json['list'][i]['main']['temp_min'];
    maxTemp = json['list'][i]['main']['temp_max'];
    icon = json['list'][i]['weather'][0]['icon'];
  }

}
