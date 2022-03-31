import 'package:flutter/material.dart';
import 'package:renmoney_test/ui/shared/dumb_widgets/resuable_button.dart';
import 'package:renmoney_test/ui/views/initial%20_view/initial_viewmodel.dart';
import 'package:stacked/stacked.dart';

class InitialView extends StatelessWidget {
  const InitialView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<InitialViewModel>.reactive(
      viewModelBuilder: () => InitialViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          body: Column(
            children: [
              Text('Renmoney'),
              ReusableButton(
                onPressed: () {
                  viewModel.goToHomeView();
                },
                customChild: Row(
                  children: [
                    Text('Proceed'),
                    Icon(Icons.forward),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
