import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../controller/localization_controller.dart';
import '../../../util/app_constants.dart';
import '../../../util/dimensions.dart';
import '../../../util/images.dart';
import '../../../util/styles.dart';
import '../../base/custom_app_bar.dart';
import '../../base/custom_button.dart';
import '../../base/custom_snackbar.dart';
import 'widget/language_widget.dart';

class ChooseLanguageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'language'.tr),
      body: SafeArea(
        child: GetBuilder<LocalizationController>(
            builder: (localizationController) {
          return Column(children: [
            Expanded(
                child: Center(
              child: Scrollbar(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
                  child: Center(
                      child: SizedBox(
                    width: 1170,
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(child: Image.asset(Images.logo, width: 200)),
                          // SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                          //Center(child: Text(AppConstants.APP_NAME, style: robotoMedium.copyWith(fontSize: Dimensions.FONT_SIZE_LARGE))),
                          SizedBox(height: 30),

                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                    Dimensions.PADDING_SIZE_EXTRA_SMALL),
                            child:
                                Text('select_language'.tr, style: robotoMedium),
                          ),
                          SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),

                          GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: (1 / 1),
                            ),
                            itemCount: localizationController.languages.length,
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) => LanguageWidget(
                              languageModel:
                                  localizationController.languages[index],
                              localizationController: localizationController,
                              index: index,
                            ),
                          ),
                          SizedBox(height: Dimensions.PADDING_SIZE_LARGE),

                          Text('you_can_change_language'.tr,
                              style: robotoRegular.copyWith(
                                fontSize: Dimensions.FONT_SIZE_SMALL,
                                color: Theme.of(context).disabledColor,
                              )),
                        ]),
                  )),
                ),
              ),
            )),
            CustomButton(
              buttonText: 'save'.tr,
              margin: EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
              onPressed: () {
                if (localizationController.languages.length > 0 &&
                    localizationController.selectedIndex != -1) {
                  localizationController.setLanguage(Locale(
                    AppConstants.languages[localizationController.selectedIndex]
                        .languageCode,
                    AppConstants.languages[localizationController.selectedIndex]
                        .countryCode,
                  ));
                  Get.back();
                } else {
                  showCustomSnackBar('select_a_language'.tr);
                }
              },
            ),
          ]);
        }),
      ),
    );
  }
}
