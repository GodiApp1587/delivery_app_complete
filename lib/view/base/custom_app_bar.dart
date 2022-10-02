import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

import '../../util/dimensions.dart';
import '../../util/styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool isBackButtonExist;
  final Function onBackPressed;
  // ignore: prefer_const_constructors_in_immutables, use_key_in_widget_constructors
  CustomAppBar(
      {required this.title,
      this.isBackButtonExist = true,
      required this.onBackPressed});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title,
          style: robotoRegular.copyWith(
              fontSize: Dimensions.FONT_SIZE_LARGE,
              color: Theme.of(context).textTheme.bodyText1?.color)),
      centerTitle: true,
      leading: isBackButtonExist
          ? IconButton(
              icon: Icon(Icons.arrow_back_ios),
              color: Theme.of(context).textTheme.bodyText1?.color,
              onPressed: () => onBackPressed != null
                  ? onBackPressed()
                  : Navigator.pop(context),
            )
          : SizedBox(),
      backgroundColor: Theme.of(context).cardColor,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => Size(1170, GetPlatform.isDesktop ? 70 : 50);
}
