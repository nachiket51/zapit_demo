import 'dart:convert';

import 'package:get/get.dart';
import 'package:zapit_demo/models/currency_model.dart';
import 'package:zapit_demo/services/http_services.dart';
import 'package:zapit_demo/utils/abstracts/api_request.dart';
import 'package:http/http.dart' as http;
import 'package:zapit_demo/utils/keys.dart';

class CurrenciesController extends GetxController implements ApiRequest {
  RxBool isScreenLoading = false.obs;
  RxList<dynamic> currencies = [].obs;

  Future<void> fetchAllCurrencies() async {
    CurrencyModel currencyModel = CurrencyModel();
    currencies.value = [];
    http.Response response = await HttpServices.get(
      command: PrimaryKeys.FETCH_CURRENCIES,
      params: {
        'vs_currency': 'usd',
        'order': 'market_cap_desc',
        'per_page': '100',
        'page': '1',
        'sparkline': 'true',
      },
    );

    if (response.statusCode == 200) {
      for (var i = 0; i < jsonDecode(response.body).length; i++) {
        currencyModel = CurrencyModel.fromJson(jsonDecode(response.body)[i]);
        currencies.add(currencyModel);
      }
      isScreenLoading(false);
    } else {
      isScreenLoading(false);
      throw response;
    }
  }

  @override
  Future<void> fetch() async {
    isScreenLoading(true);
    await fetchAllCurrencies();
  }

  @override
  Future<Map> toMap() {
    // TODO: implement toMap
    throw UnimplementedError();
  }

  createCurrenciesList(CurrencyModel currencyModel) {}

  @override
  void onInit() {
    fetch();
    super.onInit();
  }
}
