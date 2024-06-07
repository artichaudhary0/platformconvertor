

import 'package:flutter/foundation.dart';

class NavigatorProvider extends ChangeNotifier{
  int _index = 0 ;
  int get index => _index;

  void changeValue(int value)
  {
    _index = value ;
    print(_index);
    notifyListeners();
  }


}