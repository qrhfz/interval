import 'package:flutter/material.dart';

extension NavigationExt on BuildContext {
  Future<T?> push<T>(Widget widget) async {
    return Navigator.of(this)
        .push<T>(MaterialPageRoute(builder: (_) => widget));
  }

  void pop<T>([T? result]) {
    Navigator.of(this).pop(result);
  }
}
