import 'package:flutter/foundation.dart';

class AppConstants {
  static void print(String message) {
    if (kDebugMode) {
      debugPrint(message);
    }
  }
}
