import 'package:ecommerceapp/core/constant/myimages.dart';
import 'package:ecommerceapp/core/shared/mainlogo.dart';
import 'package:ecommerceapp/core/shared/customappbar_wd.dart';
import 'package:ecommerceapp/view/widget/language/customelanguagebutton_wd.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(text: '181'.tr),
      body: SafeArea(
        child: Stack(
          children: [
            Image.asset(MyImages.languagePageBackground),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(flex: 2),
                  const MainLogo(),
                  const SizedBox(height: 15),
                  CustomeLanguageButton(
                      text: "182".tr,
                      onPressed: () {
                        launchUrl(Uri.parse(
                            "mailto:elmahdy.contact@gmail.com?subject=News&body=Hello!"));
                      }),
                  const SizedBox(height: 15),
                  CustomeLanguageButton(
                      text: "183".tr,
                      onPressed: () async {
                        final link = const WhatsAppUnilink(
                          phoneNumber: '+201013949604',
                          text: "Hello!",
                        );
                        // The "launch" method is part of "url_launcher".
                        await launchUrl(link.asUri());
                      }),
                  const Spacer(flex: 7),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
