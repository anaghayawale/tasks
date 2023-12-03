import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class AuthProvider extends ChangeNotifier{
  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  void login(String email, String password) async {
    setLoading(true);
    try {
      http.Response response = await http.post(Uri.parse('https://reqres.in/api/login'),
          body: {'email': email, 'password': password});

      if (response.statusCode == 200) {
        print('successful');
        setLoading(false);
      } else {
        print('failed');
        setLoading(false);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  void signup(String name,String email,String password) async {
    setLoading(true);
    try {
      
    } catch (e) {
      print(e.toString());
    }
  }
}