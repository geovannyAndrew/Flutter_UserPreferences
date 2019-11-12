import 'package:flutter/material.dart';
import 'package:flutter_user_preferences/src/pages/settings_page.dart';
import 'package:flutter_user_preferences/src/shared_preferences/preferences_user.dart';
import 'package:flutter_user_preferences/widgets/menu_widget.dart';

class HomePage extends StatelessWidget {

  static final String routeName = 'home';
  final prefs = PreferencesUser();

  @override
  Widget build(BuildContext context) {

    prefs.lastRoute = SettingsPage.routeName;

    return Scaffold(
      appBar: AppBar(
        title: Text('User Preferences'),
        backgroundColor: prefs.secondaryColor ? Colors.teal : Theme.of(context).primaryColor,
      ),
      drawer: MenuWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Seconday color: ${prefs.secondaryColor}'),
          Divider(),
          Text('Gender: ${prefs.gender}'),
          Divider(),
          Text('User Name: ${prefs.name}'),
          Divider(),
        ],
      ),
    );
  }

}