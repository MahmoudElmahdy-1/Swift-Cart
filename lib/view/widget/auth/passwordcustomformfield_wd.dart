import 'package:ecommerceapp/core/constant/mycolors.dart';
import 'package:ecommerceapp/core/constant/myfonts.dart';
import 'package:ecommerceapp/core/functions/mytranslations_fu.dart';
import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

class PasswordCustomeFormField extends StatelessWidget {
  const PasswordCustomeFormField(
      {super.key,
      required this.hintText,
      required this.icon,
      required this.textController,
      required this.valid,
      this.obscureText,
      required this.type,
      this.onTapIcon});

  final String hintText;
  final IconData icon;
  final TextEditingController textController;
  final bool? obscureText;
  final String? Function(String?)? valid;
  final TextInputType? type;
  final void Function()? onTapIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: valid,
      keyboardType: type,
      controller: textController,
      obscureText: obscureText == null || obscureText == false ? false : true,
      decoration: InputDecoration(
        fillColor: MyColors.textFieldBackground,
        filled: true,
        prefixIcon: Container(
            padding: const EdgeInsets.only(left: 22, right: 15),
            child: Icon(
              icon,
              color: MyColors.textFieldFourground,
            )),
        suffixIcon: Container(
          padding: const EdgeInsets.only(right: 20, top: 10, bottom: 10, left: 20),
          child: InkWell(
            onTap: onTapIcon,
            child: obscureText == true
                ? Icon(
                    EvaIcons.eyeOffOutline,
                    color: MyColors.textFieldFourground,
                  )
                : Icon(
                    EvaIcons.eyeOutline,
                    color: MyColors.textFieldFourground,
                  ),
          ),
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: fontSize(16, 16),
          fontFamily:
              fontFamily(MyFonts.cairoRegular, MyFonts.montserratMedium),
          fontWeight: FontWeight.bold,
          color: MyColors.textFieldFourground,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(40),
        ),
      ),
    );
  }
}
