class Stock {
  String? currency;
  String? description;
  String? displaySymbol;
  String? figi;
  dynamic isin;
  String? mic;
  String? symbol;
  String? symbol2;
  String? type;

  Stock({
    this.currency,
    this.description,
    this.displaySymbol,
    this.figi,
    this.isin,
    this.mic,
    this.symbol,
    this.symbol2,
    this.type,
  });

  Stock.fromJson(Map<String, dynamic> json) {
    currency = json['currency'] as String?;
    description = json['description'] as String?;
    displaySymbol = json['displaySymbol'] as String?;
    figi = json['figi'] as String?;
    isin = json['isin'];
    mic = json['mic'] as String?;
    symbol = json['symbol'] as String?;
    symbol2 = json['symbol2'] as String?;
    type = json['type'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['currency'] = currency;
    json['description'] = description;
    json['displaySymbol'] = displaySymbol;
    json['figi'] = figi;
    json['isin'] = isin;
    json['mic'] = mic;
    json['symbol'] = symbol;
    json['symbol2'] = symbol2;
    json['type'] = type;
    return json;
  }
}
