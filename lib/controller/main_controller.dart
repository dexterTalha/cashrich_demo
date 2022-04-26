import 'package:cashrich_demo/model/bitcoin_model.dart';
import 'package:dio/dio.dart';
import 'package:dio/dio.dart' as re;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  static MainController instance = Get.find();
  static const String baseUrl = "https://pro-api.coinmarketcap.com/v1/cryptocurrency/quotes/latest?symbol=";
  static const String _header = "27ab17d1-215f-49e5-9ca4-afd48810c149";
  RxList<BitCoinModel> models = <BitCoinModel>[].obs;
  RxBool isLoading = true.obs;
  List<String> coins = <String>[].obs;
  List<double> prices = <double>[].obs;
  RxBool isList = true.obs;
  getData(String? symbols) async {
    models = <BitCoinModel>[].obs;
    coins = <String>[].obs;
    prices = <double>[].obs;
    isList = true.obs;
    update();
    try {
      symbols = symbols!.removeAllWhitespace.toUpperCase().trim();
      isLoading = true.obs;
      update();
      if (symbols.endsWith(",")) {
        symbols = symbols.substring(0, symbols.length - 1);
      }
      List<String> sym = symbols.split(",");
      coins = sym;
      if (sym.isEmpty) {
        getErrorSnackBarNew("No Symbol");
        return;
      }
      Dio dio = Dio();
      re.Response response = await dio.get(
        "$baseUrl$symbols",
        options: Options(headers: {
          "X-CMC_PRO_API_KEY": _header,
        }),
      );
      isLoading = false.obs;
      update();
      if (response.data['status']['error_code'] != 0) {
        getErrorSnackBarNew(response.data['status']['error_message']!);
        return;
      }
      var data = response.data['data'];
      for (String key in sym) {
        BitCoinModel m = BitCoinModel.fromJson(data[key]);
        prices.add(m.quote!.uSD!.percentChange24h);

        models.add(m);
      }
      update();
      // BitCoinModel model = BitCoinModel.fromJson(response.data['data']);
      // print(model);
    } catch (e) {
      isLoading = false.obs;
      update();
      Get.back();
      getErrorSnackBarNew("Error: Please try again with valid Symbols");
      e.printError();
    }
  }

  updateShowPage() {
    bool l = !isList.value;
    isList = l.obs;
    print(isList);
    update();
  }

  getErrorSnackBarNew(String message) {
    Get.snackbar(
      "Error",
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
      colorText: Colors.white,
      borderRadius: 10,
      margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
    );
  }
}
