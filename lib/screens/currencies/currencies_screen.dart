import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:get/get.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:sizer/sizer.dart';
import 'package:zapit_demo/controller/currencies_controller.dart';
import 'package:zapit_demo/screens/currencies/widgets/currency_tile.dart';
import 'package:zapit_demo/utils/app_texts.dart';
import 'package:zapit_demo/widgets/text_widget.dart';

class CurrenciesScreen extends StatefulWidget {
  const CurrenciesScreen({Key? key}) : super(key: key);

  @override
  State<CurrenciesScreen> createState() => _CurrenciesScreenState();
}

class _CurrenciesScreenState extends State<CurrenciesScreen> {
  final CurrenciesController _currenciesController =
      Get.put(CurrenciesController());

  @override
  void initState() {
    /// API REQUEST : fetch function
    _currenciesController.fetch();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      /// if work process is on
      if (_currenciesController.isScreenLoading.isTrue) {
        return PlatformScaffold(
          body: Center(child: PlatformCircularProgressIndicator()),
        );
      }

      /// if work process if off
      return PlatformScaffold(
        appBar: PlatformAppBar(
          title: const TextWidget(
            text: CURRENCIES_APP_BAR_TITLE,
          ),
        ),
        body: _currenciesController.currencies.isNotEmpty
            ? LazyLoadScrollView(
                /// end of scroll
                onEndOfPage: () => _currenciesController.loadMoreItems(),
                scrollOffset: 50,
                scrollDirection: Axis.vertical,
                isLoading: _currenciesController.lastPage,
                child: Stack(
                  children: [
                    ListView.separated(
                      padding: EdgeInsets.symmetric(horizontal: 3.w),
                      itemCount: _currenciesController.currencies.length,
                      itemBuilder: (context, index) => CurrencyTile(
                        currencyModel: _currenciesController.currencies[index],
                      ),
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 1.h),
                    ),

                    /// lazy loading
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: _currenciesController.lastPage == true
                          ? PlatformCircularProgressIndicator()
                          : const SizedBox(),
                    )
                  ],
                ),
              )

            /// empty list
            : const Center(
                child: TextWidget(
                  text: 'Sorry, No currencies is available at moment',
                  textStyle: TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
      );
    });
  }
}
