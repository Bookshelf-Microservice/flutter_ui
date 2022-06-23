import 'package:bookshelf_ui/user_http_service.dart';
import 'package:bookshelf_ui/login.dart';
import 'package:bookshelf_ui/profile.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  String userEmail;
  final UserHttpService httpService = UserHttpService();

  Home({Key? key, required this.userEmail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Profile(
                    userEmail: userEmail,
                  ),
                ),
              );
            },
            icon: const Icon(Icons.person),
          ),
          IconButton(
            onPressed: () async {
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
            icon: const Icon(Icons.outbond),
          ),
        ],
      ),
      body: Center(
        child: Text('Ana sayfa'),
      ),
    );
  }
}
