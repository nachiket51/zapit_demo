import 'dart:typed_data';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:octo_image/octo_image.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';
import 'package:zapit_demo/controller/currencies_controller.dart';
import 'package:zapit_demo/models/currency_model.dart';
import 'package:zapit_demo/services/route_services.dart';
import 'package:zapit_demo/utils/enums.dart';
import 'package:zapit_demo/widgets/text_widget.dart';

class CurrencyTile extends StatelessWidget {
  final CurrencyModel currencyModel;

  const CurrencyTile({
    required this.currencyModel,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        /// currency click event
        AppRoutes.navigatePage(
          pageRoute: AppRoutes.CURRENCY_INFO_SCREEN_ROUTE,
          pageNav: PageNav.to,
          arguments: currencyModel,
        );
      },
      /// currency item UI
      child: Card(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50.h),
                    child: CachedNetworkImage(
                      placeholder: (context, url) =>
                          PlatformCircularProgressIndicator(),
                      imageUrl: currencyModel.image!,
                      errorWidget: (context, url, error) => Icon(Icons.error),
                      fit: BoxFit.cover,
                      height: 5.h,
                      width: 5.h,
                    ),
                  ),
                  SizedBox(width: 5.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(
                        text: currencyModel.symbol!.toUpperCase(),
                        textStyle: TextStyle(fontSize: 12.sp),
                        maxLines: 1,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 0.5.h),
                      TextWidget(
                        text: currencyModel.name!,
                        textStyle: TextStyle(fontSize: 8.sp),
                        maxLines: 1,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextWidget(
                    text: '\$${currencyModel.currentPrice!.toStringAsFixed(2)}',
                    textStyle: TextStyle(fontSize: 12.sp),
                    maxLines: 1,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 0.5.h),
                  Row(
                    children: [
                      Icon(
                        currencyModel.priceChangePercentage24h! > 0
                            ? Icons.arrow_upward_rounded
                            : Icons.arrow_downward_rounded,
                        size: 15.sp,
                        color: currencyModel.priceChangePercentage24h! > 0
                            ? Colors.green
                            : Colors.red,
                      ),
                      TextWidget(
                        text: currencyModel.priceChangePercentage24h!
                            .toStringAsFixed(1),
                        textStyle: TextStyle(
                          fontSize: 10.sp,
                          color: currencyModel.priceChangePercentage24h! > 0
                              ? Colors.green
                              : Colors.red,
                        ),
                        maxLines: 1,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
