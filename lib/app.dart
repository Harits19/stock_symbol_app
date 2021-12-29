import 'package:flutter/material.dart';
import 'package:stock_symbol_app/login/views/login_page.dart';
import 'package:provider/provider.dart';
import 'package:stock_symbol_app/provider/login_provider.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginRead = context.read<LoginProvider>();
    return const MaterialApp(
      home: LoginPage(),
    );
  }
}
