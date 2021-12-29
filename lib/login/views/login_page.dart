import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stock_symbol_app/base/base_function.dart';
import 'package:stock_symbol_app/provider/login_provider.dart';
import 'package:stock_symbol_app/stock/views/main_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final loginRead = context.read<LoginProvider>();
    final loginWatch = context.watch<LoginProvider>();
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text("Login"),
          onPressed: () => loginRead.loginFacebook(
            onSuccess: () {
              pushReplace(context, MainPage());
            },
          ),
        ),
      ),
    );
  }
}
