import 'package:bookshelf_ui/profile.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  String userEmail;

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
        child: Text('Ana sayfa'),
      ),
    );
  }
}
