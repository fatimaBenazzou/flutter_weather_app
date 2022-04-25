class Weather {
  String? cityName;
  String? weather;
  double? temp;
  double? wind;
  int? humidity;
  int? pressure;
  String? icon;
  String? country;

  Weather({
      this.cityName,
      this.weather,
      this.temp,
      this.wind, //vent
      this.humidity,
      this.pressure,
      this.icon,
      this.country,
      });

//function to parse the JSON file into the model
  Weather.fromJson(Map<String, dynamic> json) {
    cityName = json["name"];
    temp = json["main"]["temp"];
    wind = json["wind"]["speed"];
    pressure = json["main"]["pressure"];
    humidity = json["main"]["humidity"];
    weather = json["weather"][0]["main"];
    icon = json['weather'][0]['icon'];
    country = json["sys"]["country"];
  }
}
