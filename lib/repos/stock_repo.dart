import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:stock_symbol_app/base/base_constanta.dart';
import 'package:stock_symbol_app/models/stock.dart';

class StockRepo {
  static const _domainName = "https://finnhub.io/api/v1";

  static getListStockSymbol({
    required ValueChanged<List<Stock>> onSuccess,
  }) async {
    try {
      final response = await Dio()
          .get('$_domainName/stock/symbol?exchange=JK&token=${KeyCons.apiKey}');
      if (response.data is List<dynamic>) {
        final result = (response.data as List<dynamic>)
            .map((e) => Stock.fromJson(e))
            .toList()
            .cast<Stock>();
        onSuccess(result);
      }
    } catch (e) {
      //
    }
  }

  static searchListStock({
    required ValueChanged<List<Stock>> onSuccess,
    required String query,
  }) async {
    if (query.isEmpty) {
      onSuccess([]);
      return;
    }
    try {
      final response = await Dio()
          .get('$_domainName/search?q=$query&token=${KeyCons.apiKey}');
      if (response.data["result"] is List<dynamic>) {
        final result = (response.data["result"] as List<dynamic>)
            .map((e) => Stock.fromJson(e))
            .toList()
            .cast<Stock>();

        onSuccess(result);
      }
    } catch (e) {
      // Î
    }
  }
}
