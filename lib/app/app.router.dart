// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dexter_code_test/ui/views/create_resident/create_resident_view.dart'
    as _i3;
import 'package:dexter_code_test/ui/views/home/home_view.dart' as _i2;
import 'package:dexter_code_test/ui/views/login/login_view.dart' as _i5;
import 'package:dexter_code_test/ui/views/residents/residents_view.dart' as _i4;
import 'package:dexter_code_test/ui/views/signup/signup_view.dart' as _i6;
import 'package:flutter/cupertino.dart' as _i7;
import 'package:flutter/material.dart' as _i8;
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i9;

class Routes {
  static const homeView = '/home-view';

  static const createResidentView = '/create-resident-view';

  static const residentsView = '/residents-view';

  static const loginView = '/login-view';

  static const signUpView = '/sign-up-view';

  static const all = <String>{
    homeView,
    createResidentView,
    residentsView,
    loginView,
    signUpView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.homeView,
      page: _i2.HomeView,
    ),
    _i1.RouteDef(
      Routes.createResidentView,
      page: _i3.CreateResidentView,
    ),
    _i1.RouteDef(
      Routes.residentsView,
      page: _i4.ResidentsView,
    ),
    _i1.RouteDef(
      Routes.loginView,
      page: _i5.LoginView,
    ),
    _i1.RouteDef(
      Routes.signUpView,
      page: _i6.SignUpView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.HomeView: (data) {
      return _i7.CupertinoPageRoute<dynamic>(
        builder: (context) => _i2.HomeView(),
        settings: data,
      );
    },
    _i3.CreateResidentView: (data) {
      final args = data.getArgs<CreateResidentViewArguments>(
        orElse: () => const CreateResidentViewArguments(),
      );
      return _i7.CupertinoPageRoute<dynamic>(
        builder: (context) => _i3.CreateResidentView(key: args.key),
        settings: data,
      );
    },
    _i4.ResidentsView: (data) {
      return _i7.CupertinoPageRoute<dynamic>(
        builder: (context) => const _i4.ResidentsView(),
        settings: data,
      );
    },
    _i5.LoginView: (data) {
      final args = data.getArgs<LoginViewArguments>(
        orElse: () => const LoginViewArguments(),
      );
      return _i7.CupertinoPageRoute<dynamic>(
        builder: (context) => _i5.LoginView(key: args.key),
        settings: data,
      );
    },
    _i6.SignUpView: (data) {
      final args = data.getArgs<SignUpViewArguments>(
        orElse: () => const SignUpViewArguments(),
      );
      return _i7.CupertinoPageRoute<dynamic>(
        builder: (context) => _i6.SignUpView(key: args.key),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;
  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class CreateResidentViewArguments {
  const CreateResidentViewArguments({this.key});

  final _i8.Key? key;
}

class LoginViewArguments {
  const LoginViewArguments({this.key});

  final _i8.Key? key;
}

class SignUpViewArguments {
  const SignUpViewArguments({this.key});

  final _i8.Key? key;
}

extension NavigatorStateExtension on _i9.NavigationService {
  Future<dynamic> navigateToHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToCreateResidentView({
    _i8.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.createResidentView,
        arguments: CreateResidentViewArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToResidentsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.residentsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToLoginView({
    _i8.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.loginView,
        arguments: LoginViewArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSignUpView({
    _i8.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.signUpView,
        arguments: SignUpViewArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
