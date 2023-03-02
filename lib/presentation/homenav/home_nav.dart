
import 'package:flutter/material.dart';
import 'package:mytask/presentation/dashboard/dashbaord_screen.dart';
import 'package:mytask/presentation/history/history_screen.dart';
import 'package:mytask/presentation/settings/settings_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeNavScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() =>_HomeNavScreen();

}

class _HomeNavScreen extends State<HomeNavScreen>{

  int _selectedIndex = 0;
  void _onItemTapped(int index) {

    setState(() {
      _selectedIndex = index;
    });
  }

  static const List<Widget> _widgetOptions = <Widget>[
    Dashboard(),
    HistoryScreen(),
    SettingScreen(),
  ];


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var appLoc = AppLocalizations.of(context)!;
    return Scaffold(

      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: appLoc.home,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.history),
            label: appLoc.history,
          ),

          BottomNavigationBarItem(
            icon: const Icon(Icons.settings),
            label: appLoc.setting,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: BottomNavigationBarTheme.of(context).selectedItemColor,
        onTap: _onItemTapped,
      ),
    );
  }

}