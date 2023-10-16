import 'package:fast_app_base/common/util/local_json.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../vo_simple_stock.dart';

abstract mixin class SearchStockDataProvider {
  late final searchData = Get.find<SearchStockData>();
}

class SearchStockData extends GetxController {
  List<SimpleStock> stocks = [];
  // RxList: 동적으로 리스트가 변할 때 마다, 화면에 자동으로 그려주기 위한 GetX의 리스트
  RxList<String> searchHistoryList = <String>[].obs;
  RxList<SimpleStock> autoCompleteList = <SimpleStock>[].obs;

  @override
  void onInit() {
    searchHistoryList.addAll(['삼성전자', 'LG전자', '현대차', '넷플릭스']);
    loadLocalStockJson();
    super.onInit();
  }

  Future<void> loadLocalStockJson() async {
    final jsonList = await LocalJson.getObjectList<SimpleStock>("stock_list.json");
    stocks.addAll(jsonList);
  }

  void search(String keyword) {
    if (keyword.isEmpty) {
      autoCompleteList.clear();
      return;
    }
    autoCompleteList.value = stocks.where((element) => element.name.contains(keyword)).toList();

    // debugPrint(autoCompleteList.toString());
  }
  
  void addHistory(SimpleStock stock) {
    searchHistoryList.add(stock.name);
  }

  void removeHistory(String stockName) {
    // searchHistoryList.removeWhere((element) => element.id == stockName.id));
    searchHistoryList.remove(stockName);
  }
}