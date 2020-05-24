
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class PageScrollHolder extends ChangeNotifier {

  double _currentPage;
  double _pagePosition;

  PageScrollHolder(PageController controller) {

    controller.addListener(() {
      _currentPage = controller.page;
      _pagePosition = controller.offset;
      notifyListeners();
    });
  }

  double get currentPage => _currentPage;
  double get pagePosition => _pagePosition;
}
