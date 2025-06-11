import 'package:ecommerceapp/controller/orders/orderdetails_controller.dart';
import 'package:ecommerceapp/core/constant/mycolors.dart';
import 'package:ecommerceapp/core/constant/myfonts.dart';
import 'package:ecommerceapp/core/functions/mytranslations_fu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class FirstTable extends StatelessWidget {
  const FirstTable({super.key});

  @override
  Widget build(BuildContext context) {
    OrderdetailsController orderdetailsController = Get.find();

    return Card(
      child: Table(
        border: TableBorder.all(color: MyColors.greyColor),
        children: [
          TableRow(
              decoration: BoxDecoration(color: MyColors.greyColor2),
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                  child: Text(
                    '165'.tr,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: fontFamily(
                          MyFonts.cairoRegular, MyFonts.montserratMedium),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                  child: Text(
                    '166'.tr,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: fontFamily(
                          MyFonts.cairoRegular, MyFonts.montserratMedium),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                  child: Text(
                    '167'.tr,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: fontFamily(
                          MyFonts.cairoRegular, MyFonts.montserratMedium),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ]),
          ...List.generate(
            orderdetailsController.data.length,
            (i) => TableRow(children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                child: Text(
                  translateDatabase(orderdetailsController.data[i].itemsNameAr,
                      orderdetailsController.data[i].itemsNameEn),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: fontFamily(
                        MyFonts.cairoRegular, MyFonts.montserratMedium),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                child: Text(
                  '${orderdetailsController.data[i].allitemscount}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: MyFonts.montserratMedium,
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                child: Text(
                  NumberFormat.currency(decimalDigits: 2, symbol: '\$').format(
                      double.parse(
                          orderdetailsController.data[i].allitemsprice!)),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: MyFonts.montserratMedium,
                  ),
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
