import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:zapit_demo/models/currency_model.dart';
import 'package:zapit_demo/screens/currency_info/widgets/chart.dart';
import 'package:zapit_demo/screens/currency_info/widgets/currency_details.dart';
import 'package:zapit_demo/screens/currency_info/widgets/currency_info_header.dart';
import 'package:zapit_demo/screens/currency_info/widgets/others.dart';
import 'package:zapit_demo/utils/app_texts.dart';
import 'package:zapit_demo/widgets/text_widget.dart';

class CurrencyInfoScreen extends StatefulWidget {
  const CurrencyInfoScreen({Key? key}) : super(key: key);

  @override
  State<CurrencyInfoScreen> createState() => _CurrencyInfoScreenState();
}

class _CurrencyInfoScreenState extends State<CurrencyInfoScreen> {
  CurrencyModel? _currencyModel;

  @override
  void initState() {
    /// get currency model via get_arguments
    _currencyModel = Get.arguments;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: const TextWidget(
          text: CURRENCY_INFO_APP_BAR_TITLE,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 4.w,
          vertical: 2.h,
        ),
        child: Column(
          children: [
            CurrencyInfoHeader(
              currencyModel: _currencyModel!,
            ),
            const Divider(),
            CurrencyDetails(
              currencyModel: _currencyModel!,
            ),
            SizedBox(height: 6.h),
            ChartWidget(pricesData: _currencyModel!.sparklines!.price!),
            SizedBox(height: 10.h),
            ExtraInfo(currencyModel: _currencyModel!),
          ],
        ),
      ),
    );
  }
}
