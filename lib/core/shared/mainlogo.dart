import 'package:ecommerceapp/core/constant/myimages.dart';
import 'package:flutter/material.dart';

class MainLogo extends StatelessWidget {
  const MainLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 40, bottom: 55),
        child: Image.asset(MyImages.mainLogo, width: 90, height: 90));
  }
}
