import 'dart:io';
import 'package:ecommerceapp/core/constant/mycolors.dart';
import 'package:ecommerceapp/core/constant/myfonts.dart';
import 'package:ecommerceapp/core/functions/checkinternet_fu.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  void initState() {
    checkInternet();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                titleTextStyle: TextStyle(
                    color: MyColors.primaryColor,
                    fontFamily: MyFonts.montserratBold,
                    fontSize: 22),
                contentTextStyle: TextStyle(
                    color: MyColors.bodyColor,
                    fontFamily: MyFonts.montserratMedium,
                    fontSize: 15),
                title: Text('Confirm Exit'),
                content: Text('Are you sure you want to exit?'),
                actions: [
                  TextButton(
                    child: Text('No',
                        style: TextStyle(
                            color: MyColors.primaryColor,
                            fontFamily: MyFonts.montserratBold,
                            fontSize: 15)),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  TextButton(
                    child: Text('Yes',
                        style: TextStyle(
                            color: MyColors.primaryColor,
                            fontFamily: MyFonts.montserratBold,
                            fontSize: 15)),
                    onPressed: () {
                      exit(0);
                    },
                  ),
                ],
              );
            },
          ).then(
            (value) {
              if (value ?? false) {
                Navigator.of(context).pop();
              }
            },
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Pinput(
                length: 5,
                showCursor: true,
                hapticFeedbackType: HapticFeedbackType.lightImpact,
                defaultPinTheme: PinTheme(
                  width: 59,
                  height: 59,
                  textStyle: TextStyle(
                      fontSize: 20,
                      color: MyColors.primaryColor,
                      fontWeight: FontWeight.bold,
                      fontFamily: MyFonts.montserratMedium),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: MyColors.textFieldBackground,
                  ),
                ),
                onCompleted: (pin) => print(pin),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
