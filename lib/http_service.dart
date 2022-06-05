import 'package:bookshelf_ui/models/user.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class HttpService {
  static final Future<SharedPreferences> _prefs =
      SharedPreferences.getInstance();
  HttpService() {}

  setToken(var value) async {
    final SharedPreferences prefs = await _prefs;
    bool result = await prefs.setString('token', value);
    if (result) print('token saved');
  }

  loginUser(email, pass) async {
    var url = Uri.parse('http://10.0.2.2:8001/login');
    // var url = Uri.parse('http://localhost:8001/login');
    var response = await post(url, body: {'email': email, 'password': pass});
    print('Response status: ${response.statusCode}');
    print('Response body login: ${response.body}');
    dynamic res = jsonDecode(response.body);
    print('Res: ${res['token']}');
    // setToken(res['token']);
    setToken(email);
    return response;
  }

  Future<User> getUser(Uri url, Object body) async {
    Response res = await post(url, body: body);
    if (res.statusCode == 200) {
      var body = jsonDecode(res.body);
      dynamic _user = User.fromJson(body);
      return _user;
    } else {
      throw "Unable to get user.";
    }
  }

  Future<int> logOut() async {
    var url = Uri.parse('http://10.0.2.2:8001/logout');
    // var url = Uri.parse('http://localhost:8001/logout');
    var response = await post(url, body: {});
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    setToken('null');
    return response.statusCode;
  }

  Future<int> deleteUser(String email) async {
    var url = Uri.parse('http://10.0.2.2:8001/deleteUser');
    // var url = Uri.parse('http://localhost:8001/deleteUser');
    var response = await post(url, body: {'email': email});
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    return response.statusCode;
  }
}
