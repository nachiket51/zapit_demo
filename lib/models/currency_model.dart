/// id : "bitcoin"
/// symbol : "btc"
/// name : "Bitcoin"
/// image : "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579"
/// current_price : 47770
/// market_cap : 900023167472
/// market_cap_rank : 1
/// fully_diluted_valuation : 1003520168772
/// total_volume : 25205156910
/// high_24h : 49404
/// low_24h : 47444
/// price_change_24h : -389.377936988662
/// price_change_percentage_24h : -0.80851
/// market_cap_change_24h : -6146729343.155273
/// market_cap_change_percentage_24h : -0.67832
/// circulating_supply : 18834187.0
/// total_supply : 21000000.0
/// max_supply : 21000000.0
/// ath : 64805
/// ath_change_percentage : -26.18612
/// ath_date : "2021-04-14T11:54:46.763Z"
/// atl : 67.81
/// atl_change_percentage : 70443.55591
/// atl_date : "2013-07-06T00:00:00.000Z"
/// roi : null
/// last_updated : "2021-10-04T07:07:35.498Z"
/// sparkline_in_7d : {"price":[44136.446181911735,43882.536137861796,43868.71407724252,43912.214256829015,43677.96800249918,43890.93595888363,43885.59033202141,43755.77136448309,43580.701018014915,43218.74528102141,43333.76073850151,43035.04085986516,43165.68073534712,43088.97385196606,43145.90577483138,42837.08386156408,43199.53375569697,43312.48958006078,42247.355729006355,42373.8664733425,42586.9317187335,42465.98359070598,42689.76255129124,42735.86577387654,42482.51757504164,42309.728165879606,41841.07809270763,41829.57624783148,42047.31086935299,41943.493481438956,42143.92782447996,41929.49006282776,42154.001146840994,41669.462613901844,41581.508090169904,41305.53998000157,41496.72003987479,41761.556115579966,41586.0279658699,41902.98469266949,41910.23806924157,41754.661951120484,41002.93401404471,41768.71970928961,41536.57468200135,41876.58805473199,42309.354527304415,42346.884858508274,42422.27097332249,42426.575961093346,42590.87653476375,42507.92972226346,42378.51213510564,42560.12187109053,42520.29931588971,42133.789242407765,42225.34909982076,42322.15338659268,41745.724733104624,41611.297405644655,41246.0865803338,41353.694888288104,41313.87205861029,41252.22943860389,41352.68241016546,41537.90878590001,41680.50140291387,42487.53625468928,43109.120350162084,43263.473020075064,43615.75845419041,43554.00559755403,43604.19302556131,43542.50686641782,43368.454032502224,43083.617217616804,43125.61092467598,43009.10388472775,43082.88084448121,43594.69676279027,43321.115216795144,43072.11476230965,43031.06345046578,43044.95575280229,43515.44260488548,44160.400900686334,43664.03250224537,43429.26475291727,43863.564941828015,43851.27298080733,43859.32614724109,43826.7787912436,43809.14142835263,43423.91670029305,43609.43970546895,43647.931275569164,43940.108688410335,44097.63325505293,44879.20383799006,45000.01952580314,44970.86165638468,47572.92966075495,47600.68697024634,47271.170444551055,47176.51095094084,47030.86256089408,47340.337056571654,47569.78272189616,47731.30259988963,47815.88388721625,48006.95048741709,48080.04804970277,48383.330678746366,48084.32685482567,48181.87627260008,47844.131646883616,47852.61537836152,47814.76120872627,47593.596837802856,47699.29947068628,47701.02244133221,47823.173178964505,47886.48327296254,47731.95320196787,47792.008878144894,47723.97624529692,47813.85652759501,47836.17670172877,48034.09429062591,48172.78336308354,47997.20044641973,48101.940493612354,47966.612883133195,47963.269499733186,48230.32803591043,48160.43528555355,48272.45150327965,48222.55122867926,47862.63317597535,47361.10057553545,47698.5902969278,47696.34812033388,48004.992526129674,48028.88695003132,48102.59126951489,48115.34946118047,47974.37087127018,47976.90712925155,47912.36980008099,47895.10355723551,48062.00110800723,48112.20279575583,48065.88693679262,48051.37481812014,47992.3604439778,48121.86020714845,49167.26133528046,48844.60557877188,48842.92408615203,48679.382134571795,47929.256898435306,48004.647172633304,48282.97113857447,48052.90422391757,47867.56814097405,47808.09097671579,47614.695742642965,47884.673190847614]}

class CurrencyModel {
  String? _id;
  String? _symbol;
  String? _name;
  String? _image;
  dynamic _currentPrice;
  int? _marketCap;
  int? _marketCapRank;
  int? _fullyDilutedValuation;
  dynamic _totalVolume;
  dynamic _high24h;
  dynamic _low24h;
  double? _priceChange24h;
  double? _priceChangePercentage24h;
  dynamic _marketCapChange24h;
  double? _marketCapChangePercentage24h;
  double? _circulatingSupply;
  double? _totalSupply;
  double? _maxSupply;
  dynamic _ath;
  double? _athChangePercentage;
  String? _athDate;
  double? _atl;
  double? _atlChangePercentage;
  String? _atlDate;
  dynamic _roi;
  String? _lastUpdated;
  Sparklines? _sparklines;

