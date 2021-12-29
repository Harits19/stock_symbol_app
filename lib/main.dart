import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stock_symbol_app/app.dart';
import 'package:stock_symbol_app/login/views/login_page.dart';
import 'package:stock_symbol_app/provider/login_provider.dart';
import 'package:stock_symbol_app/provider/stock_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => LoginProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => StockProvider(),
        ),
      ],
      child: const App(),
    );
  }
}
