import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import '../../shared/colors.dart';
import 'home_viewmodel.dart';
import 'widgets/transactions_tile.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      onModelReady: (model) => model.setup(),
      builder: (context, viewModel, child) {
        return Scaffold(
          backgroundColor: BrandColors.whiteColor,
          appBar: AppBar(
            backgroundColor: BrandColors.whiteColor,
            elevation: 0.0,
            leading: Icon(
              Icons.arrow_back_ios,
              color: BrandColors.blackColor,
              size: 14.w,
            ),
          ),
          body: viewModel.isBusy
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'All Transactions',
                        style: TextStyle(
                          color: BrandColors.purpleColor,
                          fontFamily: 'ProductSans',
                          fontWeight: FontWeight.w900,
                          fontSize: 20.sm,
                        ),
                      ),
                      SizedBox(height: 24.h),
                      Expanded(
                        child: viewModel.clientTransactions!.isEmpty
                            ? Container()
                            : ListView.builder(
                                itemCount: viewModel.clientTransactions?.length,
                                itemBuilder: (context, index) {
                                  return TrasactionHistoryTile(
                                    onTap: () => viewModel.goToDetailsView(
                                      viewModel.clientTransactions![index],
                                    ),
                                    model: viewModel.clientTransactions![index],
                                  );
                                },
                              ),
                      )
                    ],
                  ),
                ),
        );
      },
    );
  }
}
