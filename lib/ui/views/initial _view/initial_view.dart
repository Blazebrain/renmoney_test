import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:renmoney_test/ui/shared/colors.dart';
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
          backgroundColor: BrandColors.purpleColor,
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Renmoney',
                  style: TextStyle(
                    fontSize: 48.sm,
                    fontFamily: 'ProductSans',
                    fontWeight: FontWeight.w900,
                    color: BrandColors.whiteColor,
                  ),
                ),
                SizedBox(height: 48.h),
                ReusableButton(
                  height: 64.h,
                  backgroundColor: BrandColors.whiteColor,
                  onPressed: () {
                    viewModel.goToHomeView();
                  },
                  borderRadius: 16.r,
                  customChild: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Proceed',
                        style: TextStyle(
                          fontSize: 16.sm,
                          fontFamily: 'ProductSans',
                          fontWeight: FontWeight.w900,
                          color: BrandColors.purpleColor,
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Icon(
                        Icons.forward,
                        color: BrandColors.purpleColor,
                      ),
                    ],
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
