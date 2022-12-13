// ignore_for_file: unnecessary_const

import 'package:dexter_code_test/constants/app_constants.dart';
import 'package:dexter_code_test/enums/shift_type.dart';
import 'package:dexter_code_test/ui/dumb_widgets/app_button.dart';
import 'package:dexter_code_test/ui/dumb_widgets/app_divider.dart';
import 'package:dexter_code_test/ui/dumb_widgets/profile_pic_builder.dart';
import 'package:dexter_code_test/ui/ui_helpers/app_colors.dart';
import 'package:dexter_code_test/ui/ui_helpers/shared_styles.dart';
import 'package:dexter_code_test/ui/ui_helpers/ui_helpers.dart';
import 'package:flutter/material.dart';

import 'package:stacked/stacked.dart';

import 'account_viewmodel.dart';

class AccountView extends StatelessWidget {
  const AccountView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AccountViewModel>.reactive(
      viewModelBuilder: () => AccountViewModel(),
      builder: (context, model, child) => Scaffold(
        body: SafeArea(
          child: Padding(
            padding: appSymmetricEdgePadding,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                verticalSpaceMedium,
                _UserProfile(),
                verticalSpaceMedium,
                Padding(
                  padding: appSymmetricEdgePadding,
                  child: Wrap(
                    alignment: WrapAlignment.start,
                    spacing: 20,
                    children: [
                      for (var shiftType in ShiftType.values)
                        GestureDetector(
                          onTap: () => model.onSelectShiftType(shiftType),
                          child: Card(
                            color: model.selectedShift == shiftType
                                ? kcPrimaryColor
                                : kcWhite,
                            elevation: 4,
                            shadowColor: kcPrimaryColor.withOpacity(0.99),
                            margin: EdgeInsets.zero,
                            clipBehavior: Clip.antiAlias,
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            )),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 16),
                              child: Text(
                                shiftType.name.toUpperCase(),
                                style: ktsDarkGreyTextStyle.copyWith(
                                  fontSize: 16,
                                  color: model.selectedShift == shiftType
                                      ? kcWhite
                                      : kcPrimaryColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                verticalSpaceSmall,
                const Expanded(
                  child: SingleChildScrollView(
                    child: _Actions(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Actions extends ViewModelWidget<AccountViewModel> {
  const _Actions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, AccountViewModel model) {
    return ListView.separated(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: ACCOUNT_OPTIONS.length,
        separatorBuilder: (BuildContext context, int index) {
          return AppDivider();
        },
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: ActionsItem(
              title: ACCOUNT_OPTIONS[index]['title'],
              iconData: ACCOUNT_OPTIONS[index]['iconData'],
              onTap: () => model.onOptionTap(index),
            ),
          );
        });
  }
}

class _UserProfile extends ViewModelWidget<AccountViewModel> {
  const _UserProfile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, AccountViewModel model) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _ProfilePic(),
          horizontalSpaceSmall,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                model.userFullName,
                style: ktsDarkGreyTextStyle,
              ),
              const Text(
                // model.currentUser.email,
                '+251916740322',
                style: ktsDarkSmallTextStyle,
              ),
              verticalSpaceTiny,
              Row(
                children: [
                  const Icon(
                    Icons.edit,
                    color: kcPrimaryColor,
                    size: 30,
                  ),
                  horizontalSpaceTiny,
                  Text(
                    'Edit',
                    style: ktsBoldMeidumDarkTextStyle.copyWith(
                        color: kcPrimaryColor),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}

class _ProfilePic extends ViewModelWidget<AccountViewModel> {
  const _ProfilePic({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, AccountViewModel model) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        const Padding(
          padding: const EdgeInsets.only(bottom: 0, right: 8),
          child: ProfilePicBuilder(
            url: 'assets/images/place_holders/person.jpeg',
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 10, left: 2),
          child: Align(
            alignment: Alignment.bottomRight,
            child: Container(
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: kcAppBackgroundColor,
              ),
              child: Material(
                elevation: 20,
                color: kcAppBackgroundColor,
                child: Padding(
                  padding: EdgeInsets.all(3.0),
                  child: GestureDetector(
                    onTap: model.onCamera,
                    child: const Icon(
                      Icons.camera_alt_rounded,
                      color: kcPrimaryColor,
                      size: 24,
                    ),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

class ActionsItem extends StatelessWidget {
  const ActionsItem({
    required this.title,
    required this.iconData,
    this.hasTrailingIcon = true,
    this.iconColor = kcPrimaryColor,
    this.onTap,
    Key? key,
  }) : super(key: key);

  final String title;
  final void Function()? onTap;
  final IconData iconData;
  final bool hasTrailingIcon;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 1),
      onTap: onTap,
      horizontalTitleGap: 2,
      leading: Icon(
        iconData,
        color: iconColor,
      ),
      title: Text(
        title,
        style: ktsDarkSmallTextStyle,
      ),
      trailing: hasTrailingIcon
          ? const Icon(
              Icons.navigate_next_sharp,
              color: kcPrimaryColor,
            )
          : null,
    );
  }
}
