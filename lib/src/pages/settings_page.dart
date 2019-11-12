import 'package:flutter/material.dart';
import 'package:flutter_user_preferences/src/shared_preferences/preferences_user.dart';
import 'package:flutter_user_preferences/widgets/menu_widget.dart';

class SettingsPage extends StatefulWidget {

  static final String routeName = 'settings';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  bool _secondaryColor;
  int _gender;
  String _name = 'Juan';
  TextEditingController _textController;
  final prefs = PreferencesUser();

  @override
  void initState() {
    _textController = TextEditingController(
      text: prefs.name
    );
    _loadPreferences();
    super.initState();
  }

  _loadPreferences(){
    _gender = prefs.gender;
    _secondaryColor = prefs.secondaryColor;
    _name = prefs.name;
    prefs.lastRoute = SettingsPage.routeName;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Preferences'),
        backgroundColor: prefs.secondaryColor ? Colors.teal : Theme.of(context).primaryColor,
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(5.0),
            child: Text('Settings',
              style: TextStyle(
                fontSize: 45.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.start,
            ),
          ),
           Divider(),
           SwitchListTile(
             value: _secondaryColor,
             title: Text('Secondary Color'),
             onChanged: (value){
               setState(() {
                 _secondaryColor = value;
                 prefs.secondaryColor = _secondaryColor;
               });
             },
           ),
           RadioListTile(
             value: 1,
             groupValue: _gender,
             title: Text('Male'),
             onChanged: _selectRadioGender,
           ),
           RadioListTile(
             value: 2,
             groupValue: _gender,
             title: Text('Female'),
             onChanged:_selectRadioGender,
           ),
           Divider(),
           Container(
             padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
             child: TextField(
               controller: _textController,
               decoration: InputDecoration(
                 labelText: 'Name',
                 helperText: 'Person\'s Name'
               ),
               onChanged: (value){
                 _name = value;
                 prefs.name = _name;
               },
             ),
           )
        ],
      ),
      drawer: MenuWidget(),
    );
  }

  _selectRadioGender(int value) {
    prefs.gender = value;
    setState(() {
      _gender = value;                 
    });
  }
}