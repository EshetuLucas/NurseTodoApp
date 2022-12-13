import 'package:dexter_code_test/services/authentication_service.dart';
import 'package:dexter_code_test/services/resident_service.dart';
import 'package:dexter_code_test/services/shift_service.dart';
import 'package:dexter_code_test/services/task_service.dart';
import 'package:dexter_code_test/services/user_service.dart';
import 'package:dexter_code_test/ui/views/create_resident/create_resident_view.dart';
import 'package:dexter_code_test/ui/views/login/login_view.dart';
import 'package:dexter_code_test/ui/views/residents/residents_view.dart';
import 'package:dexter_code_test/ui/views/signup/signup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';
import 'package:stacked_services/stacked_services.dart';

import '../ui/views/home/home_view.dart';

@StackedApp(
  routes: [
    CupertinoRoute(page: HomeView),
    CupertinoRoute(page: CreateResidentView),
    CupertinoRoute(page: ResidentsView),
    CupertinoRoute(page: LoginView),
    CupertinoRoute(page: SignUpView),
  ],
  dependencies: [
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: SnackbarService),
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: UserService),
    LazySingleton(classType: TaskService),
    LazySingleton(classType: ShiftService),
    LazySingleton(classType: ResidentService),
    LazySingleton(classType: AuthenticationService),
    LazySingleton(classType: FirebaseAuthenticationService),
  ],
  logger: StackedLogger(),
)
class AppSetUp {}