  String? get id => _id;

  String? get symbol => _symbol;

  String? get name => _name;

  String? get image => _image;

  dynamic get currentPrice => _currentPrice;

  int? get marketCap => _marketCap;

  int? get marketCapRank => _marketCapRank;

  int? get fullyDilutedValuation => _fullyDilutedValuation;

  dynamic get totalVolume => _totalVolume;

  dynamic get high24h => _high24h;

  dynamic get low24h => _low24h;

  double? get priceChange24h => _priceChange24h;

  double? get priceChangePercentage24h => _priceChangePercentage24h;

  dynamic get marketCapChange24h => _marketCapChange24h;

  double? get marketCapChangePercentage24h => _marketCapChangePercentage24h;

  double? get circulatingSupply => _circulatingSupply;

  double? get totalSupply => _totalSupply;

  double? get maxSupply => _maxSupply;

  dynamic get ath => _ath;

  double? get athChangePercentage => _athChangePercentage;

  String? get athDate => _athDate;

  double? get atl => _atl;

  double? get atlChangePercentage => _atlChangePercentage;

  String? get atlDate => _atlDate;

  dynamic get roi => _roi;

  String? get lastUpdated => _lastUpdated;

  Sparklines? get sparklines => _sparklines;

  CurrencyModel(
      {String? id,
      String? symbol,
      String? name,
      String? image,
      dynamic currentPrice,
      int? marketCap,
      int? marketCapRank,
      int? fullyDilutedValuation,
      dynamic totalVolume,
      dynamic high24h,
      dynamic low24h,
      double? priceChange24h,
      double? priceChangePercentage24h,
      dynamic marketCapChange24h,
      double? marketCapChangePercentage24h,
      double? circulatingSupply,
      double? totalSupply,
      double? maxSupply,
      dynamic ath,
      double? athChangePercentage,
      String? athDate,
      double? atl,
      double? atlChangePercentage,
      String? atlDate,
      dynamic roi,
      String? lastUpdated,
        Sparklines? sparklines}) {
    _id = id;
    _symbol = symbol;
    _name = name;
    _image = image;
    _currentPrice = currentPrice;
    _marketCap = marketCap;
    _marketCapRank = marketCapRank;
    _fullyDilutedValuation = fullyDilutedValuation;
    _totalVolume = totalVolume;
    _high24h = high24h;
    _low24h = low24h;
    _priceChange24h = priceChange24h;
    _priceChangePercentage24h = priceChangePercentage24h;
    _marketCapChange24h = marketCapChange24h;
    _marketCapChangePercentage24h = marketCapChangePercentage24h;
    _circulatingSupply = circulatingSupply;
    _totalSupply = totalSupply;
    _maxSupply = maxSupply;
    _ath = ath;
    _athChangePercentage = athChangePercentage;
    _athDate = athDate;
    _atl = atl;
    _atlChangePercentage = atlChangePercentage;
    _atlDate = atlDate;
    _roi = roi;
    _lastUpdated = lastUpdated;
    _sparklines = sparklines;
  }

  CurrencyModel.fromJson(dynamic json) {
    _id = json['id'];
    _symbol = json['symbol'];
    _name = json['name'];
    _image = json['image'];
    _currentPrice = json['current_price'];
    _marketCap = json['market_cap'];
    _marketCapRank = json['market_cap_rank'];
    _fullyDilutedValuation = json['fully_diluted_valuation'];
    _totalVolume = json['total_volume'];
    _high24h = json['high_24h'];
    _low24h = json['low_24h'];
    _priceChange24h = json['price_change_24h'];
    _priceChangePercentage24h = json['price_change_percentage_24h'];
    _marketCapChange24h = json['market_cap_change_24h'];
    _marketCapChangePercentage24h = json['market_cap_change_percentage_24h'];
    _circulatingSupply = json['circulating_supply'];
    _totalSupply = json['total_supply'];
    _maxSupply = json['max_supply'];
    _ath = json['ath'];
    _athChangePercentage = json['ath_change_percentage'];
    _athDate = json['ath_date'];
    _atl = json['atl'];
    _atlChangePercentage = json['atl_change_percentage'];
    _atlDate = json['atl_date'];
    _roi = json['roi'];
    _lastUpdated = json['last_updated'];
    _sparklines = json['sparkline_in_7d'] != null
        ? Sparklines.fromJson(json['sparkline_in_7d'])
        : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = _id;
    map['symbol'] = _symbol;
    map['name'] = _name;
    map['image'] = _image;
    map['current_price'] = _currentPrice;
    map['market_cap'] = _marketCap;
    map['market_cap_rank'] = _marketCapRank;
    map['fully_diluted_valuation'] = _fullyDilutedValuation;
    map['total_volume'] = _totalVolume;
    map['high_24h'] = _high24h;
    map['low_24h'] = _low24h;
    map['price_change_24h'] = _priceChange24h;
    map['price_change_percentage_24h'] = _priceChangePercentage24h;
    map['market_cap_change_24h'] = _marketCapChange24h;
    map['market_cap_change_percentage_24h'] = _marketCapChangePercentage24h;
    map['circulating_supply'] = _circulatingSupply;
    map['total_supply'] = _totalSupply;
    map['max_supply'] = _maxSupply;
    map['ath'] = _ath;
    map['ath_change_percentage'] = _athChangePercentage;
    map['ath_date'] = _athDate;
    map['atl'] = _atl;
    map['atl_change_percentage'] = _atlChangePercentage;
    map['atl_date'] = _atlDate;
    map['roi'] = _roi;
    map['last_updated'] = _lastUpdated;
    if (_sparklines != null) {
      map['sparkline_in_7d'] = _sparklines?.toJson();
    }
    return map;
  }
}

