
import 'package:flutter/material.dart';
import 'package:mc_weather_app/constantes.dart';
import 'package:mc_weather_app/screens/favorite_screen.dart';
import 'package:mc_weather_app/screens/home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List screens = [const HomeScreen(),FavoriteScreen()];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: screens[currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: beige,
        onTap: (index) =>setState(() => currentIndex= index),
        type: BottomNavigationBarType.fixed,
        elevation: 10,
        fixedColor: mauve,
        currentIndex: currentIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,

        items: [
          //changer les icons => cupertino
            const BottomNavigationBarItem(icon: Icon(Icons.home_outlined),label: 'home'),
            const BottomNavigationBarItem(icon: const Icon(Icons.favorite_outline),label: 'favorite'),
        ],
      ),
    );
  }
}
