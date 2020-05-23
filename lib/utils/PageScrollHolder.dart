
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class PageScrollHolder extends ChangeNotifier {

  double _currentPage = 0.0;
  double _pagePosition = 0.0;

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
