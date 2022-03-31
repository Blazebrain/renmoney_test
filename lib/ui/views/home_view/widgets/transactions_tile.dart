import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renmoney_test/model/client_transactions_model.dart';
import 'package:renmoney_test/ui/shared/colors.dart';
import 'package:renmoney_test/ui/shared/dumb_widgets/reusable_svg.dart';
import 'package:renmoney_test/ui/views/details/details_view.dart';
import 'package:stacked/stacked.dart';

import '../home_viewmodel.dart';

class TrasactionHistoryTile extends ViewModelWidget<HomeViewModel> {
  final ClientTransactions? model;
  final void Function()? onTap;
  const TrasactionHistoryTile({
    this.onTap,
    Key? key,
    this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: EdgeInsets.only(bottom: 10.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 10.w),
          color: BrandColors.tileBGColor,
          child: Row(
            children: [
              Container(
                height: 35.h,
                width: 35.w,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: viewModel.getIconColor(model!.type),
                ),
                child: ReusableSvgImage(
                  svgIcon: viewModel.getTileIcon(model!.type),
                ),
              ),
              SizedBox(width: 8.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      model!.comment ?? 'Transfer',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 13.sp,
                        height: 1.231,
                        fontFamily: 'ProductSans',
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      '${model!.entryDate?.split('T')[0]}',
                      style: TextStyle(
                        fontSize: 11.sm,
                        height: 1.182,
                        fontFamily: 'ProductSans',
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 32.w),
              Text(
                '${model!.amount}',
                style: TextStyle(
                  color: model!.type == "DEPOSIT"
                      ? BrandColors.greenColor
                      : BrandColors.redColor,
                  fontFamily: 'ProductSans',
                  fontWeight: FontWeight.w900,
                  fontSize: 14.sm,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
