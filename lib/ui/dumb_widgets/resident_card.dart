import 'package:dexter_code_test/datamodels/resident_model/resident_model.dart';
import 'package:dexter_code_test/ui/dumb_widgets/image_builder.dart';
import 'package:dexter_code_test/ui/ui_helpers/app_colors.dart';
import 'package:dexter_code_test/ui/ui_helpers/shared_styles.dart';
import 'package:dexter_code_test/ui/ui_helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ResidentCard extends StatelessWidget {
  const ResidentCard({
    Key? key,
    required this.resident,
    this.isBusy = false,
  }) : super(key: key);

  final ResidentModel resident;
  final bool isBusy;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shadowColor: kcPrimaryColor.withOpacity(0.99),
      margin: EdgeInsets.zero,
      clipBehavior: Clip.antiAlias,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 90,
                  child: SkeletonLoader(
                    startColor: kcLightWhite,
                    endColor: kcLightGrey5,
                    loading: isBusy,
                    child: ImageBuilder(
                        imagePath: resident.gender.toLowerCase() == "male"
                            ? 'assets/images/place_holders/boy.png'
                            : 'assets/images/place_holders/girl1.png'),
                  ),
                ),
                horizontalSpaceMedium,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SkeletonLoader(
                      startColor: kcLightWhite,
                      endColor: kcLightGrey5,
                      loading: isBusy,
                      child: Row(
                        children: [
                          Text(
                            'Name',
                            style: ktsBoldTextStyle.copyWith(
                              fontSize: 15,
                              color: kcPrimaryColor,
                            ),
                          ),
                          horizontalSpaceSmall,
                          Text(
                            resident.fullName,
                          ),
                        ],
                      ),
                    ),
                    verticalSpaceSmall,
                    SkeletonLoader(
                      startColor: kcLightWhite,
                      endColor: kcLightGrey5,
                      loading: isBusy,
                      child: Row(
                        children: [
                          Text(
                            'Age',
                            style: ktsBoldTextStyle.copyWith(
                              fontSize: 15,
                              color: kcPrimaryColor,
                            ),
                          ),
                          horizontalSpaceSmall,
                          Text(
                            '${resident.age}',
                          ),
                        ],
                      ),
                    ),
                    verticalSpaceSmall,
                    SkeletonLoader(
                      startColor: kcLightWhite,
                      endColor: kcLightGrey5,
                      loading: isBusy,
                      child: Row(
                        children: [
                          Text(
                            'Room Number',
                            style: ktsBoldTextStyle.copyWith(
                              fontSize: 15,
                              color: kcPrimaryColor,
                            ),
                          ),
                          horizontalSpaceSmall,
                          Text(
                            '${resident.roomNumber}',
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
