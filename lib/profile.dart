import 'dart:convert';

import 'package:bookshelf_ui/login.dart';
import 'package:flutter/material.dart';
import 'user_http_service.dart';

class Profile extends StatelessWidget {
  String userEmail;
  Profile({Key? key, required this.userEmail}) : super(key: key);
  final HttpService httpService = HttpService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FutureBuilder(
            future: httpService.getUser(userEmail),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                var user = snapshot.data;
                print('snapshot data: ${user}');
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Username: ${user.username}'),
                    const SizedBox(height: 20),
                    Text('User email: ${user.email}'),
                    const SizedBox(height: 48),
                    ElevatedButton(
                        onPressed: () async {
                          print('çıkış butonu');
                          var statusCode = await httpService.logOut();
                          if (statusCode == 200) {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginPage(),
                                ),
                                (Route<dynamic> route) => false);
                          }
                        },
                        child: const Text('Log Out')),
                    const SizedBox(height: 24),
                    TextButton(
                        onPressed: () async {
                          print('delete user butonu');
                          var statusCode =
                              await httpService.deleteUser(userEmail);
                          if (statusCode == 200) {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginPage(),
                                ),
                                (Route<dynamic> route) => false);
                          }
                        },
                        child: const Text(
                          'Delete Account',
                          style: TextStyle(color: Colors.red),
                        )),
                  ],
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ),
    );
  }
}
