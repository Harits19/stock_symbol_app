import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stock_symbol_app/provider/stock_provider.dart';
import 'package:stock_symbol_app/stock/views/stock_view.dart';

class WatchPage extends StatefulWidget {
  const WatchPage({Key? key}) : super(key: key);

  @override
  _WatchPageState createState() => _WatchPageState();
}

class _WatchPageState extends State<WatchPage> {
  @override
  Widget build(BuildContext context) {
    final stockWatch = context.watch<StockProvider>();
    final stockRead = context.read<StockProvider>();

    return Scaffold(
      body: SafeArea(
        child: ReorderableListView(
          onReorder: (int oldIndex, int newIndex) {
            setState(() {
              if (oldIndex < newIndex) {
                newIndex -= 1;
              }
              final item = stockRead.listWatchedStock.removeAt(oldIndex);
              stockRead.listWatchedStock.insert(newIndex, item);
            });
          },
          children: [
            ...stockWatch.listWatchedStock.map(
              (e) => StockView(
                key: Key(e.symbol!),
                text: e.symbol,
              ),
            )
          ],
        ),
      ),
    );
  }
}
