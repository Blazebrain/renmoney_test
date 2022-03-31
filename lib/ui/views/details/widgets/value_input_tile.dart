import 'package:flutter/material.dart';
import 'package:renmoney_test/ui/shared/colors.dart';

class ValueInputTile extends StatelessWidget {
  final String? title;
  final String? value;
  const ValueInputTile({
    Key? key,
    this.title,
    this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title!,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w900,
                color: BrandColors.greyColor.withOpacity(0.8),
                fontFamily: 'ProductSans',
              ),
            ),
            Text(
              value!,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w900,
                color: BrandColors.deepGreyColor,
                fontFamily: 'ProductSans',
              ),
            ),
          ],
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}
