import 'package:app_sempro/dummy/data/user.dart';
import 'package:app_sempro/dummy/model/user.dart';

class ServiceUser {
  static Future<user?> login(String email, String pass) async {
    if (email.isEmpty || pass.isEmpty) {
      print('Email dan password tidak boleh kosong.');
      return null;
    }
    try {
      await Future.delayed(Duration(seconds: 1));
      final user = MockUser.firstWhere(
        (user) => user.email == email && user.pass == pass,
        orElse: null,
      );
      return user;
    } catch (e) {
      print('${e.toString()}');
      return null;
    }
  }
}