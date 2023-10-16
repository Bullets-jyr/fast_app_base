import 'package:fast_app_base/common/util/local_json.dart';
import 'package:get/get.dart';

import '../vo_simple_stock.dart';

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
}