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

  /// `Please check Remember Me to continue.`
  String get loginScreenRememberMeRequired {
    return Intl.message(
      'Please check Remember Me to continue.',
      name: 'loginScreenRememberMeRequired',
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

  /// `Login failed. Please try again.`
  String get loginScreenFailure {
    return Intl.message(
      'Login failed. Please try again.',
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

  /// `Image size exceeds 5 MB. Please choose a smaller image.`
  String get imageSizeExceeds5MB {
    return Intl.message(
      'Image size exceeds 5 MB. Please choose a smaller image.',
      name: 'imageSizeExceeds5MB',
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

  /// `OK`
  String get showCustomSnackBarOk {
    return Intl.message('OK', name: 'showCustomSnackBarOk', desc: '', args: []);
  }

  /// `Verify Your Email`
  String get otpScreenTitle {
    return Intl.message(
      'Verify Your Email',
      name: 'otpScreenTitle',
      desc: '',
      args: [],
    );
  }

  /// `Enter the 4-digit code sent to your email.`
  String get otpScreenSubtitle {
    return Intl.message(
      'Enter the 4-digit code sent to your email.',
      name: 'otpScreenSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Resend Code`
  String get otpScreenResendCode {
    return Intl.message(
      'Resend Code',
      name: 'otpScreenResendCode',
      desc: '',
      args: [],
    );
  }

  /// `Clear Code`
  String get otpScreenClearCode {
    return Intl.message(
      'Clear Code',
      name: 'otpScreenClearCode',
      desc: '',
      args: [],
    );
  }

  /// `Verify`
  String get otpScreenVerifyButton {
    return Intl.message(
      'Verify',
      name: 'otpScreenVerifyButton',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid 4-digit code.`
  String get otpScreenInvalidCode {
    return Intl.message(
      'Please enter a valid 4-digit code.',
      name: 'otpScreenInvalidCode',
      desc: '',
      args: [],
    );
  }

  /// `Verification successful!`
  String get otpScreenSuccess {
    return Intl.message(
      'Verification successful!',
      name: 'otpScreenSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Verification failed. Please try again.`
  String get otpScreenFailure {
    return Intl.message(
      'Verification failed. Please try again.',
      name: 'otpScreenFailure',
      desc: '',
      args: [],
    );
  }

  /// `Home Page`
  String get homeScreenWelcome {
    return Intl.message(
      'Home Page',
      name: 'homeScreenWelcome',
      desc: '',
      args: [],
    );
  }

  /// `Edit Profile`
  String get homeScreenEditProfile {
    return Intl.message(
      'Edit Profile',
      name: 'homeScreenEditProfile',
      desc: '',
      args: [],
    );
  }

  /// `Theme`
  String get homeScreenTheme {
    return Intl.message('Theme', name: 'homeScreenTheme', desc: '', args: []);
  }

  /// `Quick Actions`
  String get homeScreenQuickActions {
    return Intl.message(
      'Quick Actions',
      name: 'homeScreenQuickActions',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get homeScreenLogout {
    return Intl.message('Logout', name: 'homeScreenLogout', desc: '', args: []);
  }

  /// `Logout Confirmation`
  String get homeLogoutConfirmationTitle {
    return Intl.message(
      'Logout Confirmation',
      name: 'homeLogoutConfirmationTitle',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to logout?`
  String get homeScreenLogoutConfirmation {
    return Intl.message(
      'Are you sure you want to logout?',
      name: 'homeScreenLogoutConfirmation',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get homeScreenCancel {
    return Intl.message('Cancel', name: 'homeScreenCancel', desc: '', args: []);
  }

  /// `Choose App Theme`
  String get homeThemeBottomSheet {
    return Intl.message(
      'Choose App Theme',
      name: 'homeThemeBottomSheet',
      desc: '',
      args: [],
    );
  }

  /// `Light Theme`
  String get homeThemeLight {
    return Intl.message(
      'Light Theme',
      name: 'homeThemeLight',
      desc: '',
      args: [],
    );
  }

  /// `Use the light theme for better visibility in bright environments.`
  String get homeLightThemeDescription {
    return Intl.message(
      'Use the light theme for better visibility in bright environments.',
      name: 'homeLightThemeDescription',
      desc: '',
      args: [],
    );
  }

  /// `Dark Theme`
  String get homeThemeDark {
    return Intl.message(
      'Dark Theme',
      name: 'homeThemeDark',
      desc: '',
      args: [],
    );
  }

  /// `Use the dark theme to reduce eye strain in low light conditions.`
  String get homeDarkThemeDescription {
    return Intl.message(
      'Use the dark theme to reduce eye strain in low light conditions.',
      name: 'homeDarkThemeDescription',
      desc: '',
      args: [],
    );
  }

  /// `System Default`
  String get homeThemeSystem {
    return Intl.message(
      'System Default',
      name: 'homeThemeSystem',
      desc: '',
      args: [],
    );
  }

  /// `Automatically switch themes based on your device settings.`
  String get homeSystemThemeDescription {
    return Intl.message(
      'Automatically switch themes based on your device settings.',
      name: 'homeSystemThemeDescription',
      desc: '',
      args: [],
    );
  }

  /// `Edit Your Profile`
  String get editProfileScreenTitle {
    return Intl.message(
      'Edit Your Profile',
      name: 'editProfileScreenTitle',
      desc: '',
      args: [],
    );
  }

  /// `Old Password`
  String get editProfileOldPassword {
    return Intl.message(
      'Old Password',
      name: 'editProfileOldPassword',
      desc: '',
      args: [],
    );
  }

  /// `Enter your old password`
  String get editProfileOldPasswordHint {
    return Intl.message(
      'Enter your old password',
      name: 'editProfileOldPasswordHint',
      desc: '',
      args: [],
    );
  }

  /// `New Password`
  String get editProfileNewPassword {
    return Intl.message(
      'New Password',
      name: 'editProfileNewPassword',
      desc: '',
      args: [],
    );
  }

  /// `Enter your new password`
  String get editProfileNewPasswordHint {
    return Intl.message(
      'Enter your new password',
      name: 'editProfileNewPasswordHint',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get editProfileConfirmPassword {
    return Intl.message(
      'Confirm Password',
      name: 'editProfileConfirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Re-enter your new password`
  String get editProfileConfirmPasswordHint {
    return Intl.message(
      'Re-enter your new password',
      name: 'editProfileConfirmPasswordHint',
      desc: '',
      args: [],
    );
  }

  /// `Save Changes`
  String get editProfileSaveButton {
    return Intl.message(
      'Save Changes',
      name: 'editProfileSaveButton',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
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
