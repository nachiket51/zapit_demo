import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:numeral/numeral.dart';
import 'package:sizer/sizer.dart';
import 'package:zapit_demo/models/currency_model.dart';
import 'package:zapit_demo/widgets/text_widget.dart';

class CurrencyDetails extends StatelessWidget {
  final CurrencyModel currencyModel;

  const CurrencyDetails({Key? key, required this.currencyModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  TextWidget(
                    text: '\$ ',
                    textStyle: TextStyle(
                      fontSize: 15.sp,
                      color: const Color(0xff000000),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextWidget(
                    text: '${currencyModel.currentPrice!}',
                    textStyle: TextStyle(
                      fontSize: 25.sp,
                      color: const Color(0xff000000),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(width: 5.w),
                  currencyModel.priceChangePercentage24h! > 0
                      ? Row(
                          children: [
                            Icon(
                              Icons.trending_up,
                              color: Colors.green,
                              size: 15.sp,
                            ),
                            TextWidget(
                              text:
                                  '${currencyModel.priceChangePercentage24h!.toStringAsFixed(2)} %',
                              textStyle: TextStyle(
                                fontSize: 15.sp,
                                color: Colors.green,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        )
                      : Row(
                          children: [
                            Icon(
                              Icons.trending_down,
                              color: Colors.red,
                              size: 17.sp,
                            ),
                            SizedBox(width: 1.w),
                            TextWidget(
                              text:
                                  '${currencyModel.priceChangePercentage24h!.toStringAsFixed(2)} %',
                              textStyle: TextStyle(
                                fontSize: 12.sp,
                                color: Colors.red,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                ],
              ),
              Row(
                children: [
                  TextWidget(
                    text: '\$ ',
                    textStyle: TextStyle(
                      fontSize: 15.sp,
                      color: const Color(0xff000000),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextWidget(
                    text: Numeral(currencyModel.marketCap!).value()/*'${currencyModel.totalVolume!}'*/,
                    textStyle: TextStyle(
                      fontSize: 15.sp,
                      color: const Color(0xff000000),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  TextWidget(
                    text: currencyModel.symbol!.toUpperCase(),
                    textStyle: TextStyle(
                      fontSize: 10.sp,
                      color: const Color(0x83000000),
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  SizedBox(height: 3.h, child: const VerticalDivider()),
                  TextWidget(
                    text: 'USD',
                    textStyle: TextStyle(
                      fontSize: 10.sp,
                      color: const Color(0x83000000),
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
              TextWidget(
                text: 'Market car #${currencyModel.marketCapRank!}',
                textStyle: TextStyle(
                  fontSize: 10.sp,
                  color: const Color(0x83000000),
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
