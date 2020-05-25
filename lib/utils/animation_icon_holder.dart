

import 'package:flutter/foundation.dart';

class AnimationIconHolder extends ChangeNotifier {

  String _arrowAnimationName;
  String _menuAnimationName;

  AnimationIconHolder();

  String get arrowAnimationName => _arrowAnimationName;
  String get menuAnimationName => _menuAnimationName;

  void animArrow(ArrowAnims name) {
    switch (name) {
      case ArrowAnims.UP_TO_DOWN:
        _arrowAnimationName = 'upToDown';
        break;
      case ArrowAnims.DOWN_TO_UP:
        _arrowAnimationName = 'downToUp';
        break;
    }
    notifyListeners();
  }

  void animMenu(MenuAnims name){
    switch(name){
      case MenuAnims.BACK_TO_MENU:
        _menuAnimationName = 'backtoMenu';
        break;
      case MenuAnims.MENU_TO_BACK:
        _menuAnimationName = 'menuToBack';
        break;
    }
    notifyListeners();
  }
}

enum ArrowAnims {
  UP_TO_DOWN,
  DOWN_TO_UP
}

enum MenuAnims {
  MENU_TO_BACK,
  BACK_TO_MENU
}
