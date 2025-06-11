import 'package:ecommerceapp/core/constant/mycolors.dart';
import 'package:ecommerceapp/core/constant/myfonts.dart';
import 'package:ecommerceapp/core/functions/mytranslations_fu.dart';
import 'package:flutter/material.dart';

class CustomeFormField extends StatelessWidget {
  const CustomeFormField({
    super.key,
    required this.hintText,
    required this.icon,
    required this.textController,
    required this.valid,
    this.obscureText,
    required this.type,
  });

  final String hintText;
  final IconData icon;
  final TextEditingController textController;
  final bool? obscureText;
  final String? Function(String?)? valid;
  final TextInputType? type;

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
        prefixIcon: Container(
          padding: const EdgeInsets.only(left: 22, right: 15),
          child: Icon(
            icon,
            color: MyColors.textFieldFourground,
          ),
        ),
      ),
    );
  }
}
