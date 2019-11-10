import 'package:flutter/material.dart';
import 'package:flutter_user_preferences/widgets/menu_widget.dart';

class SettingsPage extends StatelessWidget {

  static final String routeName = 'settings';

  const SettingsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Preferences'),
      ),
      body: Center(
        child: Text('Settings'),
      ),
      drawer: MenuWidget(),
    );
  }
}