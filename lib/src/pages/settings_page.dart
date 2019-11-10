import 'package:flutter/material.dart';
import 'package:flutter_user_preferences/widgets/menu_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {

  static final String routeName = 'settings';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  bool _secondaryColor = false;
  int _gender = 1;
  String _name = 'Juan';
  TextEditingController _textController;

  @override
  void initState() {
    _textController = TextEditingController(
      text: _name
    );
    _loadPreferences();
    super.initState();
  }

  _loadPreferences() async{
    final prefs = await SharedPreferences.getInstance();
    _gender = prefs.getInt('gender') ?? 1;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Preferences'),
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
               },
             ),
           )
        ],
      ),
      drawer: MenuWidget(),
    );
  }

  _selectRadioGender(int value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('gender', value);
    setState(() {
      _gender = value;                 
    });
  }
}