import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stock_symbol_app/ui/stock/stock_page.dart';
import 'package:stock_symbol_app/ui/stock/user_page.dart';
import 'package:stock_symbol_app/ui/stock/watch_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const [
        UserPage(),
        StockPage(),
        WatchPage(),
      ].elementAt(selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) {
          selectedIndex = index;
          setState(() {});
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.userAlt),
            label: "User",
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.moneyBillWave),
            label: "Stocks",
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.binoculars),
            label: "Watch",
          ),
        ],
      ),
    );
  }
}
