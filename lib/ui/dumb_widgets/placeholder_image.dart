import 'package:dexter_code_test/ui/ui_helpers/app_colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class PlaceholderImage extends StatelessWidget {
  final bool headerHero;
  final bool enableHero;
  final String imageUrl;
  final String entertainerId;
  final Widget Function(BuildContext, String, dynamic)? errorWidget;
  final bool showGreyBackground;
  final BoxFit fit;
  final bool roundedCorners;
  final double cornerRadius;
  final String errorImageUrl;
  final Widget placeHolder;

  const PlaceholderImage({
    Key? key,
    required this.imageUrl,
    this.errorWidget,
    this.entertainerId = '',
    this.headerHero = false,
    this.enableHero = false,
    this.showGreyBackground = true,
    this.roundedCorners = true,
    this.fit = BoxFit.contain,
    this.cornerRadius = 100,
    this.placeHolder = const SkeletonLoader(
      startColor: kcLightWhite,
      endColor: kcLightGrey5,
      child: SizedBox(height: double.maxFinite, width: double.maxFinite),
      loading: true,
    ),
    this.errorImageUrl = "assets/images/error.png",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HeroMode(
      enabled: enableHero,
      child: Hero(
        // Hero tag should be unique, if we have no hero image we
        // will have same hero tag for place holder image.
        tag: '$imageUrl${headerHero ? 'header' : ''} $entertainerId',
        child: ClipRRect(
          borderRadius:
              BorderRadius.circular(roundedCorners ? cornerRadius : 0),
          child: Container(
            // alignment: Alignment.center,
            decoration: BoxDecoration(
              color: showGreyBackground ? kcVeryLightGrey : null,
            ),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: _image((imageUrl).contains('assets/')),
            ),
          ),
        ),
      ),
    );
  }

  Widget _image(bool isFromFile) {
    if (isFromFile)
      return Image.asset(
        imageUrl,
        width: double.infinity,
        height: double.infinity,
        fit: fit,
      );
    else
      return CachedNetworkImage(
        imageUrl: imageUrl,
        width: double.infinity,
        height: double.infinity,
        placeholder: (context, url) => placeHolder,
        errorWidget: errorWidget ??
            (context, url, error) => SkeletonLoader(
                  startColor: kcLightGrey3,
                  endColor: kcWhite,
                  child: Placeholder(
                    color: kcPrimaryColor,
                  ),
                  loading: false,
                ),
        fit: fit,
      );
  }
}
