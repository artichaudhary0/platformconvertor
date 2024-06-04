import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:platformconvertor/main.dart';

class IncrementProvider extends ChangeNotifier{
  int _increment = 0 ;
  int get increment => _increment;

  void incrementValue()
  {
    _increment ++ ;
    notifyListeners();
  }
}


class SwitchProvider extends ChangeNotifier{
  bool _isDark = false ;
  bool get isDark => _isDark ;

  ThemeData _themeData = ThemeData.light();

  ThemeData get themeData =>_themeData;

  void togggle(ThemeData themeData)
  {
    _themeData = themeData;
    notifyListeners();
  }

  void toggle(bool value){
    _isDark = value;
    themeVar = _isDark;

    print(themeVar);
    notifyListeners();
  }

}