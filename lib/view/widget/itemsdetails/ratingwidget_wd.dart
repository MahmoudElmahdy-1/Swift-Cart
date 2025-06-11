import 'package:ecommerceapp/core/constant/mycolors.dart';
import 'package:ecommerceapp/core/constant/myfonts.dart';
import 'package:flutter/material.dart';

class RatingWidget extends StatelessWidget {
  const RatingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ...List.generate(
          5,
          (i) => Icon(
            Icons.star,
            size: 18,
            color: MyColors.amberColor,
          ),
        ),
        const SizedBox(width: 5),
        Text(
          '4.8',
          style: TextStyle(
            fontFamily: MyFonts.montserratMedium,
          ),
        )
      ],
    );
  }
}
