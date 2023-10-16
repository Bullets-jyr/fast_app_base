import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/widget/w_image_button.dart';
import 'package:fast_app_base/screen/main/tab/stock/search/s_search_stock.dart';
import 'package:fast_app_base/screen/main/tab/stock/tab/f_my_stock.dart';
import 'package:fast_app_base/screen/main/tab/stock/tab/f_todays_discovery.dart';
import 'package:flutter/material.dart';

class StockFragment extends StatefulWidget {
  const StockFragment({super.key});

  @override
  State<StockFragment> createState() => _StockFragmentState();
}

class _StockFragmentState extends State<StockFragment>
    with SingleTickerProviderStateMixin {
  // final: TabController는 화면에 한번만 초기화가되면 그 다음에는 초기화할 일이 없습니다. 그래서 final 키워드를 사용하였습니다.
  // 이 상태에서 late 키워드를 넣어줍니다.
  // late: TabController가 필요한 시점에 초기화가 됩니다.
  // 이 방법은 TabController를 nullable로 만들고 initState에서 초기화 시켜주는 코드를 대체할 수 있습니다.
  late final tabController = TabController(length: 2, vsync: this);
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: context.appColors.roundedLayoutBackground,
          // 앱바 상단 고정
          pinned: true,
          actions: [
            ImageButton(
              onTap: () {
                // context.showSnackbar('검색');
                Nav.push(SearchStockScreen());
              },
              imagePath: '$basePath/icon/stock_search.png',
            ),
            ImageButton(
              onTap: () {
                context.showSnackbar('캘린더');
              },
              imagePath: '$basePath/icon/stock_calendar.png',
            ),
            ImageButton(
              onTap: () {
                context.showSnackbar('설정');
              },
              imagePath: '$basePath/icon/stock_settings.png',
            ),
          ],
        ),
        SliverToBoxAdapter(
          child: Column(
            children: [
              title,
              tabBar,
              if (currentIndex == 0)
                MyStockFragment()
              else
                TodaysDiscoveryFragment(),
            ],
          ),
        ),
      ],
    );
  }

  Widget get title => Container(
        color: context.appColors.roundedLayoutBackground,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            '토스증권'.text.size(24).bold.make(),
            width20,
            'S&P 500'
                .text
                .size(13)
                .bold
                .color(context.appColors.lessImportant)
                .make(),
            width10,
            3919.29
                .toComma()
                .toString()
                .text
                .size(13)
                .bold
                .color(context.appColors.plus)
                .make(),
          ],
        ).pOnly(left: 20),
      );

  Widget get tabBar => Container(
        color: context.appColors.roundedLayoutBackground,
        child: Column(
          children: [
            TabBar(
              onTap: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              labelStyle:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              labelPadding: const EdgeInsets.symmetric(vertical: 20),
              indicatorPadding: const EdgeInsets.symmetric(horizontal: 20),
              indicatorColor: Colors.white,
              controller: tabController,
              tabs: [
                '내 주식'.text.make(),
                '오늘의 발견'.text.make(),
              ],
            ),
            const Line(),
          ],
        ),
      );

  Widget get myAccount => Placeholder();

  Widget get myStocks => Placeholder();
}
