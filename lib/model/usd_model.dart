class USD {
  dynamic price;
  dynamic volume24h;
  dynamic volumeChange24h;
  dynamic percentChange1h;
  dynamic percentChange24h;
  dynamic percentChange7d;
  dynamic percentChange30d;
  dynamic percentChange60d;
  dynamic percentChange90d;
  dynamic marketCap;
  dynamic marketCapDominance;
  dynamic fullyDilutedMarketCap;
  String? lastUpdated;

  USD(
      {dynamic price,
      dynamic volume24h,
      dynamic volumeChange24h,
      dynamic percentChange1h,
      dynamic percentChange24h,
      dynamic percentChange7d,
      dynamic percentChange30d,
      dynamic percentChange60d,
      dynamic percentChange90d,
      dynamic marketCap,
      dynamic marketCapDominance,
      dynamic fullyDilutedMarketCap,
      String? lastUpdated}) {
    price = price;

    volume24h = volume24h;

    volumeChange24h = volumeChange24h;

    percentChange1h = percentChange1h;

    percentChange24h = percentChange24h;

    percentChange7d = percentChange7d;

    percentChange30d = percentChange30d;

    percentChange60d = percentChange60d;

    percentChange90d = percentChange90d;

    marketCap = marketCap;

    marketCapDominance = marketCapDominance;

    fullyDilutedMarketCap = fullyDilutedMarketCap;

    lastUpdated = lastUpdated;
  }

  USD.fromJson(Map<String, dynamic> json) {
    price = json['price'];
    volume24h = json['volume_24h'];
    volumeChange24h = json['volume_change_24h'];
    percentChange1h = json['percent_change_1h'];
    percentChange24h = json['percent_change_24h'];
    percentChange7d = json['percent_change_7d'];
    percentChange30d = json['percent_change_30d'];
    percentChange60d = json['percent_change_60d'];
    percentChange90d = json['percent_change_90d'];
    marketCap = json['market_cap'];
    marketCapDominance = json['market_cap_dominance'];
    fullyDilutedMarketCap = json['fully_diluted_market_cap'];
    lastUpdated = json['last_updated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['price'] = price;
    data['volume_24h'] = volume24h;
    data['volume_change_24h'] = volumeChange24h;
    data['percent_change_1h'] = percentChange1h;
    data['percent_change_24h'] = percentChange24h;
    data['percent_change_7d'] = percentChange7d;
    data['percent_change_30d'] = percentChange30d;
    data['percent_change_60d'] = percentChange60d;
    data['percent_change_90d'] = percentChange90d;
    data['market_cap'] = marketCap;
    data['market_cap_dominance'] = marketCapDominance;
    data['fully_diluted_market_cap'] = fullyDilutedMarketCap;
    data['last_updated'] = lastUpdated;
    return data;
  }
}
