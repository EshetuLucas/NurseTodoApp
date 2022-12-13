import 'package:dexter_code_test/ui/views/home/home_view.dart';
import 'package:dexter_code_test/ui/views/login/login_view.dart';
import 'package:firebase_core/firebase_core.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

import 'app/app.locator.dart';
import 'app/app.router.dart';
import 'ui/bottom_sheet/setup_bottom_sheet_ui.dart';
import 'ui/ui_helpers/app_colors.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await setupLocator();
  setupBottomSheetUi();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
        fontFamily: 'Poppins',
        scaffoldBackgroundColor: kcWhite,
        textTheme: const TextTheme(
          bodyText2: TextStyle(
            fontSize: 14.0,
            color: kcDarkGreyColor,
          ),
        ),
      ),
      home: LoginView(),
      onGenerateRoute: StackedRouter().onGenerateRoute,
      navigatorKey: StackedService.navigatorKey,
    );
  }
}
