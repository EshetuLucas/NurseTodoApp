import 'package:dexter_code_test/ui/ui_helpers/app_colors.dart';
import 'package:flutter/material.dart';

class AppDivider extends StatelessWidget {
  const AppDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: kcLightGrey,
      thickness: 1.1,
      height: 20.0,
    );
  }
}
