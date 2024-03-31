import 'dart:math';

String generateRandomId({int length = 20}) {
  const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
  final random = Random();
  return String.fromCharCodes(
    Iterable.generate(length, (_) => chars.codeUnitAt(random.nextInt(chars.length))),
  );
}