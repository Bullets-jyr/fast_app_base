import 'package:fast_app_base/screen/main/tab/stock/stock_percentage_data_provider.dart';
import 'package:fast_app_base/screen/main/tab/stock/vo_simple_stock.dart';

class PopularStock extends SimpleStock with StockPercentageDataProvider {
  // final String name;
  @override
  final int yesterdayClosePrice;
  @override
  final int currentPrice;

  PopularStock({
    // this.name,
    required this.yesterdayClosePrice,
    required this.currentPrice,
    required String stockName,
  }): super(stockName);
}
