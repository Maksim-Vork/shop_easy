import 'package:shared_preferences/shared_preferences.dart';

class AuthLocalTokenService {
  final SharedPreferences prefs;

  AuthLocalTokenService({required this.prefs});

  Future<String?> getToken() async {
    final token = prefs.getString('token');
    return token;
  }

  Future<void> saveToken(String token) async {
    prefs.setString('token', token);
  }

  Future<void> deletedToken() async {
    prefs.remove('token');
  }
}
