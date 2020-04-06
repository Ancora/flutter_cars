import 'package:flutter/material.dart';

push(BuildContext context, Widget page, {bool replace = false}) {
  if (replace) {
    return Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) {
          return page;
        },
      ),
    );
  }
  return Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) {
        return page;
      },
    ),
  );
}

bool pop<T extends Object>(BuildContext context, [T result]) {
  if (Navigator.canPop(context)) {
    Navigator.pop(context);
    return true;
  }
  return false;
}
