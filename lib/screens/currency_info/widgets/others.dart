import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:numeral/numeral.dart';
import 'package:sizer/sizer.dart';
import 'package:zapit_demo/models/currency_model.dart';
import 'package:zapit_demo/widgets/text_widget.dart';

class ExtraInfo extends StatelessWidget {
  final CurrencyModel currencyModel;

  const ExtraInfo({Key? key, required this.currencyModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextWidget(
              text: 'Change',
              textStyle: TextStyle(
                fontSize: 10.sp,
                fontWeight: FontWeight.normal,
                color: Color(0x70000000),
              ),
            ),
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
                          fontSize: 12.sp,
                          color: Colors.green,
                          fontWeight: FontWeight.w500,
                        ),
                        maxLines: 1,
                        maxWidth: 20.w,
                      ),
                    ],
                  )
                : Row(
                    children: [
                      Icon(
                        Icons.trending_down,
                        color: Colors.red,
                        size: 15.sp,
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
                        maxLines: 1,
                        maxWidth: 20.w,
                      ),
                    ],
                  ),
          ],
        ),
        Column(
          children: [
            TextWidget(
              text: 'High',
              textStyle: TextStyle(
                fontSize: 10.sp,
                fontWeight: FontWeight.normal,
                color: Color(0x70000000),
              ),
              maxLines: 1,
            ),
            TextWidget(
              text: '\$ ${currencyModel.high24h.toStringAsFixed(2)}',
              textStyle: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                color: Colors.green,
              ),
              maxLines: 1,
              maxWidth: 30.w,
            ),
          ],
        ),
        Column(
          children: [
            TextWidget(
              text: 'Low',
              textStyle: TextStyle(
                fontSize: 10.sp,
                fontWeight: FontWeight.normal,
                color: Color(0x70000000),
              ),
            ),
            TextWidget(
              text: '\$ ${currencyModel.low24h.toStringAsFixed(2)}',
              textStyle: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                color: Colors.red,
              ),
              maxLines: 1,
              maxWidth: 30.w,
            ),
          ],
        ),
        Column(
          children: [
            TextWidget(
              text: 'Volume',
              textStyle: TextStyle(
                fontSize: 10.sp,
                fontWeight: FontWeight.normal,
                color: Color(0x70000000),
              ),
            ),
            TextWidget(
              text: '\$ ${Numeral(currencyModel.totalVolume).value()}',
              textStyle: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
              maxLines: 1,
              maxWidth: 20.w,
            ),
          ],
        )
      ],
    );
  }
}
