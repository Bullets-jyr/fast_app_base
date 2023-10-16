import 'package:fast_app_base/common/common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 's_stock_detail.dart';
import 'search_stock_data.dart';

class SearchAutoCompleteList extends StatelessWidget with SearchStockDataProvider {
  // late final searchData = Get.find<SearchStockData>();
  final TextEditingController controller;

  SearchAutoCompleteList(this.controller, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final stock = searchData.autoCompleteList[index];
        final stockName = stock.name;
        return Tap(
          onTap: () {
            controller.clear();
            searchData.addHistory(stock);
            Nav.push(StockDetailScreen(stockName));
          },
          child: stockName.text.make().p(20),
        );
      },
      itemCount: searchData.autoCompleteList.length,
    );
  }
}
