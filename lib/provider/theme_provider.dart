

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../themes/themes.dart';

class ThemeProvider extends ChangeNotifier{
  late ThemeData _selectTheme ;
  late SharedPreferences pref;

  ThemeProvider({bool isDark = false})
  {
    this._selectTheme= isDark ? darkTheme : lightTheme ;
  }

  ThemeData get getTheme => _selectTheme;
  Future<void> changeTheme()async{
    pref = await SharedPreferences.getInstance();

    if(_selectTheme == darkTheme)
      {
        _selectTheme = lightTheme ;
        await pref.setBool("isDark", false);
      }else{
      _selectTheme = darkTheme ;
      await pref.setBool("isDark", true);
    }
    notifyListeners();

  }


}