import 'quote_model.dart';

class BitCoinModel {
  int? id;
  String? name;
  String? symbol;
  String? slug;
  dynamic numMarketPairs;
  String? dateAdded;
  List<String>? tags;
  dynamic maxSupply;
  dynamic circulatingSupply;
  dynamic totalSupply;
  dynamic isActive;
  String? platform;
  dynamic cmcRank;
  dynamic isFiat;
  String? selfReportedCirculatingSupply;
  String? selfReportedMarketCap;
  String? lastUpdated;
  Quote? quote;

  BitCoinModel(
      {int? id,
      String? name,
      String? symbol,
      String? slug,
      int? numMarketPairs,
      String? dateAdded,
      List<String>? tags,
      int? maxSupply,
      int? circulatingSupply,
      int? totalSupply,
      int? isActive,
      String? platform,
      int? cmcRank,
      int? isFiat,
      String? selfReportedCirculatingSupply,
      String? selfReportedMarketCap,
      String? lastUpdated,
      Quote? quote}) {
    id = id;

    name = name;

    symbol = symbol;

    slug = slug;

    numMarketPairs = numMarketPairs;

    dateAdded = dateAdded;

    tags = tags;

    maxSupply = maxSupply;

    circulatingSupply = circulatingSupply;

    totalSupply = totalSupply;

    isActive = isActive;

    cmcRank = cmcRank;

    isFiat = isFiat;

    lastUpdated = lastUpdated;

    quote = quote;
  }

  BitCoinModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    symbol = json['symbol'];
    slug = json['slug'];
    numMarketPairs = json['num_market_pairs'];
    dateAdded = json['date_added'];
    tags = json['tags'].cast<String>();
    maxSupply = json['max_supply'];
    circulatingSupply = json['circulating_supply'];
    totalSupply = json['total_supply'];
    isActive = json['is_active'];
    platform = json['platform'];
    cmcRank = json['cmc_rank'];
    isFiat = json['is_fiat'];
    selfReportedCirculatingSupply = json['self_reported_circulating_supply'];
    selfReportedMarketCap = json['self_reported_market_cap'];
    lastUpdated = json['last_updated'];
    quote = json['quote'] != null ? Quote.fromJson(json['quote']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['symbol'] = symbol;
    data['slug'] = slug;
    data['num_market_pairs'] = numMarketPairs;
    data['date_added'] = dateAdded;
    data['tags'] = tags;
    data['max_supply'] = maxSupply;
    data['circulating_supply'] = circulatingSupply;
    data['total_supply'] = totalSupply;
    data['is_active'] = isActive;
    data['platform'] = platform;
    data['cmc_rank'] = cmcRank;
    data['is_fiat'] = isFiat;
    data['self_reported_circulating_supply'] = selfReportedCirculatingSupply;
    data['self_reported_market_cap'] = selfReportedMarketCap;
    data['last_updated'] = lastUpdated;
    if (quote != null) {
      data['quote'] = quote!.toJson();
    }
    return data;
  }
}
