import 'dart:math';
import 'package:intl/intl.dart';
class GeneratingFunctions {
  
  static String generateRandomId({int length = 20}) {
    const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
    final random = Random();
    return String.fromCharCodes(
      Iterable.generate(length, (_) => chars.codeUnitAt(random.nextInt(chars.length))),
    );
  }
  static String takeCurrentDate()
  {
    final now = DateTime.now();
    return (DateFormat('yyyy-MM-dd').format(now));
  }
}

