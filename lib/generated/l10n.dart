// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Tharad Tech`
  String get appName {
    return Intl.message('Tharad Tech', name: 'appName', desc: '', args: []);
  }

  /// `Welcome Back, Please Login.`
  String get loginScreenTitle {
    return Intl.message(
      'Welcome Back, Please Login.',
      name: 'loginScreenTitle',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get loginScreenEmail {
    return Intl.message('Email', name: 'loginScreenEmail', desc: '', args: []);
  }

  /// `Enter your email`
  String get loginScreenEmailHint {
    return Intl.message(
      'Enter your email',
      name: 'loginScreenEmailHint',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get loginScreenPassword {
    return Intl.message(
      'Password',
      name: 'loginScreenPassword',
      desc: '',
      args: [],
    );
  }

  /// `Enter your password`
  String get loginScreenPasswordHint {
    return Intl.message(
      'Enter your password',
      name: 'loginScreenPasswordHint',
      desc: '',
      args: [],
    );
  }

  /// `Remember Me`
  String get loginScreenRememberMe {
    return Intl.message(
      'Remember Me',
      name: 'loginScreenRememberMe',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password?`
  String get loginScreenForgotPassword {
    return Intl.message(
      'Forgot Password?',
      name: 'loginScreenForgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get loginScreenLoginButton {
    return Intl.message(
      'Login',
      name: 'loginScreenLoginButton',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid email address.`
  String get loginScreenInvalidEmail {
    return Intl.message(
      'Please enter a valid email address.',
      name: 'loginScreenInvalidEmail',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your password.`
  String get loginScreenInvalidPassword {
    return Intl.message(
      'Please enter your password.',
      name: 'loginScreenInvalidPassword',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account?`
  String get loginScreenDontHaveAccount {
    return Intl.message(
      'Don\'t have an account?',
      name: 'loginScreenDontHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get loginScreenSignUp {
    return Intl.message(
      'Sign Up',
      name: 'loginScreenSignUp',
      desc: '',
      args: [],
    );
  }

  /// `Login successful!`
  String get loginScreenSuccess {
    return Intl.message(
      'Login successful!',
      name: 'loginScreenSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Login failed. Please check your credentials.`
  String get loginScreenFailure {
    return Intl.message(
      'Login failed. Please check your credentials.',
      name: 'loginScreenFailure',
      desc: '',
      args: [],
    );
  }

  /// `Create a New Account.`
  String get registerScreenTitle {
    return Intl.message(
      'Create a New Account.',
      name: 'registerScreenTitle',
      desc: '',
      args: [],
    );
  }

  /// `Profile Picture`
  String get registerChooseProfilePicture {
    return Intl.message(
      'Profile Picture',
      name: 'registerChooseProfilePicture',
      desc: '',
      args: [],
    );
  }

  /// `Choose Profile Picture`
  String get registerChooseProfilePictureHint {
    return Intl.message(
      'Choose Profile Picture',
      name: 'registerChooseProfilePictureHint',
      desc: '',
      args: [],
    );
  }

  /// `Choose Photo Source`
  String get registerScreenChoosePhotoSource {
    return Intl.message(
      'Choose Photo Source',
      name: 'registerScreenChoosePhotoSource',
      desc: '',
      args: [],
    );
  }

  /// `Camera`
  String get registerScreenCamera {
    return Intl.message(
      'Camera',
      name: 'registerScreenCamera',
      desc: '',
      args: [],
    );
  }

  /// `Gallery`
  String get registerScreenGallery {
    return Intl.message(
      'Gallery',
      name: 'registerScreenGallery',
      desc: '',
      args: [],
    );
  }

  /// `Allowed file types: PNG, JPEG`
  String get registerAvailableImages {
    return Intl.message(
      'Allowed file types: PNG, JPEG',
      name: 'registerAvailableImages',
      desc: '',
      args: [],
    );
  }

  /// `Username`
  String get registerScreenName {
    return Intl.message(
      'Username',
      name: 'registerScreenName',
      desc: '',
      args: [],
    );
  }

  /// `Enter your username`
  String get registerScreenNameHint {
    return Intl.message(
      'Enter your username',
      name: 'registerScreenNameHint',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get registerScreenEmail {
    return Intl.message(
      'Email',
      name: 'registerScreenEmail',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email`
  String get registerScreenEmailHint {
    return Intl.message(
      'Enter your email',
      name: 'registerScreenEmailHint',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get registerScreenPassword {
    return Intl.message(
      'Password',
      name: 'registerScreenPassword',
      desc: '',
      args: [],
    );
  }

  /// `Enter your password`
  String get registerScreenPasswordHint {
    return Intl.message(
      'Enter your password',
      name: 'registerScreenPasswordHint',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get registerScreenConfirmPassword {
    return Intl.message(
      'Confirm Password',
      name: 'registerScreenConfirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Re-enter your password`
  String get registerScreenConfirmPasswordHint {
    return Intl.message(
      'Re-enter your password',
      name: 'registerScreenConfirmPasswordHint',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get registerScreenSignUpButton {
    return Intl.message(
      'Sign Up',
      name: 'registerScreenSignUpButton',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get registerScreenAlreadyHaveAccount {
    return Intl.message(
      'Already have an account?',
      name: 'registerScreenAlreadyHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get registerScreenLogin {
    return Intl.message(
      'Login',
      name: 'registerScreenLogin',
      desc: '',
      args: [],
    );
  }

  /// `Registration successful!`
  String get registerScreenSuccess {
    return Intl.message(
      'Registration successful!',
      name: 'registerScreenSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Registration failed. Please try again.`
  String get registerScreenFailure {
    return Intl.message(
      'Registration failed. Please try again.',
      name: 'registerScreenFailure',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[Locale.fromSubtags(languageCode: 'en')];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
