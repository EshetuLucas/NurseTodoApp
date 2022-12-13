import 'package:dexter_code_test/app/app.locator.dart';
import 'package:dexter_code_test/app/app.logger.dart';
import 'package:dexter_code_test/datamodels/user_model/user_model.dart';
import 'package:dexter_code_test/enums/user_type.dart';
import 'package:dexter_code_test/services/user_service.dart';
import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';
import 'package:tuple/tuple.dart';

class AuthenticationService {
  final log = getLogger('AuthenticationService');
  final _firebaseAuthService = locator<FirebaseAuthenticationService>();
  final _userService = locator<UserService>();

  Future<FirebaseAuthenticationResult> createAccountWithEmail({
    required String email,
    required String password,
    required String fistName,
    required String lastName,
  }) async {
    log.v('email "$email", password "$password"');

    final result = await _firebaseAuthService.createAccountWithEmail(
      email: email,
      password: password,
    );

    if (result.hasError) return result;

    await _createUser(result: result, firstName: fistName, lastName: lastName);

    return result;
  }

  Future<dynamic> _createUser({
    required FirebaseAuthenticationResult result,
    required String firstName,
    required String lastName,
  }) async {
    final user = result.user;
    if (user == null) return;

    UserModel parsedUser = UserModel(
      id: user.uid,
      email: user.email,
      userType: UserType.nurse,
      createdAt: DateTime.now(),
      firstName: firstName,
      lastName: lastName,
    );

    bool userExists = await _fetchIfUserExists(user.uid);

    if (!userExists) {
      await _userService.createWithId(
        documentId: user.uid,
        payload: parsedUser,
      );
    }
    _userService.setCurrentUser(parsedUser);

    return parsedUser;
  }

  Future<bool> _fetchIfUserExists(String uid) async {
    final user = await _userService.find(documentId: uid);
    if (user != null) {
      _userService.setCurrentUser(user);
    }
    return user != null;
  }

  Future<FirebaseAuthenticationResult> loginWithEmail({
    required String email,
    required String password,
  }) async {
    log.v('Logging in with email "$email"');

    final result = await _firebaseAuthService.loginWithEmail(
      email: email,
      password: password,
    );

    if (result.hasError) return result;

    await _fetchIfUserExists(result.user!.uid);

    return result;
  }

  Tuple2<String?, String?> parseDisplayName(String? name) {
    final fullName = name?.split(' ') ?? [];
    Tuple2<String?, String?> parsedName = const Tuple2(null, null);

    if (fullName.isNotEmpty) {
      if (fullName.length >= 2) {
        parsedName = parsedName.withItem2(fullName.removeLast());
      }
      parsedName = parsedName.withItem1(fullName.join(' '));
    }
    return parsedName;
  }
}
