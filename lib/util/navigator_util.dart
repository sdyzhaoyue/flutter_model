import 'package:flutter/material.dart';

class NavigatorUtil {
  // 页面跳转
  static push(BuildContext context, Widget page) async {
    final result = await Navigator.push(context, MaterialPageRoute(builder: (context) => page));
    return result;
  }
}