import 'dart:io';

import 'package:bookshelf_ui/http_service.dart';
import 'package:bookshelf_ui/login.dart';
import 'package:bookshelf_ui/home.dart';
import 'package:bookshelf_ui/theme.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final HttpService _httpService = HttpService();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Online Bookshelf App',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      // home: LoginPage(),
      home: FutureBuilder(
          future: getToken(),
          builder: (context, snapshot) {
            var res = snapshot.data;
            return res == 'null' ? LoginPage() : Home(userEmail: res as String);
          }),
    );
  }

  Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    print('get token: $token');
    return token;
  }
}
