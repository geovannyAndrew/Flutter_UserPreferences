import 'package:flutter_user_preferences/src/pages/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesUser{

  static final PreferencesUser _instance = PreferencesUser._();

  factory PreferencesUser(){
    return _instance;
  }

  PreferencesUser._();

  SharedPreferences _sharedPreferences;

  initPreferences() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  get gender{
    return _sharedPreferences.getInt('gender') ?? 1;
  }

  set gender( int value){
    _sharedPreferences.setInt('gender', value);
  }

  get secondaryColor{
    return _sharedPreferences.getBool('secondary_color') ?? false;
  }

  set secondaryColor( bool value){
    _sharedPreferences.setBool('secondary_color', value);
  }

  get name{
    return _sharedPreferences.getString('name') ?? '';
  }

  set name( String value){
    _sharedPreferences.setString('name', value);
  }

  get lastRoute{
    return _sharedPreferences.getString('last_route') ?? HomePage.routeName;
  }

  set lastRoute( String value){
    _sharedPreferences.setString('last_route', value);
  }
}