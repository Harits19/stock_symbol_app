import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stock_symbol_app/login/views/login_page.dart';
import 'package:stock_symbol_app/provider/login_provider.dart';
import 'package:stock_symbol_app/stock/views/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LoginProvider(),
      child: MaterialApp(
        home: LoginPage(),
      ),
    );
  }
}
