import 'package:dexter_code_test/constants/app_constants.dart';
import 'package:dexter_code_test/ui/dumb_widgets/app_button.dart';
import 'package:dexter_code_test/ui/dumb_widgets/input_field.dart';
import 'package:dexter_code_test/ui/ui_helpers/app_colors.dart';
import 'package:dexter_code_test/ui/ui_helpers/shared_styles.dart';
import 'package:dexter_code_test/ui/ui_helpers/ui_helpers.dart';
import 'package:dexter_code_test/ui/views/signup/signup_view.form.dart';
import 'package:dexter_code_test/ui/views/signup/signup_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

@FormView(
  fields: [
    FormTextField(
      name: "firstName",
    ),
    FormTextField(
      name: "lastName",
    ),
    FormTextField(
      name: "email",
    ),
    FormTextField(
      name: "password",
    ),
    FormTextField(
      name: "confirmPassword",
    ),
  ],
)
class SignUpView extends StatelessWidget with $SignUpView {
  SignUpView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignUpViewModel>.reactive(
      viewModelBuilder: () => SignUpViewModel(),
      onModelReady: (model) => listenToFormUpdated(model),
      builder: (context, model, child) {
        return IgnorePointer(
          ignoring: model.isBusy,
          child: Scaffold(
            body: SafeArea(
              child: Column(
                children: [
                  verticalSpaceSmall,
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: appSymmetricEdgePadding,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Create your account',
                                style: ktsWhiteMediumTextStyle.copyWith(
                                  color: kcPrimaryColor,
                                  fontSize: 23,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: appSymmetricEdgePadding,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Let\'s create your account ',
                                style:
                                    ktsDarkGreyTextStyle.copyWith(fontSize: 17),
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
                                  controller: firstNameController,
                                  maxLine: 1,
                                  hasFocusedBorder: true,
                                  textInputType: TextInputType.emailAddress,
                                  isReadOnly: model.isBusy,
                                  nextFocusNode: FocusScope.of(context),
                                  placeholder: 'First Name',
                                ),
                                if (model.nameFieldHasText)
                                  _ValidationMessage(
                                    title: 'First Name $CantBeEmpty',
                                  ),
                                verticalSpaceMedium,
                                InputField(
                                  controller: lastNameController,
                                  maxLine: 1,
                                  hasFocusedBorder: true,
                                  textInputType: TextInputType.emailAddress,
                                  isReadOnly: model.isBusy,
                                  nextFocusNode: FocusScope.of(context),
                                  placeholder: 'Last Name',
                                ),
                                verticalSpaceMedium,
                                InputField(
                                  controller: emailController,
                                  maxLine: 1,
                                  hasFocusedBorder: true,
                                  textInputType: TextInputType.emailAddress,
                                  isReadOnly: model.isBusy,
                                  nextFocusNode: FocusScope.of(context),
                                  placeholder: 'Email',
                                ),
                                if (model.emailFieldHasText)
                                  _ValidationMessage(
                                      title: model.emailValidationMessage!),
                                verticalSpaceMedium,
                                InputField(
                                  obscureText: true,
                                  maxLine: 1,
                                  isReadOnly: model.isBusy,
                                  hasFocusedBorder: true,
                                  controller: passwordController,
                                  placeholder: 'Password',
                                ),
                                if (model.passwordFieldHasText)
                                  _ValidationMessage(
                                    title: 'Password $CantBeEmpty',
                                  ),
                                verticalSpaceMedium,
                                InputField(
                                  obscureText: true,
                                  maxLine: 1,
                                  isReadOnly: model.isBusy,
                                  hasFocusedBorder: true,
                                  controller: confirmPasswordController,
                                  placeholder: 'Confirm Password',
                                ),
                                if (model.confirmFieldHasText ||
                                    model.passwordValidationMessage != null)
                                  _ValidationMessage(
                                    title: model.passwordValidationMessage ??
                                        'Confirm password $CantBeEmpty',
                                  ),
                                verticalSpaceSmall,
                                if (model.erroMessage.isNotEmpty)
                                  Center(
                                    child: Text(
                                      model.erroMessage,
                                      style: TextStyle(
                                          color: Colors.red, fontSize: 15),
                                    ),
                                  ),
                                verticalSpaceMedium,
                              ],
                            ),
                          ),
                          Padding(
                            padding: appSymmetricEdgePadding,
                            child: AppButton(
                              title: 'Create Account',
                              busy: model.isBusy,
                              onTap: () {
                                FocusScope.of(context).unfocus();
                                model.onCreateAccount();
                              },
                            ),
                          ),
                          Padding(
                            padding: appSymmetricEdgePadding,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Already have an account?',
                                  style: ktsDarkGreyTextStyle,
                                ),
                                TextButton(
                                  onPressed: model.onBack,
                                  child: Text(
                                    'Login',
                                    style: ktsGreenBoldTextStyle.copyWith(
                                        fontWeight: FontWeight.w600),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
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
