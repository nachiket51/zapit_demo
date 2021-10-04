import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:octo_image/octo_image.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';
import 'package:zapit_demo/models/currency_model.dart';
import 'package:zapit_demo/services/route_services.dart';
import 'package:zapit_demo/utils/enums.dart';
import 'package:zapit_demo/widgets/text_widget.dart';

class CurrencyTile extends StatelessWidget {
  final CurrencyModel currencyModel;

  const CurrencyTile({Key? key, required this.currencyModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppRoutes.navigatePage(
          pageRoute: AppRoutes.CURRENCY_INFO_SCREEN_ROUTE,
          pageNav: PageNav.to,
          arguments: currencyModel,
        );
      },
      child: Card(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w,vertical: 2.h),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50.h),
                child: OctoImage(
                  image: NetworkImage(currencyModel.image!),
                  height: 5.h,
                  width: 5.h,
                  errorBuilder: (context, error, stackTrace) =>
                      Image.asset('assets/images/placeholder.jpeg'),
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
        ),
      ),
    );
  }
}
