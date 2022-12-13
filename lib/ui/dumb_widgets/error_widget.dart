import 'package:dexter_code_test/ui/ui_helpers/app_colors.dart';
import 'package:dexter_code_test/ui/ui_helpers/ui_helpers.dart';
import 'package:flutter/cupertino.dart';

import '../ui_helpers/shared_styles.dart';
import 'image_builder.dart';

class DexterErrorWidget extends StatelessWidget {
  const DexterErrorWidget({
    Key? key,
    required this.onTap,
    this.errorMessage = 'We are unable to fetch data.\nPlease tap to try again',
    this.imagePath,
  }) : super(key: key);

  final VoidCallback onTap;
  final String errorMessage;
  final String? imagePath;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(48.0),
      child: Center(
        child: Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: GestureDetector(
              onTap: onTap,
              child: Column(
                children: [
                  Expanded(
                      child: ImageBuilder(
                          imagePath: imagePath ?? 'assets/images/timeout.png')),
                  Text(
                    errorMessage,
                    textAlign: TextAlign.center,
                    style: ktsMediumDarkTextStyle.copyWith(
                      color: kcDeepBlue,
                    ),
                  ),
                  verticalSpaceSmall,
                  Icon(
                    CupertinoIcons.refresh,
                    color: kcPrimaryColor,
                    size: 60,
                  ),
                  verticalSpaceMassive,
                  verticalSpaceLarge
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
