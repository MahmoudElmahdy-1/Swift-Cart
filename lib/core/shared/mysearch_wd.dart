import 'package:ecommerceapp/core/constant/mycolors.dart';
import 'package:ecommerceapp/core/constant/myfonts.dart';
import 'package:ecommerceapp/core/functions/mytranslations_fu.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MySearch extends StatelessWidget {
  const MySearch({
    super.key,
    required this.cartOnPressed,
    required this.onChanged,
    required this.myontroller,
    required this.onTapSearch,
  });
  final void Function()? cartOnPressed;
  final void Function(String)? onChanged;
  final void Function()? onTapSearch;
  final TextEditingController myontroller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: Row(children: [
        Expanded(
          child: TextFormField(
            controller: myontroller,
            onChanged: onChanged,
            decoration: InputDecoration(
              fillColor: MyColors.textFieldBackground,
              filled: true,
              hintText: "71".tr,
              hintStyle: TextStyle(
                fontSize: 16,
                fontFamily:
                    fontFamily(MyFonts.cairoRegular, MyFonts.montserratMedium),
                fontWeight: FontWeight.bold,
                color: MyColors.textFieldFourground,
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(13),
              ),
              prefixIcon: InkWell(
                onTap: onTapSearch,
                child: Container(
                  padding: const EdgeInsets.only(left: 21, right: 17),
                  child: Icon(
                    EvaIcons.search,
                    color: MyColors.primaryColor,
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 7),
        IconButton(
          style: ButtonStyle(
            shape: WidgetStatePropertyAll(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(13),
            )),
            minimumSize: const WidgetStatePropertyAll(Size(55, 54)),
            backgroundColor: WidgetStatePropertyAll(MyColors.primaryColor),
            foregroundColor: WidgetStatePropertyAll(MyColors.whiteColor),
          ),
          onPressed: cartOnPressed,
          icon: const Icon(EvaIcons.shoppingCartOutline),
        )
      ]),
    );
  }
}
