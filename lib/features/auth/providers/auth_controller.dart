import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
  static const String _accessToken = 'Token';
  static const String _userName = "UserName";
  static const String _email = "Email";
  static const String _companyId = "ComId";

  static String?token;

  Future<void> saveAuthData({
    required String token,
    required String userName,
    required String email,
    required int companyId,
  }) async {
    AuthController.token=token;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_accessToken, token);
    await prefs.setString(_userName, userName);
    await prefs.setString(_email, email);
    await prefs.setInt(_companyId, companyId);
  }

  Future<String?> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? savedToken = prefs.getString(_accessToken);
    token=savedToken;
    return savedToken;
  }

  Future<bool> isLoggedIn() async {
    final String? token = await getToken();
    return token != null && token.isNotEmpty;
  }

  Future<void> loadAuthData()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    token=prefs.getString(_accessToken);
  }

  Future<void> clearAuthData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.remove(_accessToken);
    await prefs.remove(_userName);
    await prefs.remove(_email);
    await prefs.remove(_companyId);
  }
}
