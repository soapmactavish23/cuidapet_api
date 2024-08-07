import 'dart:convert';
import 'package:crypto/crypto.dart';

class CriptHelper {
  CriptHelper._();

  static String generateSha256Hash(String password) {
    final bytes = utf8.encode(password);
    return sha256.convert(bytes).toString();
  }
}
