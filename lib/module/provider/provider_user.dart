import 'package:app_sempro/dummy/model/user.dart';
import 'package:app_sempro/module/service/service_user.dart';
import 'package:flutter/material.dart';

class ProviderUser extends ChangeNotifier {
  user? _currentUser;
  bool _isLogin = false;
  String? _errorMessage;

  user? get currentUser => _currentUser;
  bool get isLogin => _isLogin;
  String? get errorMessage => _errorMessage;

  Future<void> login(String email, String pass) async {
    try {
      final user = await ServiceUser.login(email, pass);
      if (user != null) {
        _currentUser = user;
        _isLogin = true;
        _errorMessage = null;
        notifyListeners();
      } else {
        _isLogin = false;
        _errorMessage = 'Email atau password salah.';
        notifyListeners();
      }
    } catch (e) {
      _isLogin = false;
      _errorMessage = '${e.toString()}';
      notifyListeners();
    }
  }

  void logout() {
    //Logout function,
  }
}
