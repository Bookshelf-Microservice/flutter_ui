import 'package:bookshelf_ui/models/user.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class UserHttpService {
  static final Future<SharedPreferences> _prefs =
      SharedPreferences.getInstance();
  UserHttpService() {}

  setToken(var value) async {
    final SharedPreferences prefs = await _prefs;
    bool result = await prefs.setString('token', value);
    if (result) print('token saved');
  }

  loginUser(email, pass) async {
    var url = Uri.parse('http://localhost:8000/user/login');

    var response = await post(url, body: {'email': email, 'password': pass});
    print('Response status: ${response.statusCode}');
    if (response.statusCode >= 400) {
      return response;
    }
    setToken(email);
    return response;
  }

  signupUser(username, email, password) async {
    var url = Uri.parse('http://localhost:8000/user/signup');

    Response response = await post(url, headers: {
      'username': username,
      'email': email,
      'password': password,
      'role': 'user'
    });
    print('signupUser Response status: ${response.statusCode}');
    print('signupUser Response body: ${response.body}');
    return response;
  }

  Future<User?> getUser(String email) async {
    var url = Uri.parse('http://localhost:8000/user/get');

    print('içerde mi');
    Response res = await get(url, headers: {'email': email});
    print('Response statusCode: ${res.statusCode}');
    if (res.statusCode == 200) {
      var body = jsonDecode(res.body);
      dynamic _user = User.fromJson(body);
      return _user;
    } else {
      throw "Unable to get user.";
    }
  }

  Future<int> logOut() async {
    var url = Uri.parse('http://localhost:8000/user/logout');

    var response = await post(url, body: {});
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    setToken('null');
    return response.statusCode;
  }

  Future<int> deleteUser(String email) async {
    var url = Uri.parse('http://localhost:8000/user/delete');

    var response = await post(url, headers: {'email': email});
    print('Response status:/user/delete ${response.statusCode}');
    print('Response body:  /user/delete ${response.body}');
    setToken('null');
    return response.statusCode;
  }
}
