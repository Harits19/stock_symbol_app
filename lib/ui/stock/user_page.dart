import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stock_symbol_app/base/base_function.dart';
import 'package:stock_symbol_app/provider/login_provider.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    final loginWatch = context.watch<LoginProvider>();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("Name "),
                    Text("Username "),
                    Text("Email "),
                    Text("Last Login "),
                  ],
                ),
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(" : ${loginWatch.facebookUserData?.name} "),
                    Text(" : ${loginWatch.facebookUserData?.id} "),
                    Text(" : ${loginWatch.facebookUserData?.email} "),
                    Text(
                        " : ${(loginWatch.lastLogin == null) ? "" : dateTimeFormat.format(
                            loginWatch.lastLogin!,
                          )} "),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
