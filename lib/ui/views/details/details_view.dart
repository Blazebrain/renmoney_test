import 'package:flutter/material.dart';
import 'package:renmoney_test/model/client_transactions_model.dart';
import 'package:renmoney_test/ui/shared/colors.dart';
import 'package:renmoney_test/ui/views/details/details_viewmodel.dart';
import 'package:stacked/stacked.dart';

import 'widgets/value_input_tile.dart';

class DetailsView extends StatelessWidget {
  final ClientTransactions? model;
  const DetailsView({Key? key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DetailsViewModel>.reactive(
      viewModelBuilder: () => DetailsViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          backgroundColor: BrandColors.deepPurple,
          appBar: AppBar(
            backgroundColor: BrandColors.deepPurple,
            elevation: 0.0,
            leading: GestureDetector(
              onTap: () => viewModel.goBack(),
              child: const Icon(
                Icons.arrow_back_ios,
                size: 14,
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Transaction details',
                  style: TextStyle(
                    color: BrandColors.whiteColor,
                    fontFamily: 'ProductSans',
                    fontWeight: FontWeight.w900,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 24),
                Card(
                  margin: const EdgeInsets.only(bottom: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: BrandColors.tileBGColor,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 24),
                        const Text(
                          'Detailed summary of transaction',
                          style: TextStyle(
                            color: BrandColors.purpleColor,
                            height: 1.357,
                            fontSize: 14,
                            fontFamily: 'ProductSans',
                          ),
                        ),
                        const SizedBox(height: 22),
                        const ValueInputTile(
                          title: 'Recipient',
                          // Api does not return the name of the receiver
                          // Putting N/A there for now
                          value: 'N/A',
                        ),
                        ValueInputTile(
                          title: 'Amount',
                          value: model!.amount.toString().contains('-')
                              ? model!.amount.toString().split('-')[1]
                              : model!.amount.toString(),
                        ),
                        ValueInputTile(
                          title: 'Transaction Date',
                          value: model!.entryDate!.split('T')[0],
                        ),
                        ValueInputTile(
                          title: 'Transation Id',
                          value: '${model!.transactionId}',
                        ),
                        const ValueInputTile(
                          title: 'Status',
                          value: 'Success',
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
