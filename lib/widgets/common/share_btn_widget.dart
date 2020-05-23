import 'package:flutter/material.dart';

class ShareBtnWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 30,
      right: 30,
      child: Icon(Icons.share),
    );
  }
}
