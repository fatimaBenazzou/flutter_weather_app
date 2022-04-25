import 'package:flutter/material.dart';
import 'package:mc_weather_app/constantes.dart';
import 'package:mc_weather_app/models/weather_modal.dart';
import 'package:mc_weather_app/services/weather_services.dart';
import '../services/forecast_services.dart';
import '../widgets/DailyForecast.dart';
import '../widgets/extra_info.dart';
import '../globals.dart' as globals;
import '../widgets/weather_infos.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //app bar variables
  Widget customSearchBar = const Text('');
  Icon customIcon = const Icon(
    Icons.search,
    color: mauve,
  );

  final TextEditingController _textEditingController = TextEditingController();

  static String cityName = 'algiers';

  //current weather variables
  WeatherApiclient client = WeatherApiclient();
  Weather? data;

  //forecast variables
  List forecastData = [];
  WeatherApiForecast forecast = WeatherApiForecast();

  Future<void> getData(cityName) async {
    data = await client.getCurrentweather(cityName);
  }

  Future<void> getForecastData(cityName) async {
    forecastData = await forecast.getCurrentweatherForecast(cityName);
    setState(() {
      forecastData = forecastData;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getForecastData(cityName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: beige,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: beige,
        title: customSearchBar,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: customIcon,
            onPressed: () {
              setState(() {
                if (customIcon.icon == Icons.search) {
                  customIcon = const Icon(
                    Icons.edit,
                    color: mauve,
                  );
                  customSearchBar = ListTile(
                      leading: const Icon(
                        Icons.search,
                        color: mauve,
                        size: 28,
                      ),
                      title: TextField(
                        controller: _textEditingController,
                        cursorColor: mauve,
                        style: const TextStyle(
                          color: mauve,
                          fontSize: 20,
                        ),
                        decoration: const InputDecoration(
                          hintText: 'Enter a city...',
                          hintStyle: TextStyle(
                            color: lilas,
                            fontSize: 18,
                            fontStyle: FontStyle.italic,
                          ),
                          border: InputBorder.none,
                        ),
                        onSubmitted: (String val) {
                          setState(() {
                            cityName = val;
                          });
                        },
                      ));
                } else {
                  customIcon = const Icon(
                    Icons.search,
                    color: mauve,
                  );
                  customSearchBar = const Text('');
                }
              });
            },
          )
        ],
      ),
      body: FutureBuilder(
          future: getData(cityName),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  //1ere partie => weather infos + icon
                  Expanded(
                    flex: 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        //weather infos
                        WeatherInfos(data: data),

                        //weather icon
                        Expanded(
                          child: Image.asset(
                            'assets/icons/${data?.icon}.png',
                            height: 150,
                            width: 150,
                          ),
                        ),
                      ],
                    ),
                  ),

                  //weather extra infos
                  Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //extra info 1
                        ExtraInfo(
                            icon: Icons.water_drop_outlined,
                            text: '${data!.humidity}%'),

                        //extra info 2
                        ExtraInfo(
                            icon: Icons.schedule, text: '${data!.pressure}bar'),

                        //extra info 3
                        ExtraInfo(icon: Icons.air, text: '${data!.wind}km/h'),

                        // favorite
                        Expanded(
                            flex: 1,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  (globals.favoriteCities.contains(cityName))
                                      ? globals.favoriteCities.remove(cityName)
                                      : globals.favoriteCities.add(cityName);
                                });
                              },
                              child: AnimatedContainer(
                                  height: 35,
                                  padding: const EdgeInsets.all(5),
                                  duration: const Duration(milliseconds: 300),
                                  child: Center(
                                      child: globals.favoriteCities
                                              .contains(cityName)
                                          ? const Icon(
                                              Icons.favorite,
                                              color: orange,
                                            )
                                          : Icon(Icons.favorite_outline,
                                              color: orange))),
                            )),
                      ],
                    ),
                  ),

                  //5 days Forecast
                  Expanded(
                      flex: 2,
                      child: DailyForecast(forecastData: forecastData)),
                ],
              );
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(color: orange),
              );
            }
            return Container();
          }),
    ); // FutureBuilder // Scaffold
  }
}
