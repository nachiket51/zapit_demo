import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:octo_image/octo_image.dart';
import 'package:sizer/sizer.dart';
import 'package:zapit_demo/models/currency_model.dart';
import 'package:zapit_demo/widgets/text_widget.dart';

class CurrencyInfoHeader extends StatelessWidget {
  final CurrencyModel currencyModel;

  const CurrencyInfoHeader({Key? key, required this.currencyModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius:BorderRadius.circular(50.h),
          child: CachedNetworkImage(
            placeholder: (context, url) => CircularProgressIndicator(),
            imageUrl: currencyModel.image!,
            errorWidget: (context, url, error) => Icon(Icons.error),
            fit: BoxFit.cover,
            height: 5.h,
            width: 5.h,
          ),
        ),
        /*OctoImage(
          image: NetworkImage(currencyModel.image!),
          height: 5.h,
          width: 5.h,
          errorBuilder: (context, error, stackTrace) => Image.asset(
            'assets/images/placeholder.jpeg',
          ),
        ),*/
        SizedBox(width: 3.w),
        TextWidget(
          text: currencyModel.name!,
          textStyle: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.w500,
          ),
        )
      ],
    );
  }
}
