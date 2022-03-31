import 'package:flutter/material.dart';
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
        margin: const EdgeInsets.only(bottom: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
          color: BrandColors.tileBGColor,
          child: Row(
            children: [
              Container(
                height: 35,
                width: 35,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: viewModel.getIconColor(model!.type),
                ),
                child: ReusableSvgImage(
                  svgIcon: viewModel.getTileIcon(model!.type),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      model!.comment ?? 'Transfer',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontSize: 13,
                          height: 1.231,
                          fontFamily: 'ProductSans'),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '${model!.entryDate?.split('T')[0]}',
                      style: const TextStyle(
                        fontSize: 11,
                        height: 1.182,
                        fontFamily: 'ProductSans',
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 32),
              Text(
                '${model!.amount}',
                style: TextStyle(
                  color: model!.type == "DEPOSIT"
                      ? BrandColors.greenColor
                      : BrandColors.redColor,
                  fontFamily: 'ProductSans',
                  fontWeight: FontWeight.w900,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
