import 'package:flutter/material.dart';
import 'package:stock_symbol_app/repos/stock_repo.dart';
import 'package:stock_symbol_app/models/stock.dart';

class StockProvider extends ChangeNotifier {
  List<Stock> listStock = [];
  List<Stock> listWatchedStock = [];

  getListStock() async {
    await StockRepo.getListStockSymbol(
      onSuccess: (val) {
        listStock = val;
      },
    );
    notifyListeners();
  }

  searchListStock({
    required ValueChanged<List<Stock>> onSuccess,
    required String query,
  }) async {
    final result = listStock
        .where(
          (element) =>
              element.symbol!.toLowerCase().contains(query.toLowerCase()),
        )
        .toList();
    onSuccess(result);
  }

  addWatchedStock(Stock stock) {
    listWatchedStock.add(stock);
    notifyListeners();
  }

  removeWatchedStock(Stock stock) {
    listWatchedStock.removeWhere((element) => element.symbol == stock.symbol);
    notifyListeners();
  }
}
