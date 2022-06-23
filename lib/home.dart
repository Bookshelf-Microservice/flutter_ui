import 'package:bookshelf_ui/book_page.dart';
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
        ],
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Go Books'),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BookPage(),
            ),
          ),
        ),
      ),
    );
  }
}
