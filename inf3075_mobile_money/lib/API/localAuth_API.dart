import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

class LocalAuthApi {
  static final _auth = LocalAuthentication();
  static Future<bool> hasBiometrics() async {
    return await _auth.canCheckBiometrics;
  }

  static Future<bool?> authenticate() async {
    final isAvailable = await hasBiometrics();

    if (!isAvailable) return false;

    try {
      return await _auth.authenticate(
        localizedReason: "Scan Fingerprint to login",
      
      );
    } on PlatformException catch (e) {
      // ignore: avoid_print
      print(e);
      return false;
    }
  }
}
