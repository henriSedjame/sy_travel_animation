

import 'package:flutter/foundation.dart';

class AnimationIconHolder extends ChangeNotifier {

  String _animationName;

  AnimationIconHolder();

  String get animationName => _animationName;

  void anim(ArrowAnims name) {
    switch (name) {
      case ArrowAnims.UP_TO_DOWN:
        _animationName = 'upToDown';
        break;
      case ArrowAnims.DOWN_TO_UP:
        _animationName = 'downToUp';
        break;
    }
    notifyListeners();
  }
}

enum ArrowAnims {
  UP_TO_DOWN,
  DOWN_TO_UP
}
