import 'dart:convert';
import 'package:connectivity/connectivity.dart';
import 'package:get/get.dart';
import 'package:zapit_demo/models/currency_model.dart';
import 'package:zapit_demo/services/http_services.dart';
import 'package:zapit_demo/services/storage_services.dart';
import 'package:zapit_demo/utils/abstracts/api_request.dart';
import 'package:http/http.dart' as http;
import 'package:zapit_demo/utils/events_messager/log_message.dart';
import 'package:zapit_demo/utils/events_messager/toast_message.dart';
import 'package:zapit_demo/utils/keys.dart';

class CurrenciesController extends GetxController implements ApiRequest {
  RxBool isScreenLoading = false.obs;
  RxList<dynamic> currencies = [].obs;
  RxList<dynamic> image = [].obs;
  CurrencyModel currencyModel = CurrencyModel();
  RxList<dynamic> data = [].obs;

  /// lazy loading variables
  RxInt index = 1.obs;
  final _lastPage = false.obs;

  bool get lastPage => _lastPage.value;

  /// HTTP GET: fetch all currencies from API
  Future<CurrencyModel> fetchAllCurrencies() async {
    _lastPage(true);
    CurrencyModel currencyModel = CurrencyModel();
    http.Response response = await HttpServices.get(
      command: PrimaryKeys.FETCH_CURRENCIES,
      params: {
        'vs_currency': 'usd',
        'order': 'market_cap_desc',
        'per_page': '15',
        'page': '${index.value}',
        'sparkline': 'true',
      },
    );
    if (response.statusCode == 200) {
      StorageService.storeResponseCache(response, index.value);
      //await HttpServices.storeCache(response);
      for (var i = 0; i < jsonDecode(response.body).length; i++) {
        currencyModel = CurrencyModel.fromJson(jsonDecode(response.body)[i]);
        currencies.add(currencyModel);
      }
      isScreenLoading(false);
      _lastPage(false);
    } else {
      isScreenLoading(false);
      _lastPage(false);
      throw response;
    }
    return currencyModel;
  }

  /// API REQUEST: get method
  @override
  Future<CurrencyModel> fetch() async {
    isScreenLoading(true);
    var connectivityResult = await (Connectivity().checkConnectivity());
    if ((connectivityResult == ConnectivityResult.mobile) ||
        (connectivityResult == ConnectivityResult.wifi)) {
      /// if user have internet connection
      StorageService.removeResponseCache();
      currencies.value = [];
      await fetchAllCurrencies();
    } else {
      /// if user is offline
      showToast('No Internet Connection');
      CurrencyModel currencyModel = CurrencyModel();
      try {
        String jsonData = StorageService.fetchResponseCache(index.value);
        for (var i = 0; i < jsonDecode(jsonData).length; i++) {
          currencyModel = CurrencyModel.fromJson(jsonDecode(jsonData)[i]);
          currencies.add(currencyModel);
        }

        isScreenLoading(false);
      } catch (e) {
        normalLog(message: e.toString());
        isScreenLoading(false);
      }
    }
    return currencyModel;
  }

  /// Lazy-Loading function
  loadMoreItems() async {
    normalLog(message: 'lazy loading: load more items');
    index.value += 1;
    var connectivityResult = await (Connectivity().checkConnectivity());
    if ((connectivityResult == ConnectivityResult.mobile) ||
        (connectivityResult == ConnectivityResult.wifi)) {
      /// if user have internet connection
      await fetchAllCurrencies();
    } else {
      /// if user is offline
      loadItemsOffline();
    }
  }

  /// load more item from cache
  loadItemsOffline() {
    CurrencyModel currencyModel = CurrencyModel();
    try {
      String jsonData = StorageService.fetchResponseCache(index.value);
      for (var i = 0; i < jsonDecode(jsonData).length; i++) {
        currencyModel = CurrencyModel.fromJson(jsonDecode(jsonData)[i]);
        currencies.add(currencyModel);
      }
      _lastPage(false);
      isScreenLoading(false);
    } catch (e) {
      normalLog(message: e.toString());
      isScreenLoading(false);
    }
  }

  /// API REQUEST: map function
  @override
  Future<Map> toMap() {
    // TODO: implement toMap
    throw UnimplementedError();
  }
}
