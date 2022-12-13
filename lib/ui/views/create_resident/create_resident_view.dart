import 'package:dexter_code_test/constants/app_constants.dart';
import 'package:dexter_code_test/ui/dumb_widgets/app_button.dart';
import 'package:dexter_code_test/ui/dumb_widgets/dexter_app_bar.dart';
import 'package:dexter_code_test/ui/dumb_widgets/input_field.dart';
import 'package:dexter_code_test/ui/ui_helpers/app_colors.dart';
import 'package:dexter_code_test/ui/ui_helpers/shared_styles.dart';
import 'package:dexter_code_test/ui/ui_helpers/ui_helpers.dart';
import 'package:dexter_code_test/ui/views/create_resident/create_resident_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'create_resident_view.form.dart';

@FormView(
  fields: [
    FormTextField(
      name: "fullName",
    ),
    FormTextField(
      name: "age",
    ),
    FormTextField(
      name: "gender",
    ),
    FormTextField(
      name: "roomNumber",
    ),
  ],
)
class CreateResidentView extends StatelessWidget with $CreateResidentView {
  CreateResidentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CreateResidentViewModel>.reactive(
      viewModelBuilder: () => CreateResidentViewModel(),
      onModelReady: (model) => listenToFormUpdated(model),
      builder: (context, model, child) {
        return AbsorbPointer(
          absorbing: model.isBusy,
          child: Scaffold(
            appBar: const DexterAppBar(
              size: 50,
              title: "Add Resident",
            ),
            body: SafeArea(
              child: Column(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        verticalSpaceMedium,
                        Padding(
                          padding: appSymmetricEdgePadding,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Create Resident',
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
                              'Let\'s create a new resident ',
                              style: ktsSmallWhiteTextStyle.copyWith(
                                fontSize: 17,
                                color: kcPrimaryColor,
                              ),
                            ),
                          ),
                        ),
                        verticalSpaceMedium,
                        Padding(
                          padding: appSymmetricEdgePadding,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              verticalSpaceSmall,
                              InputField(
                                controller: fullNameController,
                                maxLine: 1,
                                hasFocusedBorder: true,
                                textInputType: TextInputType.emailAddress,
                                isReadOnly: model.isBusy,
                                nextFocusNode: FocusScope.of(context),
                                placeholder: 'Full Name',
                                floatingPlaceholder: 'Resident Full Name',
                              ),
                              if (model.showValidationMessage &&
                                  !model.hasFullName)
                                const _ValidationMessage(
                                  title: 'Full Name $CantBeEmpty',
                                ),
                              verticalSpaceMedium,
                              InputField(
                                controller: ageController,
                                maxLine: 1,
                                hasFocusedBorder: true,
                                textInputType: TextInputType.emailAddress,
                                isReadOnly: model.isBusy,
                                nextFocusNode: FocusScope.of(context),
                                placeholder: 'Age',
                                floatingPlaceholder: 'Resident age',
                              ),
                              if (model.showValidationMessage && !model.hasAge)
                                const _ValidationMessage(
                                  title: 'Age $CantBeEmpty',
                                ),
                              verticalSpaceMedium,
                              InputField(
                                controller: genderController,
                                maxLine: 1,
                                hasFocusedBorder: true,
                                textInputType: TextInputType.emailAddress,
                                isReadOnly: model.isBusy,
                                nextFocusNode: FocusScope.of(context),
                                placeholder: 'Gender',
                                floatingPlaceholder: 'Resident Gender',
                              ),
                              if (model.showValidationMessage &&
                                  !model.hasGender)
                                const _ValidationMessage(
                                  title: 'Gender $CantBeEmpty',
                                ),
                              verticalSpaceMedium,
                              InputField(
                                controller: roomNumberController,
                                maxLine: 1,
                                hasFocusedBorder: true,
                                textInputType: TextInputType.emailAddress,
                                isReadOnly: model.isBusy,
                                nextFocusNode: FocusScope.of(context),
                                placeholder: 'Room Number',
                                floatingPlaceholder: 'Resident Room Number',
                              ),
                              if (model.showValidationMessage &&
                                  !model.hasRoomNumber)
                                const _ValidationMessage(
                                  title: 'Room Number $CantBeEmpty',
                                ),
                              verticalSpaceMedium,
                              verticalSpaceMedium,
                            ],
                          ),
                        ),
                        Padding(
                          padding: appSymmetricEdgePadding,
                          child: AppButton(
                            title: 'Next',
                            busy: model.isBusy,
                            onTap: () {
                              FocusScope.of(context).unfocus();
                              model.onCreate();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _ValidationMessage extends StatelessWidget {
  const _ValidationMessage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpaceTiny,
          Text("$title",
              style: ktsSmallWhiteTextStyle.copyWith(
                color: Colors.red.withOpacity(0.7),
              ))
        ],
      ),
    );
  }
}