/// price : [44136.446181911735,43882.536137861796,43868.71407724252,43912.214256829015,43677.96800249918,43890.93595888363,43885.59033202141,43755.77136448309,43580.701018014915,43218.74528102141,43333.76073850151,43035.04085986516,43165.68073534712,43088.97385196606,43145.90577483138,42837.08386156408,43199.53375569697,43312.48958006078,42247.355729006355,42373.8664733425,42586.9317187335,42465.98359070598,42689.76255129124,42735.86577387654,42482.51757504164,42309.728165879606,41841.07809270763,41829.57624783148,42047.31086935299,41943.493481438956,42143.92782447996,41929.49006282776,42154.001146840994,41669.462613901844,41581.508090169904,41305.53998000157,41496.72003987479,41761.556115579966,41586.0279658699,41902.98469266949,41910.23806924157,41754.661951120484,41002.93401404471,41768.71970928961,41536.57468200135,41876.58805473199,42309.354527304415,42346.884858508274,42422.27097332249,42426.575961093346,42590.87653476375,42507.92972226346,42378.51213510564,42560.12187109053,42520.29931588971,42133.789242407765,42225.34909982076,42322.15338659268,41745.724733104624,41611.297405644655,41246.0865803338,41353.694888288104,41313.87205861029,41252.22943860389,41352.68241016546,41537.90878590001,41680.50140291387,42487.53625468928,43109.120350162084,43263.473020075064,43615.75845419041,43554.00559755403,43604.19302556131,43542.50686641782,43368.454032502224,43083.617217616804,43125.61092467598,43009.10388472775,43082.88084448121,43594.69676279027,43321.115216795144,43072.11476230965,43031.06345046578,43044.95575280229,43515.44260488548,44160.400900686334,43664.03250224537,43429.26475291727,43863.564941828015,43851.27298080733,43859.32614724109,43826.7787912436,43809.14142835263,43423.91670029305,43609.43970546895,43647.931275569164,43940.108688410335,44097.63325505293,44879.20383799006,45000.01952580314,44970.86165638468,47572.92966075495,47600.68697024634,47271.170444551055,47176.51095094084,47030.86256089408,47340.337056571654,47569.78272189616,47731.30259988963,47815.88388721625,48006.95048741709,48080.04804970277,48383.330678746366,48084.32685482567,48181.87627260008,47844.131646883616,47852.61537836152,47814.76120872627,47593.596837802856,47699.29947068628,47701.02244133221,47823.173178964505,47886.48327296254,47731.95320196787,47792.008878144894,47723.97624529692,47813.85652759501,47836.17670172877,48034.09429062591,48172.78336308354,47997.20044641973,48101.940493612354,47966.612883133195,47963.269499733186,48230.32803591043,48160.43528555355,48272.45150327965,48222.55122867926,47862.63317597535,47361.10057553545,47698.5902969278,47696.34812033388,48004.992526129674,48028.88695003132,48102.59126951489,48115.34946118047,47974.37087127018,47976.90712925155,47912.36980008099,47895.10355723551,48062.00110800723,48112.20279575583,48065.88693679262,48051.37481812014,47992.3604439778,48121.86020714845,49167.26133528046,48844.60557877188,48842.92408615203,48679.382134571795,47929.256898435306,48004.647172633304,48282.97113857447,48052.90422391757,47867.56814097405,47808.09097671579,47614.695742642965,47884.673190847614]

class Sparklines {
  List<double>? _price;

  List<double>? get price => _price;

  Sparklines({List<double>? price}) {
    _price = price;
  }

  Sparklines.fromJson(dynamic json) {
    _price = json['price'] != null ? json['price'].cast<double>() : [];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['price'] = _price;
    return map;
  }
}
