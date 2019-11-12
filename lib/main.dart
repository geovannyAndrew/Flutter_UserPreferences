import 'package:flutter/material.dart';
import 'package:flutter_user_preferences/src/pages/home_page.dart';
import 'package:flutter_user_preferences/src/pages/settings_page.dart';
import 'package:flutter_user_preferences/src/shared_preferences/preferences_user.dart';
 
void main() async{
  final prefs = PreferencesUser();
  await prefs.initPreferences();
  runApp(MyApp());
}
  
 
class MyApp extends StatelessWidget {

  final prefs = PreferencesUser();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User Preferences',
      initialRoute: prefs.lastRoute,
      routes: {
        HomePage.routeName :  (BuildContext context) => HomePage(),
        SettingsPage.routeName :  (BuildContext context) => SettingsPage(),
      },
    );
  }
}