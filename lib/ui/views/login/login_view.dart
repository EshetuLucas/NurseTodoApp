import 'package:dexter_code_test/ui/dumb_widgets/app_button.dart';
import 'package:dexter_code_test/ui/dumb_widgets/image_builder.dart';
import 'package:dexter_code_test/ui/dumb_widgets/input_field.dart';
import 'package:dexter_code_test/ui/ui_helpers/app_colors.dart';
import 'package:dexter_code_test/ui/ui_helpers/shared_styles.dart';
import 'package:dexter_code_test/ui/ui_helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'login_view.form.dart';
import 'login_viewmodel.dart';

@FormView(
  fields: [
    FormTextField(
      name: "email",
    ),
    FormTextField(
      name: "password",
    ),
  ],
)
class LoginView extends StatelessWidget with $LoginView {
  LoginView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
      viewModelBuilder: () => LoginViewModel(),
      onModelReady: (model) => listenToFormUpdated(model),
      builder: (context, model, child) {
        return Scaffold(
          body: SafeArea(
            child: IgnorePointer(
              ignoring: model.isBusy,
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 150,
                            width: 150,
                            child: ImageBuilder(
                                imagePath:
                                    'assets/images/place_holders/logo.png'),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Login with your account',
                                style: ktsWhiteMediumTextStyle.copyWith(
                                  color: kcPrimaryColor,
                                  fontSize: 23,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Welcome back',
                                style: ktsSmallWhiteTextStyle.copyWith(
                                    color: kcPrimaryColor, fontSize: 17),
                              ),
                            ),
                          ),
                          verticalSpaceMedium,
                          verticalSpaceSmall,
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: Center(
                              child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    verticalSpaceSmall,
                                    InputField(
                                      controller: emailController,
                                      maxLine: 1,
                                      hasFocusedBorder: true,
                                      textInputType: TextInputType.emailAddress,
                                      isReadOnly: model.isBusy,
                                      nextFocusNode: FocusScope.of(context),
                                      placeholder: 'Email',
                                    ),
                                    verticalSpaceMedium,
                                    InputField(
                                      obscureText: true,
                                      maxLine: 1,
                                      hasFocusedBorder: true,
                                      isReadOnly: model.isBusy,
                                      controller: passwordController,
                                      placeholder: 'Password',
                                      nextFocusNode: FocusScope.of(context),
                                    ),
                                    verticalSpaceSmall,
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: TextButton(
                                        onPressed: () => null,
                                        style: ButtonStyle(
                                          splashFactory: NoSplash.splashFactory,
                                          padding: MaterialStateProperty.all(
                                            EdgeInsets.fromLTRB(5, 0, 5, 15),
                                          ),
                                        ),
                                        child: Text(
                                          'Forgot Password?',
                                          style: ktsBoldMeidumDarkTextStyle
                                              .copyWith(
                                            color: kcPrimaryColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                    verticalSpaceMedium,
                                    AppButton(
                                      title: 'Login',
                                      busy: model.isBusy,
                                      onTap: () {
                                        FocusScope.of(context).unfocus();
                                        model.loginWithEmail();
                                      },
                                      enabled: !model.isBusy,
                                    )
                                  ]),
                            ),
                          ),
                          verticalSpaceSmall,
                          Padding(
                            padding: appSymmetricEdgePadding,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Don't have an account?",
                                  style: ktsDarkGreyTextStyle,
                                ),
                                TextButton(
                                  onPressed: model.onSignUp,
                                  child: Text(
                                    'Sign up',
                                    style: ktsGreenBoldTextStyle.copyWith(
                                        fontWeight: FontWeight.w600),
                                  ),
                                )
                              ],
                            ),
                          ),
                          verticalSpaceMedium,
                          Text(
                            'Continue with social account',
                            style: ktsMediumDarkTextStyle.copyWith(
                                fontWeight: FontWeight.w200),
                          ),
                          verticalSpaceMedium,
                          Padding(
                              padding: appSymmetricEdgePadding,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  GestureDetector(
                                    onTap: model.signInWithGoogle,
                                    child: const SizedBox(
                                      height: 40,
                                      width: 40,
                                      child: ImageBuilder(
                                          imagePath:
                                              'assets/images/place_holders/google_icon.png'),
                                    ),
                                  ),
                                  const Icon(
                                    FontAwesomeIcons.facebook,
                                    size: 40,
                                    color: kcPrimaryColor,
                                  ),
                                  const Icon(
                                    FontAwesomeIcons.apple,
                                    size: 40,
                                  )
                                ],
                              ))
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
