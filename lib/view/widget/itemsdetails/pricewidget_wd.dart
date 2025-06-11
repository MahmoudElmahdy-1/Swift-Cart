import 'package:ecommerceapp/controller/itemsdetails_controller.dart';
import 'package:ecommerceapp/core/constant/mycolors.dart';
import 'package:ecommerceapp/core/constant/myfonts.dart';
import 'package:ecommerceapp/view/widget/items/priceline.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class PriceWidget extends StatelessWidget {
  const PriceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    ItemsdetailsControllerImp itemsdetailsControllerImp = Get.find();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        itemsdetailsControllerImp.itemsModel.itemsDiscount! > 0
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Opacity(
                    opacity: 0.6,
                    child: Stack(
                      children: [
                        Text(
                          NumberFormat.currency(decimalDigits: 2, symbol: '\$')
                              .format(double.parse(itemsdetailsControllerImp
                                  .itemsModel.itemsPrice!)),
                          style: TextStyle(
                            fontSize: 17,
                            fontFamily: MyFonts.montserratMedium,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Positioned.fill(
                          child: CustomPaint(
                            size: const Size(70, 20),
                            painter: DiagonalLinePainter(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    NumberFormat.currency(decimalDigits: 2, symbol: '\$')
                        .format(double.parse(itemsdetailsControllerImp
                            .itemsModel.priceafterdiscount!)),
                    style: TextStyle(
                      color: MyColors.primaryColor,
                      fontSize: 22,
                      fontFamily: MyFonts.montserratMedium,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              )
            : Text(
                NumberFormat.currency(decimalDigits: 2, symbol: '\$').format(
                    double.parse(itemsdetailsControllerImp
                        .itemsModel.priceafterdiscount!)),
                style: TextStyle(
                  color: MyColors.primaryColor,
                  fontSize: 22,
                  fontFamily: MyFonts.montserratMedium,
                  fontWeight: FontWeight.bold,
                ),
              ),
        // Text(
        //   '${double.parse("${itemsdetailsControllerImp.itemsModel.priceafterdiscount}").toStringAsFixed(2)}\$',
        //   style: TextStyle(
        //     color: MyColors.primaryColor,
        //     fontSize: 23,
        //     fontFamily: MyFonts.montserratMedium,
        //     fontWeight: FontWeight.bold,
        //   ),
        // ),
      ],
    );
  }
}
