import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:get/get.dart';
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
    _currenciesController.fetch();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (_currenciesController.isScreenLoading.isTrue) {
        return PlatformScaffold(
          body: Center(child: PlatformCircularProgressIndicator()),
        );
      }
      return PlatformScaffold(
          appBar: PlatformAppBar(
            title: const TextWidget(
              text: CURRENCIES_APP_BAR_TITLE,
            ),
          ),
          body: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 3.w),
            itemCount: _currenciesController.currencies.length,
            itemBuilder: (context, index) => CurrencyTile(
              currencyModel: _currenciesController.currencies[index],
            ),
            separatorBuilder: (context, index) => SizedBox(height: 1.h),
          ) /*GridView.builder(
          itemCount: _currenciesController.currencies.length,
          padding: EdgeInsets.symmetric(horizontal: 2.h),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 4.h,
            mainAxisSpacing: 0.5.h,
          ),
          itemBuilder: (BuildContext context, int index) {
            return CurrencyTile(
              currencyModel: _currenciesController.currencies[index],
            );
          },
        ),*/
          );
    });
  }
}
