import 'package:flutter/material.dart';

import 'BenefitSummary/PolifyxTextStyles.dart';
import 'Commons.dart';
import 'Images.dart';


class NoDataFound extends StatelessWidget {
  final String? text;
  final String? image;
  final double? imageSize;

  const NoDataFound({
    Key? key,
    this.text,
    this.image,
    this.imageSize = 210,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle = PolifyxTextStyles();

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 30),
        Container(
          height: imageSize,
          alignment: Alignment.center,
          child: Center(
            child: Image.asset(
              image ?? Images.claimFileNoData,
              alignment: Alignment.center,
            ),
          ),
        ),
        HeightSpace(height: 12),
        Text(
          text ?? 'You have not filed any claims yet',
          style: textStyle.heading3,
        )
      ],
    );
  }
}
