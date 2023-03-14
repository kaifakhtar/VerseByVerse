
import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier{

  ThemeMode _themeData;
  bool _isDark=false;

  bool get isDark => _isDark;

  set isDark(bool value) {
    _isDark = value;
    notifyListeners();
  }

  ThemeChanger(this._themeData);

  ThemeMode get themeData => _themeData;

  set themeData(ThemeMode value) {
    _themeData = value;
    notifyListeners();
  }

  void toggleTheme(){
    if(_isDark==true){
      _isDark=false;
      notifyListeners();
    }
    else{
      _isDark=true;
    notifyListeners();
  }}
}