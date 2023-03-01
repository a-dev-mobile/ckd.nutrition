import 'package:logger/logger.dart';

// ignore: prefer-static-class
final Logger logger = Logger(
  printer: PrettyPrinter(),
);

// ignore: prefer-static-class
final Logger log = Logger(
  printer: PrettyPrinter(
    printEmojis: false,
    methodCount: 0,

  ),
);
