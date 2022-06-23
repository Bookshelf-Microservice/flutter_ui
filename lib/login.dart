import 'package:bookshelf_ui/home.dart';
import 'package:bookshelf_ui/http_service.dart';
import 'package:bookshelf_ui/signup.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _signInFormKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final HttpService _httpService = HttpService();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _signInFormKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null) {
                      return 'email should not be empty';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    hintText: "Email",
                    prefixIcon: Icon(Icons.email_outlined),
                  ),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  validator: (value) {
                    if (value != '') {
                      if (value!.length > 7) {
                        return null;
                      }
                      return 'Password should be min 8 chars';
                    } else {
                      return 'empty_field';
                    }
                  },
                  decoration: const InputDecoration(
                    hintText: "Password",
                    prefixIcon: Icon(Icons.lock_outlined),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  child: const Text("Login"),
                  onPressed: () async {
                    var response = await _httpService.loginUser(
                        _emailController.text, _passwordController.text);
                    if (response.statusCode == 200) {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                Home(userEmail: _emailController.text),
                          ),
                          (Route<dynamic> route) => false);
                    } else {
                      // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      //   content: Text('login failed'),
                      // ));
                      print('login failed');
                    }
                  },
                ),
                TextButton(
                  child: const Text('Sign Up'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUpPage()),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
