import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stock_symbol_app/ui/views/circular_view.dart';
import 'package:stock_symbol_app/ui/stock/views/stock_view.dart';
import 'package:stock_symbol_app/provider/stock_provider.dart';
import 'package:stock_symbol_app/models/stock.dart';

class StockPage extends StatefulWidget {
  const StockPage({Key? key}) : super(key: key);

  @override
  _StockPageState createState() => _StockPageState();
}

class _StockPageState extends State<StockPage> {
  List<Stock> searchList = [];
  String query = "";

  @override
  void initState() {
    super.initState();
    runInitState();
  }

  runInitState() async {
    final stockRead = context.read<StockProvider>();
    if (stockRead.listStock.isNotEmpty) return;

    WidgetsBinding.instance!.addPostFrameCallback(
      (timeStamp) {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => const CircularView(),
        );
      },
    );
    await stockRead.getListStock();
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final stockWatch = context.watch<StockProvider>();
    final stockRead = context.read<StockProvider>();
    final showList = query.isNotEmpty ? searchList : stockWatch.listStock;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (val) async {
                  query = val;
                  await stockRead.searchListStock(
                    onSuccess: (result) {
                      searchList = result;
                    },
                    query: val,
                  );
                  setState(() {});
                },
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  ...showList.map(
                    (stock) {
                      final isWatched = stockWatch.listWatchedStock.any(
                        (watchedStock) => watchedStock.symbol == stock.symbol,
                      );
                      return StockView(
                        text: stock.symbol,
                        isWatched: isWatched,
                        onTap: () {
                          if (!isWatched) {
                            stockRead.addWatchedStock(stock);
                          } else {
                            stockRead.removeWatchedStock(stock);
                          }
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
