import 'package:flutter/material.dart';
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
      onModelReady: (model) => model.fetchUserTransactions(),
      builder: (context, viewModel, child) {
        return Scaffold(
          backgroundColor: BrandColors.whiteColor,
          appBar: AppBar(
            backgroundColor: BrandColors.whiteColor,
            elevation: 0.0,
            leading: const Icon(
              Icons.arrow_back_ios,
              color: BrandColors.blackColor,
              size: 14,
            ),
          ),
          body: viewModel.clientTransactions!.isEmpty
              ? Container()
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'All Transactions',
                        style: TextStyle(
                          color: BrandColors.purpleColor,
                          fontFamily: 'ProductSans',
                          fontWeight: FontWeight.w900,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(height: 24),
                      Expanded(
                        child: ListView.builder(
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
