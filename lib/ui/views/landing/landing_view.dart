import 'package:dexter_code_test/ui/ui_helpers/app_colors.dart';
import 'package:dexter_code_test/ui/ui_helpers/shared_styles.dart';
import 'package:dexter_code_test/ui/ui_helpers/ui_helpers.dart';
import 'package:dexter_code_test/ui/views/landing/landing_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class LandingView extends StatelessWidget {
  const LandingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LandingViewModel>.reactive(
      viewModelBuilder: () => LandingViewModel(),
      builder: (
        BuildContext context,
        LandingViewModel model,
        Widget? child,
      ) {
        return Scaffold(
            body: Column(
          children: [
            verticalSpaceMedium,
            Padding(
              padding: appSymmetricEdgePadding,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Hello, Eshetu',
                  style: ktsWhiteMediumTextStyle.copyWith(
                    fontSize: 23,
                    color: kcPrimaryColor,
                  ),
                ),
              ),
            ),
            Padding(
              padding: appSymmetricEdgePadding,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Welcom back',
                  style: ktsSmallWhiteTextStyle.copyWith(
                    fontSize: 17,
                    color: kcPrimaryColor,
                  ),
                ),
              ),
            ),
          ],
        ));
      },
    );
  }
}
