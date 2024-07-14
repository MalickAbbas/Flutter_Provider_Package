import 'package:flutter/foundation.dart';

class Todo with ChangeNotifier {
  String title;
  bool isCompleted;

  Todo({
    required this.title,
    this.isCompleted = false,
  });

  void toggleCompleted() {
   isCompleted = !isCompleted;
    notifyListeners();
  }
}
