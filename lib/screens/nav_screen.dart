import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/cubits/app_bar/app_bar_cubit.dart';
import 'package:netflix_clone/screens/screens.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({super.key});

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  final List<Widget> _screens = [
    HomeScreen(key: PageStorageKey('homeScreen')),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold()
  ];

  final Map<String, IconData> _icons = const {
    'Home': Icons.home,
    'Search': Icons.search,
    'Coming Soon': Icons.queue_play_next,
    'Downloads': Icons.download_done,
    'More': Icons.menu
  };

  int _currentIndex = 0;
  //made screens(list of widgets) and icons data (map of string and icon data)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocProvider<AppBarCubit>(
          create: (_) => AppBarCubit(),
          child: _screens[_currentIndex],
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.black,
          items: _icons
              .map((title, icon) => MapEntry(
                  title,
                  BottomNavigationBarItem(
                      icon: Icon(
                        icon,
                        size: 30.0,
                      ),
                      label: title)))
              .values
              .toList(),
          currentIndex: _currentIndex,
          selectedItemColor: Colors.white,
          selectedFontSize: 11.0,
          unselectedItemColor: Colors.grey,
          unselectedFontSize: 11.0,
          onTap: ((index) {
            setState(() {
              _currentIndex = index;
            });
          }),
        ));
  }
}
//NAUKRIGULF
//MONSTOR.COM
//INDEED
//PUSH THIS ON SERVER..
//SEE WHY THIS IS NOT WORKING
//CREATE A README..
//START ON THE FOOD DELIVERY APP...
//WHY ARE THINGS SO COMPLICATED..
