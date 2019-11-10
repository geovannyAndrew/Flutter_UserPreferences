import 'package:flutter/material.dart';
import 'package:flutter_user_preferences/src/pages/settings_page.dart';
import 'package:flutter_user_preferences/widgets/menu_widget.dart';

class HomePage extends StatelessWidget {

  static final String routeName = 'home';

  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Preferences'),
      ),
      drawer: MenuWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Seconday color'),
          Divider(),
          Text('Gender'),
          Divider(),
          Text('User Name'),
          Divider(),
        ],
      ),
    );
  }

}