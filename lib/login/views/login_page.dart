import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stock_symbol_app/base/base_function.dart';
import 'package:stock_symbol_app/base/circular_view.dart';
import 'package:stock_symbol_app/provider/login_provider.dart';
import 'package:stock_symbol_app/stock/views/main_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();
    runInitState();
  }

  runInitState() async {
    WidgetsBinding.instance!.addPostFrameCallback(
      (timeStamp) {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => const CircularView(),
        );
      },
    );
    final loginRead = context.read<LoginProvider>();
    await loginRead.getFromStorage();
    Navigator.pop(context);
    toNextPage();
  }

  toNextPage() {
    pushReplace(context, const MainPage());
  }

  @override
  Widget build(BuildContext context) {
    final loginRead = context.read<LoginProvider>();
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: const Text("Login"),
          onPressed: () => loginRead.loginFacebook(
            onSuccess: toNextPage,
          ),
        ),
      ),
    );
  }
}
