import 'package:dexter_code_test/ui/ui_helpers/app_colors.dart';
import 'package:dexter_code_test/ui/ui_helpers/shared_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DexterAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DexterAppBar({Key? key, this.size = 0.5, this.title = ''})
      : super(key: key);
  final double size;
  final String title;

  @override
  PreferredSizeWidget build(BuildContext context) {
    return AppBar(
      leading: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: const Icon(
          CupertinoIcons.back,
          color: kcPrimaryColor,
        ),
      ),
      title: Text(
        title,
        style: ktsBoldTextStyle.copyWith(
          color: kcPrimaryColor,
        ),
      ),
      elevation: 0,
      backgroundColor: kcWhite,
      systemOverlayStyle: const SystemUiOverlayStyle(
        // Status bar color
        statusBarColor: kcWhite,

        // Status bar brightness (optional)
        statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
        statusBarBrightness: Brightness.light, // For iOS (dark icons)
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(size);
}
