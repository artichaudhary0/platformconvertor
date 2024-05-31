

import 'package:flutter/foundation.dart';

class IncrementProvider extends ChangeNotifier{
  int _increment = 0 ;
  int get increment => _increment;


  void incrementValue()
  {
    _increment ++ ;
    notifyListeners();
  }
}